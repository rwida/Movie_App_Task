import 'package:equatable/equatable.dart';

abstract class GetMoviesTypeListEvent extends Equatable {
  const GetMoviesTypeListEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetMoviesTypeListFetchEvent extends GetMoviesTypeListEvent {
  @override
  List<Object> get props => <Object>[];
}
