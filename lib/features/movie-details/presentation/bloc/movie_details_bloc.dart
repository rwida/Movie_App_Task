import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';

import '../../../../core/common/app_logger.dart';
import '../../../movies-type-list/data/models/response/movies_type_genres_response_model.dart';
import '../../data/models/response/movie_details_response_model.dart';
import '../../domain/use_cases/get_movie_details_use_case.dart';
import 'movie_details_event.dart';
import 'movie_details_state.dart';

@Injectable()
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(
    this._getMovieDetailsUseCase,
    this._logger,
  ) : super(MovieDetailsUninitializedState()) {
    on<MovieDetailsFetchEvent>(_getMovieDetails);
  }

  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  final AppLogger _logger;
  Box<MovieDetailsResponseModel>? _movieDetailsBox;
  Box<MoviesTypeGenresResponseModel>? _moviesTypeGenresBox;

  Future<void> _initializeHive() async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

    // Register Hive adapters
    if (!Hive.isAdapterRegistered(100)) {
      Hive.registerAdapter<MovieDetailsResponseModel>(MovieDetailsResponseModelAdapter());
    }
    if (!Hive.isAdapterRegistered(200)) {
      Hive.registerAdapter<MoviesTypeGenresResponseModel>(MoviesTypeGenresResponseModelAdapter());
    }
  }

  Future<void> _getMovieDetails(MovieDetailsFetchEvent event, Emitter<MovieDetailsState> emit) async {
    try {
      _logger.debug('_getMovieDetails Loading');

      // Initialize Hive
      await _initializeHive();

      // Open the Hive boxes
      if (_movieDetailsBox == null || !_movieDetailsBox!.isOpen) {
        _movieDetailsBox = await Hive.openBox<MovieDetailsResponseModel>('movie_details');
      }
      if (_moviesTypeGenresBox == null || !_moviesTypeGenresBox!.isOpen) {
        _moviesTypeGenresBox = await Hive.openBox<MoviesTypeGenresResponseModel>('movies_type_genres');
      }

      // Check if movie details exist in the local database
      if (_movieDetailsBox!.containsKey(event.movieDetailsRequestModel.movieId)) {
        final movieDetailsResponseModel = _movieDetailsBox!.get(event.movieDetailsRequestModel.movieId);
        _logger.debug('_getMovieDetails Success (Local)');
        emit(MovieDetailsSuccessState(movieDetailsResponseModel: movieDetailsResponseModel!));
      } else {
        emit(MovieDetailsLoadingState());

        // Fetch movie details from the API
        final movieDetailsResponseModel = await _getMovieDetailsUseCase(params: event.movieDetailsRequestModel);

        // Cache the fetched movie details in the local database
        _movieDetailsBox!.put(event.movieDetailsRequestModel.movieId, movieDetailsResponseModel);

        _logger.debug('_getMovieDetails Success (API)');
        emit(MovieDetailsSuccessState(movieDetailsResponseModel: movieDetailsResponseModel));
      }
    } catch (e, trace) {
      _logger.error('_getMovieDetails Error: $e', trace);
      emit(MovieDetailsFailedState(error: e.toString()));
    }
  }
}

/// Hive adapter for MovieDetailsResponseModel
class MovieDetailsResponseModelAdapter extends TypeAdapter<MovieDetailsResponseModel> {
  @override
  final int typeId = 100;

  @override
  MovieDetailsResponseModel read(BinaryReader reader) {
    return MovieDetailsResponseModel.fromJson(reader.readMap().cast<String, dynamic>());
  }

  @override
  void write(BinaryWriter writer, MovieDetailsResponseModel obj) {
    writer.writeMap(obj.toJson());
  }
}

/// Hive adapter for MoviesTypeGenresResponseModel
class MoviesTypeGenresResponseModelAdapter extends TypeAdapter<MoviesTypeGenresResponseModel> {
  @override
  final int typeId = 200;

  @override
  MoviesTypeGenresResponseModel read(BinaryReader reader) {
    return MoviesTypeGenresResponseModel.fromJson(reader.readMap().cast<String, dynamic>());
  }

  @override
  void write(BinaryWriter writer, MoviesTypeGenresResponseModel obj) {
    writer.writeMap(obj.toJson());
  }
}
