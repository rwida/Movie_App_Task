import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/api_response.dart';

part 'movie_details_request_model.g.dart';

@JsonSerializable()
class MovieDetailsRequestModel extends BaseResponse<dynamic> {
  MovieDetailsRequestModel({
    required this.movieId,
  });

  factory MovieDetailsRequestModel.fromJson(Map<String, dynamic> json) => _$MovieDetailsRequestModelFromJson(json);

  final int movieId;

  @override
  MovieDetailsRequestModel fromJson(Map<String, dynamic> json) => MovieDetailsRequestModel.fromJson(json);

  @override
  List<Object?> get props => [movieId];

  Map<String, dynamic> toJson() => _$MovieDetailsRequestModelToJson(this);
}
