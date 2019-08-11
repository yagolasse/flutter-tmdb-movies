import 'package:movies_flutter/models/credits.dart';

import 'country.dart';
import 'genre.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final int runtime;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;
  final List<Genre> genres;
  final List<Country> productionCountries;
  final Credits credits;

  Movie(
      {this.id,
      this.title,
      this.overview,
      this.posterPath,
      this.runtime,
      this.voteAverage,
      this.voteCount,
      this.releaseDate,
      this.genres,
      this.productionCountries,
      this.credits});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        title: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        runtime: json['runtime'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
        releaseDate: json['release_date'],
        genres: (json['genres'] as List)
            .map((current) => Genre.fromJson(current))
            .toList(),
        productionCountries: (json['production_countries'] as List)
            .map((current) => Country.fromJson(current))
            .toList(),
        credits: Credits.fromJson(json['credits']));
  }

  /// Returns the movie duration in the format 'xh xm'
  String getFormattedRuntime() {
    return "${runtime ~/ 60}h ${runtime % 60}m";
  }

  /// Returns the year that the movie was released
  String getReleasingYear() {
    return releaseDate.substring(0, 4);
  }

  List<String> getFormattedProductionCountries() {
    return productionCountries.map((current) => current.iso31661).toList();
  }

  List<String> getFormattedGenres() {
    return genres.map((current) => current.name).toList();
  }
}
