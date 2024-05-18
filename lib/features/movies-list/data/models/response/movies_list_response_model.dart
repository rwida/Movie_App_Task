import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/api_response.dart';
import 'movies_list_results_response_model.dart';

part 'movies_list_response_model.g.dart';

@JsonSerializable()
class MoviesListResponseModel extends BaseResponse<MoviesListResponseModel> {
  MoviesListResponseModel({
    this.id,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  final int? id;
  final int? page;
  final List<MoviesListResultsResponseModel>? results;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_results')
  final int? totalResults;

  factory MoviesListResponseModel.fromJson(Map<String, dynamic> json) => _$MoviesListResponseModelFromJson(json);

  @override
  MoviesListResponseModel fromJson(Map<String, dynamic> json) => MoviesListResponseModel.fromJson(json);

  @override
  List<Object> get props => <Object>[];

  Map<String, dynamic> toJson() => _$MoviesListResponseModelToJson(this);
}
