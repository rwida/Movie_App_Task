import 'package:equatable/equatable.dart';

import '../../data/models/response/movies_list_response_model.dart';

abstract class MoviesListState extends Equatable {
  const MoviesListState();

  @override
  List<Object> get props => <Object>[];
}

class MoviesListUninitializedState extends MoviesListState {}

class MoviesListLoadingState extends MoviesListState {}

class MoviesListSuccessState extends MoviesListState {
  const MoviesListSuccessState({required this.moviesListResponseModel, this.reachedMax = false});
  final MoviesListResponseModel moviesListResponseModel;
  final bool reachedMax;
  @override
  List<Object> get props => <Object>[moviesListResponseModel];
}

class MoviesListFailedState extends MoviesListState {
  const MoviesListFailedState({required this.error});
  final String error;
  @override
  List<Object> get props => <Object>[error];
}
