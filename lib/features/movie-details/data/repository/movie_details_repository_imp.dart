import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/index.dart';
import '../../domain/repository/movie_details_repository.dart';
import '../models/request/movie_details_request_model.dart';
import '../models/response/movie_details_response_model.dart';

@Injectable(as: MovieDetailsRepository)
class MovieDetailsRepositoryImp implements MovieDetailsRepository {
  MovieDetailsRepositoryImp(this._apiService);

  final ApiService _apiService;

  @override
  Future<MovieDetailsResponseModel> getMovieDetails({required MovieDetailsRequestModel movieDetailsRequestModel}) async {
    final Response<dynamic> response = await _apiService.getApi(
      '${AppApiPaths.getMovieDetails}/${movieDetailsRequestModel.movieId}?api_key=${Constants.apiKey}',
    );
    return MovieDetailsResponseModel.fromJson(response.data as Map<String, dynamic>);
  }
}
