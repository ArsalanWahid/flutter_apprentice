// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkMovie _$NetworkMovieFromJson(Map<String, dynamic> json) => NetworkMovie(
      json['Title'] as String,
      json['Year'] as String,
      json['Runtime'] as String,
      json['Genre'] as String,
      json['Director'] as String,
      json['Writer'] as String,
      json['Actors'] as String,
      json['Plot'] as String,
      json['Country'] as String,
      json['Poster'] as String,
      json['imdbRating'] as String,
    );

Map<String, dynamic> _$NetworkMovieToJson(NetworkMovie instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'Runtime': instance.runtime,
      'Genre': instance.genre,
      'Director': instance.director,
      'Writer': instance.writer,
      'Actors': instance.actors,
      'Plot': instance.plot,
      'Country': instance.country,
      'Poster': instance.poster,
      'imdbRating': instance.imdbRating,
    };
