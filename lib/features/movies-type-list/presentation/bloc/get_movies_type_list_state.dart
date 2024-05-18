import 'package:equatable/equatable.dart';

import '../../data/models/response/movies_type_list_response_model.dart';

abstract class GetMoviesTypeListState extends Equatable {
  const GetMoviesTypeListState();

  @override
  List<Object> get props => <Object>[];
}

class GetMoviesTypeListUninitializedState extends GetMoviesTypeListState {}

class GetMoviesTypeListLoadingState extends GetMoviesTypeListState {}

class GetMoviesTypeListSuccessState extends GetMoviesTypeListState {
  const GetMoviesTypeListSuccessState({required this.moviesTypeListResponseModel});
  final MoviesTypeListResponseModel moviesTypeListResponseModel;
  @override
  List<Object> get props => <Object>[moviesTypeListResponseModel];
}

class GetMoviesTypeListFailedState extends GetMoviesTypeListState {
  const GetMoviesTypeListFailedState({required this.error});
  final String error;
  @override
  List<Object> get props => <Object>[error];
}
