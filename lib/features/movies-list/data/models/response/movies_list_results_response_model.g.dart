// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list_results_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesListResultsResponseModel _$MoviesListResultsResponseModelFromJson(
        Map<String, dynamic> json) =>
    MoviesListResultsResponseModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      favoriteCount: (json['favorite_count'] as num?)?.toInt(),
      itemCount: (json['item_count'] as num?)?.toInt(),
      listType: json['list_type'] as String?,
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$MoviesListResultsResponseModelToJson(
        MoviesListResultsResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'favorite_count': instance.favoriteCount,
      'item_count': instance.itemCount,
      'list_type': instance.listType,
      'name': instance.name,
      'poster_path': instance.posterPath,
    };
