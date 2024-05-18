// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_type_genres_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesTypeGenresResponseModel _$MoviesTypeGenresResponseModelFromJson(
        Map<String, dynamic> json) =>
    MoviesTypeGenresResponseModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$MoviesTypeGenresResponseModelToJson(
        MoviesTypeGenresResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
