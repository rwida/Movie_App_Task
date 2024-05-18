import '../../data/models/response/movies_type_list_response_model.dart';

abstract class GetMoviesTypeRepository {
  Future<MoviesTypeListResponseModel> getMoviesTypesList();
}
