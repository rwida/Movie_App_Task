import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/api_response.dart';

part 'movies_list_request_model.g.dart';

@JsonSerializable()
class MoviesListRequestModel extends BaseResponse<dynamic> {
  MoviesListRequestModel({
    this.page,
    required this.movieTypeId,
  });

  factory MoviesListRequestModel.fromJson(Map<String, dynamic> json) => _$MoviesListRequestModelFromJson(json);

  final int? page;
  final int movieTypeId;

  @override
  MoviesListRequestModel fromJson(Map<String, dynamic> json) => MoviesListRequestModel.fromJson(json);

  @override
  List<Object?> get props => [page];

  Map<String, dynamic> toJson() => _$MoviesListRequestModelToJson(this);
}
