import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/index.dart';
import '../../domain/repository/get_movies_type_repository.dart';
import '../models/response/movies_type_list_response_model.dart';

@Injectable(as: GetMoviesTypeRepository)
class GetMoviesTypeRepositoryImp implements GetMoviesTypeRepository {
  GetMoviesTypeRepositoryImp(this._apiService);

  final ApiService _apiService;

  @override
  Future<MoviesTypeListResponseModel> getMoviesTypesList() async {
    final Response<dynamic> response = await _apiService.getApi(
      '${AppApiPaths.getMoviesTypeList}?api_key=${Constants.apiKey}',
    );
    return MoviesTypeListResponseModel.fromJson(response.data as Map<String, dynamic>);
  }
}
