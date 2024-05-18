import 'package:injectable/injectable.dart';

import '../../../../core/common/usecase.dart';
import '../../data/models/request/movies_list_request_model.dart';
import '../../data/models/response/movies_list_response_model.dart';
import '../repository/movies_list_repository.dart';

@Injectable()
class GetMoviesListUseCase extends UseCase<Future<MoviesListResponseModel>, MoviesListRequestModel> {
  GetMoviesListUseCase(this._getMoviesTypeRepository);

  final MoviesListRepository _getMoviesTypeRepository;

  @override
  Future<MoviesListResponseModel> call({required MoviesListRequestModel params}) async {
    return _getMoviesTypeRepository.getMoviesList(moviesListRequestModel: params);
  }
}
