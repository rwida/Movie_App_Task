import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependencies/dependency_init.dart';
import '../../../../core/ui/resources/app_image_paths.dart';
import '../../../../core/ui/resources/app_pallete.dart';
import '../../../../core/ui/resources/app_size_boxes.dart';
import '../../../../core/ui/resources/app_sizes.dart';
import '../../../../core/ui/resources/app_text_styles.dart';
import '../../data/models/request/movie_details_request_model.dart';
import '../../data/models/response/movie_details_response_model.dart';
import '../bloc/index.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key, required this.movieID});

  final int movieID;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final MovieDetailsBloc _movieDetailsBloc = getIt<MovieDetailsBloc>();

  @override
  void initState() {
    super.initState();
    _movieDetailsBloc.add(MovieDetailsFetchEvent(movieDetailsRequestModel: MovieDetailsRequestModel(movieId: widget.movieID)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbarWidget(),
      backgroundColor: AppPalette.white,
      body: BlocProvider<MovieDetailsBloc>(
        create: (context) => _movieDetailsBloc,
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsSuccessState) {
              return _buildMovieDetailsWidget(state.movieDetailsResponseModel);
            }
            return _buildLoadingWidget();
          },
        ),
      ),
    );
  }

  AppBar _buildAppbarWidget() => AppBar(elevation: 0, title: Text('Movie Details', style: AppTextStyles.h2), backgroundColor: AppPalette.white, centerTitle: true);

  Widget _buildLoadingWidget() => Center(child: SizedBox(width: 14.w, height: 14.w, child: CircularProgressIndicator(color: AppPalette.blackColor)));

  Widget _buildMovieDetailsWidget(MovieDetailsResponseModel movieDetails) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildMoviePosterWidget(movieDetails),
        16.heightBox,
        _buildMovieTitleText(movieDetails),
        8.heightBox,
        _buildMovieReleaseDate(movieDetails),
        16.heightBox,
        _buildVoteAvgAndCountWidget(movieDetails),
        16.heightBox,
        _buildMovieTagsWidget(movieDetails),
        16.heightBox,
        _buildOverviewWidget(movieDetails),
        16.heightBox,
        _buildAdultContentText(movieDetails),
      ],
    );
  }

  Widget _buildAdultContentText(MovieDetailsResponseModel movieDetails) {
    return Text(
      'Adult Content: ${movieDetails.adult ?? false ? "Yes" : "No"}',
      style: AppTextStyles.body.copyWith(color: Colors.red),
    );
  }

  Widget _buildMovieTagsWidget(MovieDetailsResponseModel movieDetails) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: movieDetails.genres!.map((tag) {
        return Chip(
          label: Text(tag.name ?? '', style: AppTextStyles.h4),
        );
      }).toList(),
    );
  }

  Widget _buildVoteAvgAndCountWidget(MovieDetailsResponseModel movieDetails) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.yellow),
        4.widthBox,
        Text('${movieDetails.voteAverage}', style: AppTextStyles.body),
        8.widthBox,
        Text('(${movieDetails.voteCount} votes)', style: AppTextStyles.body.copyWith(color: Colors.grey)),
      ],
    );
  }

  Widget _buildOverviewWidget(MovieDetailsResponseModel movieDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Overview:', style: AppTextStyles.h4),
        8.heightBox,
        Text(movieDetails.overview ?? '', style: AppTextStyles.body),
      ],
    );
  }

  Widget _buildMovieReleaseDate(MovieDetailsResponseModel movieDetails) {
    return Text(
      'Release Date: ${movieDetails.releaseDate}',
      style: AppTextStyles.body.copyWith(color: Colors.grey),
    );
  }

  Widget _buildMovieTitleText(MovieDetailsResponseModel movieDetails) {
    return Text(
      movieDetails.title ?? '',
      style: AppTextStyles.h2,
    );
  }

  Widget _buildMoviePosterWidget(MovieDetailsResponseModel movieDetails) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: AppPalette.grey300,
        image: DecorationImage(
          image: movieDetails.posterPath != null ? NetworkImage(movieDetails.posterPath!) : const AssetImage(AppImages.moviePosterPlaceHolder) as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
