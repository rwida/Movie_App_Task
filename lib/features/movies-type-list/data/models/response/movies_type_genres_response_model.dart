import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/api_response.dart';

part 'movies_type_genres_response_model.g.dart';

@JsonSerializable()
class MoviesTypeGenresResponseModel extends BaseResponse<MoviesTypeGenresResponseModel> {
  MoviesTypeGenresResponseModel({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  factory MoviesTypeGenresResponseModel.fromJson(Map<String, dynamic> json) => _$MoviesTypeGenresResponseModelFromJson(json);

  @override
  MoviesTypeGenresResponseModel fromJson(Map<String, dynamic> json) => MoviesTypeGenresResponseModel.fromJson(json);

  @override
  List<Object> get props => <Object>[id ?? ''];

  Map<String, dynamic> toJson() => _$MoviesTypeGenresResponseModelToJson(this);
}
