// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesListResponseModel _$MoviesListResponseModelFromJson(
        Map<String, dynamic> json) =>
    MoviesListResponseModel(
      id: (json['id'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MoviesListResultsResponseModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MoviesListResponseModelToJson(
        MoviesListResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
