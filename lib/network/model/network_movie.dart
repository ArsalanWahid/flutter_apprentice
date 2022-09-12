import 'package:json_annotation/json_annotation.dart';

// this is necessary for the generated code to find your class
part 'network_movie.g.dart';

@JsonSerializable()
class NetworkMovie {
  @JsonKey(name: 'Title')
  final String title;
  @JsonKey(name: 'Year')
  final String year;
  @JsonKey(name: 'Runtime')
  final String runtime;
  @JsonKey(name: 'Genre')
  final String genre;
  @JsonKey(name: 'Director')
  final String director;
  @JsonKey(name: 'Writer')
  final String writer;
  @JsonKey(name: 'Actors')
  final String actors;
  @JsonKey(name: 'Plot')
  final String plot;
  @JsonKey(name: 'Country')
  final String country;
  @JsonKey(name: 'Poster')
  final String poster;
  @JsonKey(name: 'imdbRating')
  final String imdbRating;

  NetworkMovie(
      this.title,
      this.year,
      this.runtime,
      this.genre,
      this.director,
      this.writer,
      this.actors,
      this.plot,
      this.country,
      this.poster,
      this.imdbRating);

  factory NetworkMovie.fromJson(final Map<String, dynamic> json) {
    return _$NetworkMovieFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NetworkMovieToJson(this);
}
