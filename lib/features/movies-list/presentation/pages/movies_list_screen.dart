import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependencies/dependency_init.dart';
import '../../../../core/helper/navigator.dart';
import '../../../../core/ui/resources/app_image_paths.dart';
import '../../../../core/ui/resources/app_pallete.dart';
import '../../../../core/ui/resources/app_routes.dart';
import '../../../../core/ui/resources/app_size_boxes.dart';
import '../../../../core/ui/resources/app_sizes.dart';
import '../../../../core/ui/resources/app_text_styles.dart';
import '../../data/models/response/movies_list_response_model.dart';
import '../../data/models/response/movies_list_results_response_model.dart';
import '../bloc/index.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({super.key, required this.movieTypeID});

  final int movieTypeID;

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  final MoviesListBloc _moviesListBloc = getIt<MoviesListBloc>();

  @override
  void initState() {
    super.initState();
    _moviesListBloc.movieTypeId = widget.movieTypeID;
    _moviesListBloc.add(MoviesListInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbarWidget(),
      backgroundColor: AppPalette.white,
      body: BlocProvider<MoviesListBloc>(
        create: (context) => _moviesListBloc,
        child: BlocBuilder<MoviesListBloc, MoviesListState>(
          builder: (context, state) {
            if (state is MoviesListSuccessState) {
              return Column(
                children: [
                  Expanded(
                    child: _buildListWidget(state.moviesListResponseModel),
                  ),
                  _buildNavigationButtons(state.moviesListResponseModel),
                ],
              );
            }
            return _buildLoadingWidget();
          },
        ),
      ),
    );
  }

  AppBar _buildAppbarWidget() => AppBar(elevation: 0, title: Text('Movies List', style: AppTextStyles.h2), backgroundColor: AppPalette.white, centerTitle: true);

  Widget _buildLoadingWidget() => Center(child: SizedBox(width: 14.w, height: 14.w, child: CircularProgressIndicator(color: AppPalette.blackColor)));

  Widget _buildListWidget(MoviesListResponseModel moviesListResponseModel) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      itemCount: moviesListResponseModel.results?.length,
      itemBuilder: (context, index) {
        final MoviesListResultsResponseModel movie = moviesListResponseModel.results![index];
        return _buildItemListWidget(movie, moviesListResponseModel);
      },
    );
  }

  Widget _buildItemListWidget(MoviesListResultsResponseModel movie, MoviesListResponseModel moviesListResponseModel) {
    return InkWell(
      onTap: () => pushName(context, AppRoute.movieDetailsScreen, arguments: moviesListResponseModel.id),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.01.sh),
        child: Container(
          width: 1.sw,
          height: 0.2.sh,
          decoration: _buildContainerDecoration(movie),
          child: _buildMovieNameAndDescText(movie),
        ),
      ),
    );
  }

  Widget _buildMovieNameAndDescText(MoviesListResultsResponseModel movie) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            movie.name ?? '',
            style: AppTextStyles.h2.copyWith(color: AppPalette.white),
          ),
          if (movie.description != null && movie.description != '') 4.heightBox,
          if (movie.description != null && movie.description != '')
            Text(
              movie.description ?? '',
              style: AppTextStyles.h4.copyWith(color: AppPalette.white),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons(MoviesListResponseModel moviesListResponseModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (moviesListResponseModel.page != 1)
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  _moviesListBloc.add(MoviesListEventPreviousPage());
                },
                style: _buttonStyle(),
                child: Text('Previous', style: AppTextStyles.h3),
              ),
            ),
          if (moviesListResponseModel.page != 1) 4.widthBox,
          if (moviesListResponseModel.page != moviesListResponseModel.totalPages)
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  _moviesListBloc.add(MoviesListEventNextPage());
                },
                style: _buttonStyle(),
                child: Text('Next', style: AppTextStyles.h3),
              ),
            ),
        ],
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.grey[300],
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  BoxDecoration _buildContainerDecoration(MoviesListResultsResponseModel movie) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      color: AppPalette.grey300,
      image: DecorationImage(
        image: movie.posterPath != null ? NetworkImage(movie.posterPath!) : const AssetImage(AppImages.moviePosterPlaceHolder) as ImageProvider,
        fit: BoxFit.cover,
        opacity: 0.7,
      ),
    );
  }
}
