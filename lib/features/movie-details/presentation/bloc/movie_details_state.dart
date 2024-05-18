import 'package:equatable/equatable.dart';

import '../../data/models/response/movie_details_response_model.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => <Object>[];
}

class MovieDetailsUninitializedState extends MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsSuccessState extends MovieDetailsState {
  const MovieDetailsSuccessState({required this.movieDetailsResponseModel});
  final MovieDetailsResponseModel movieDetailsResponseModel;
  @override
  List<Object> get props => <Object>[movieDetailsResponseModel];
}

class MovieDetailsFailedState extends MovieDetailsState {
  const MovieDetailsFailedState({required this.error});
  final String error;
  @override
  List<Object> get props => <Object>[error];
}
