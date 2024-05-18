import 'package:injectable/injectable.dart';

import '../../../../core/common/usecase.dart';
import '../../data/models/request/movie_details_request_model.dart';
import '../../data/models/response/movie_details_response_model.dart';
import '../repository/movie_details_repository.dart';

@Injectable()
class GetMovieDetailsUseCase extends UseCase<Future<MovieDetailsResponseModel>, MovieDetailsRequestModel> {
  GetMovieDetailsUseCase(this._movieDetailsRepository);

  final MovieDetailsRepository _movieDetailsRepository;

  @override
  Future<MovieDetailsResponseModel> call({required MovieDetailsRequestModel params}) async {
    return _movieDetailsRepository.getMovieDetails(movieDetailsRequestModel: params);
  }
}
