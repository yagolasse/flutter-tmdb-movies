
class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  Movie({
    this.id,
    this.title,
    this.overview,
    this.posterPath
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path']
    );
  }
}