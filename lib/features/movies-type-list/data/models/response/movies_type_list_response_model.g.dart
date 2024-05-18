// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_type_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesTypeListResponseModel _$MoviesTypeListResponseModelFromJson(
        Map<String, dynamic> json) =>
    MoviesTypeListResponseModel(
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) =>
              MoviesTypeGenresResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesTypeListResponseModelToJson(
        MoviesTypeListResponseModel instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };
