import '../../data/models/request/movies_list_request_model.dart';
import '../../data/models/response/movies_list_response_model.dart';

abstract class MoviesListRepository {
  Future<MoviesListResponseModel> getMoviesList({required MoviesListRequestModel moviesListRequestModel});
}
