import '../../data/models/request/movie_details_request_model.dart';
import '../../data/models/response/movie_details_response_model.dart';

abstract class MovieDetailsRepository {
  Future<MovieDetailsResponseModel> getMovieDetails({required MovieDetailsRequestModel movieDetailsRequestModel});
}
