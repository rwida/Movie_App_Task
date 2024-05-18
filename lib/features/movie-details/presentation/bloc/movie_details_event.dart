import 'package:equatable/equatable.dart';

import '../../data/models/request/movie_details_request_model.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => <Object>[];
}

class MovieDetailsFetchEvent extends MovieDetailsEvent {
  const MovieDetailsFetchEvent({required this.movieDetailsRequestModel});
  final MovieDetailsRequestModel movieDetailsRequestModel;
  @override
  List<Object> get props => <Object>[];
}
