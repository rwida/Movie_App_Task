import 'package:equatable/equatable.dart';

abstract class MoviesListEvent extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

class MoviesListInitialEvent extends MoviesListEvent {
  @override
  List<Object> get props => <Object>[];
}

class MoviesListRefreshEvent extends MoviesListEvent {
  @override
  List<Object> get props => <Object>[];
}

class MoviesListEventNextPage extends MoviesListEvent {}

class MoviesListEventPreviousPage extends MoviesListEvent {}
