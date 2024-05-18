// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesListRequestModel _$MoviesListRequestModelFromJson(
        Map<String, dynamic> json) =>
    MoviesListRequestModel(
      page: (json['page'] as num?)?.toInt(),
      movieTypeId: (json['movieTypeId'] as num).toInt(),
    );

Map<String, dynamic> _$MoviesListRequestModelToJson(
        MoviesListRequestModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'movieTypeId': instance.movieTypeId,
    };
