import 'package:injectable/injectable.dart';

import '../../../../core/common/usecase.dart';
import '../../data/models/response/movies_type_list_response_model.dart';
import '../repository/get_movies_type_repository.dart';

@Injectable()
class GetMoviesTypeListUseCase extends UseCase<Future<MoviesTypeListResponseModel>, NoParams> {
  GetMoviesTypeListUseCase(this._getMoviesTypeRepository);

  final GetMoviesTypeRepository _getMoviesTypeRepository;

  @override
  Future<MoviesTypeListResponseModel> call({required NoParams params}) async {
    return _getMoviesTypeRepository.getMoviesTypesList();
  }
}
