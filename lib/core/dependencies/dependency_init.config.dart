// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/movie-details/data/repository/movie_details_repository_imp.dart'
    as _i7;
import '../../features/movie-details/domain/repository/movie_details_repository.dart'
    as _i6;
import '../../features/movie-details/domain/use_cases/get_movie_details_use_case.dart'
    as _i11;
import '../../features/movie-details/presentation/bloc/movie_details_bloc.dart'
    as _i15;
import '../../features/movies-list/data/repository/movies_list_repository_imp.dart'
    as _i14;
import '../../features/movies-list/domain/repository/movies_list_repository.dart'
    as _i13;
import '../../features/movies-list/domain/use_cases/get_movies_list_use_case.dart'
    as _i17;
import '../../features/movies-list/presentation/bloc/movies_list_bloc.dart'
    as _i18;
import '../../features/movies-type-list/data/repository/get_movies_type_repository_imp.dart'
    as _i10;
import '../../features/movies-type-list/domain/repository/get_movies_type_repository.dart'
    as _i9;
import '../../features/movies-type-list/domain/use_cases/get_movies_type_use_case.dart'
    as _i12;
import '../../features/movies-type-list/presentation/bloc/get_movies_type_list_bloc.dart'
    as _i16;
import '../common/api_service.dart' as _i5;
import '../common/app_logger.dart' as _i3;
import '../common/index.dart' as _i8;
import 'register_module.dart' as _i19;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppLogger>(() => registerModule.appLogger());
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.lazySingleton<_i4.Dio>(
    () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')),
    instanceName: 'Dio',
  );
  gh.factory<_i5.ApiService>(
      () => _i5.ApiService(gh<_i4.Dio>(instanceName: 'Dio')));
  gh.factory<_i6.MovieDetailsRepository>(
      () => _i7.MovieDetailsRepositoryImp(gh<_i8.ApiService>()));
  gh.factory<_i9.GetMoviesTypeRepository>(
      () => _i10.GetMoviesTypeRepositoryImp(gh<_i8.ApiService>()));
  gh.lazySingleton<_i4.Dio>(
    () => registerModule.dioInterceptor(gh<String>(instanceName: 'BaseUrl')),
    instanceName: 'Interceptor',
  );
  gh.factory<_i11.GetMovieDetailsUseCase>(
      () => _i11.GetMovieDetailsUseCase(gh<_i6.MovieDetailsRepository>()));
  gh.factory<_i12.GetMoviesTypeListUseCase>(
      () => _i12.GetMoviesTypeListUseCase(gh<_i9.GetMoviesTypeRepository>()));
  gh.factory<_i13.MoviesListRepository>(
      () => _i14.MoviesListRepositoryImp(gh<_i8.ApiService>()));
  gh.factory<_i15.MovieDetailsBloc>(() => _i15.MovieDetailsBloc(
        gh<_i11.GetMovieDetailsUseCase>(),
        gh<_i3.AppLogger>(),
      ));
  gh.factory<_i16.GetMoviesTypeListBloc>(() => _i16.GetMoviesTypeListBloc(
        gh<_i12.GetMoviesTypeListUseCase>(),
        gh<_i3.AppLogger>(),
      ));
  gh.factory<_i17.GetMoviesListUseCase>(
      () => _i17.GetMoviesListUseCase(gh<_i13.MoviesListRepository>()));
  gh.factory<_i18.MoviesListBloc>(() => _i18.MoviesListBloc(
        gh<_i17.GetMoviesListUseCase>(),
        gh<_i3.AppLogger>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i19.RegisterModule {}
