import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/api_response.dart';

part 'movies_list_results_response_model.g.dart';

@JsonSerializable()
class MoviesListResultsResponseModel extends BaseResponse<MoviesListResultsResponseModel> {
  MoviesListResultsResponseModel({
    this.id,
    this.name,
    this.description,
    this.favoriteCount,
    this.itemCount,
    this.listType,
    this.posterPath,
  });

  final int? id;
  final String? description;
  @JsonKey(name: 'favorite_count')
  final int? favoriteCount;
  @JsonKey(name: 'item_count')
  final int? itemCount;
  @JsonKey(name: 'list_type')
  final String? listType;
  final String? name;
  @JsonKey(name: 'poster_path')
  final String? posterPath;

  factory MoviesListResultsResponseModel.fromJson(Map<String, dynamic> json) => _$MoviesListResultsResponseModelFromJson(json);

  @override
  MoviesListResultsResponseModel fromJson(Map<String, dynamic> json) => MoviesListResultsResponseModel.fromJson(json);

  @override
  List<Object> get props => <Object>[id ?? ''];

  Map<String, dynamic> toJson() => _$MoviesListResultsResponseModelToJson(this);
}
