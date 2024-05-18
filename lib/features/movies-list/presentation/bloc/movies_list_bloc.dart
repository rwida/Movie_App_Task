import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/app_logger.dart';
import '../../data/models/request/movies_list_request_model.dart';
import '../../data/models/response/movies_list_response_model.dart';
import '../../domain/use_cases/get_movies_list_use_case.dart';
import 'movies_list_event.dart';
import 'movies_list_state.dart';

@Injectable()
class MoviesListBloc extends Bloc<MoviesListEvent, MoviesListState> {
  MoviesListBloc(
    this._getMoviesListUseCase,
    this._logger,
  ) : super(MoviesListUninitializedState()) {
    on<MoviesListInitialEvent>(_loadMoviesList);
    on<MoviesListRefreshEvent>(_refreshMoviesList);
    on<MoviesListEventNextPage>(_loadNextPageMovieList);
    on<MoviesListEventPreviousPage>(_loadPreviousPageMovieList);
  }

  final GetMoviesListUseCase _getMoviesListUseCase;
  final AppLogger _logger;

  int _pageNumber = 1;
  int? movieTypeId;

  Future<void> _getMoviesList(Emitter<MoviesListState> emit) async {
    try {
      _logger.debug('_getMoviesTypeList Loading');
      emit(MoviesListLoadingState());
      final MoviesListRequestModel moviesListRequestModel = MoviesListRequestModel(page: _pageNumber, movieTypeId: movieTypeId!);
      final MoviesListResponseModel getMoviesTypeGenresResponseModel = await _getMoviesListUseCase(params: moviesListRequestModel);
      _logger.debug('_getMoviesTypeList Success');
      emit(MoviesListSuccessState(moviesListResponseModel: getMoviesTypeGenresResponseModel));
    } catch (e, trace) {
      _logger.error('_getMoviesTypeList Error: $e', trace);
      emit(MoviesListFailedState(error: e.toString()));
    }
  }

  Future<void> _loadMoviesList(MoviesListInitialEvent event, Emitter<MoviesListState> emit) async {
    _logger.info('_loadMoviesList Called');
    _pageNumber = 1;
    await _getMoviesList(emit);
  }

  Future<void> _refreshMoviesList(MoviesListRefreshEvent event, Emitter<MoviesListState> emit) async {
    _logger.info('_refreshMoviesList Called');

    _pageNumber = 1;
    await _getMoviesList(emit);
  }

  Future<void> _loadNextPageMovieList(MoviesListEventNextPage event, Emitter<MoviesListState> emit) async {
    _logger.info('_loadNextPageMovieList Called');

    _pageNumber++;
    await _getMoviesList(emit);
  }

  Future<void> _loadPreviousPageMovieList(MoviesListEventPreviousPage event, Emitter<MoviesListState> emit) async {
    _logger.info('_loadPreviousPageMovieList Called');

    _pageNumber--;
    await _getMoviesList(emit);
  }
}
