import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:new_app/core/common/usecase.dart';

import '../../../../core/common/app_logger.dart';
import '../../data/models/response/movies_type_list_response_model.dart';
import '../../domain/use_cases/get_movies_type_use_case.dart';
import 'get_movies_type_list_event.dart';
import 'get_movies_type_list_state.dart';

@Injectable()
class GetMoviesTypeListBloc extends Bloc<GetMoviesTypeListEvent, GetMoviesTypeListState> {
  GetMoviesTypeListBloc(
    this._getMoviesTypeListUseCase,
    this._logger,
  ) : super(GetMoviesTypeListUninitializedState()) {
    on<GetMoviesTypeListFetchEvent>(_getMoviesTypeList);
  }

  final GetMoviesTypeListUseCase _getMoviesTypeListUseCase;
  final AppLogger _logger;

  Future<void> _getMoviesTypeList(GetMoviesTypeListFetchEvent event, Emitter<GetMoviesTypeListState> emit) async {
    try {
      _logger.debug('_getMoviesTypeList Loading');
      emit(GetMoviesTypeListLoadingState());
      final MoviesTypeListResponseModel getMoviesTypeGenresResponseModel = await _getMoviesTypeListUseCase(params: NoParams());
      _logger.debug('_getMoviesTypeList Success');
      emit(GetMoviesTypeListSuccessState(moviesTypeListResponseModel: getMoviesTypeGenresResponseModel));
    } catch (e, trace) {
      _logger.error('_getMoviesTypeList Error: $e', trace);
      emit(GetMoviesTypeListFailedState(error: e.toString()));
    }
  }
}
