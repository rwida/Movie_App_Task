import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependencies/dependency_init.dart';
import '../../../../core/helper/navigator.dart';
import '../../../../core/ui/resources/app_image_paths.dart';
import '../../../../core/ui/resources/app_pallete.dart';
import '../../../../core/ui/resources/app_routes.dart';
import '../../../../core/ui/resources/app_sizes.dart';
import '../../../../core/ui/resources/app_text_styles.dart';
import '../../data/models/response/movies_type_list_response_model.dart';
import '../bloc/index.dart';

class MoviesTypeListScreen extends StatefulWidget {
  const MoviesTypeListScreen({super.key});

  @override
  State<MoviesTypeListScreen> createState() => _MoviesTypeListScreenState();
}

class _MoviesTypeListScreenState extends State<MoviesTypeListScreen> {
  final GetMoviesTypeListBloc _getMoviesTypeListBloc = getIt<GetMoviesTypeListBloc>();

  @override
  void initState() {
    super.initState();
    _getMoviesTypeListBloc.add(GetMoviesTypeListFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbarWidget(),
      backgroundColor: AppPalette.white,
      body: BlocProvider<GetMoviesTypeListBloc>(
        create: (context) => _getMoviesTypeListBloc,
        child: BlocBuilder<GetMoviesTypeListBloc, GetMoviesTypeListState>(
          builder: (context, state) {
            if (state is GetMoviesTypeListSuccessState) {
              return _buildListWidget(state.moviesTypeListResponseModel);
            }
            return _buildLoadingWidget();
          },
        ),
      ),
    );
  }

  AppBar _buildAppbarWidget() => AppBar(elevation: 0, title: Text('Movies Type', style: AppTextStyles.h1), backgroundColor: AppPalette.white, centerTitle: true);

  Widget _buildLoadingWidget() => Center(child: SizedBox(width: 14.w, height: 14.w, child: CircularProgressIndicator(color: AppPalette.blackColor)));

  Widget _buildListWidget(MoviesTypeListResponseModel moviesTypeGenresResponseModel) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      itemCount: moviesTypeGenresResponseModel.genres?.length,
      itemBuilder: (context, index) {
        return _buildItemListWidget(moviesTypeGenresResponseModel, index);
      },
    );
  }

  Widget _buildItemListWidget(MoviesTypeListResponseModel moviesTypeGenresResponseModel, int index) {
    return InkWell(
      onTap: () {
        pushName(context, AppRoute.moviesListScreen, arguments: moviesTypeGenresResponseModel.genres?[index].id);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.01.sh),
        child: Container(
          width: 1.sw,
          height: 0.12.sh,
          decoration: _buildContainerDecoration(),
          child: _buildMovieTypeNameText(moviesTypeGenresResponseModel, index),
        ),
      ),
    );
  }

  Widget _buildMovieTypeNameText(MoviesTypeListResponseModel moviesTypeGenresResponseModel, int index) {
    return Center(
      child: Text(
        moviesTypeGenresResponseModel.genres?[index].name ?? '',
        style: AppTextStyles.h2,
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      image: const DecorationImage(
        image: AssetImage(AppImages.movieTypeBackground),
        fit: BoxFit.cover,
        opacity: 0.5,
      ),
    );
  }
}
