import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/api_response.dart';
import 'movies_type_genres_response_model.dart';

part 'movies_type_list_response_model.g.dart';

@JsonSerializable()
class MoviesTypeListResponseModel extends BaseResponse<MoviesTypeListResponseModel> {
  MoviesTypeListResponseModel({
    this.genres,
  });

  final List<MoviesTypeGenresResponseModel>? genres;

  factory MoviesTypeListResponseModel.fromJson(Map<String, dynamic> json) => _$MoviesTypeListResponseModelFromJson(json);

  @override
  MoviesTypeListResponseModel fromJson(Map<String, dynamic> json) => MoviesTypeListResponseModel.fromJson(json);

  @override
  List<Object> get props => <Object>[genres ?? ''];

  Map<String, dynamic> toJson() => _$MoviesTypeListResponseModelToJson(this);
}
