import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/index.dart';
import '../../domain/repository/movies_list_repository.dart';
import '../models/request/movies_list_request_model.dart';
import '../models/response/movies_list_response_model.dart';

@Injectable(as: MoviesListRepository)
class MoviesListRepositoryImp implements MoviesListRepository {
  MoviesListRepositoryImp(this._apiService);

  final ApiService _apiService;

  @override
  Future<MoviesListResponseModel> getMoviesList({required MoviesListRequestModel moviesListRequestModel}) async {
    final Response<dynamic> response = await _apiService.getApi(
      '${AppApiPaths.getMoviesList}/${moviesListRequestModel.movieTypeId}/lists?api_key=${Constants.apiKey}&page=${moviesListRequestModel.page}',
    );
    return MoviesListResponseModel.fromJson(response.data as Map<String, dynamic>);
  }
}
