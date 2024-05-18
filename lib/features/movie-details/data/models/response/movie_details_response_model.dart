import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/api_response.dart';
import '../../../../movies-type-list/data/models/response/movies_type_genres_response_model.dart';

part 'movie_details_response_model.g.dart';

@JsonSerializable()
class MovieDetailsResponseModel extends BaseResponse<MovieDetailsResponseModel> {
  MovieDetailsResponseModel({
    this.adult,
    this.backdropPath,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.status,
    this.tagline,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final int? budget;
  final List<MoviesTypeGenresResponseModel>? genres;
  final String? homepage;
  final int? id;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  final String? status;
  final String? tagline;
  final String? title;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  factory MovieDetailsResponseModel.fromJson(Map<String, dynamic> json) => _$MovieDetailsResponseModelFromJson(json);

  @override
  MovieDetailsResponseModel fromJson(Map<String, dynamic> json) => MovieDetailsResponseModel.fromJson(json);

  @override
  List<Object> get props => <Object>[];

  Map<String, dynamic> toJson() => _$MovieDetailsResponseModelToJson(this);
}
