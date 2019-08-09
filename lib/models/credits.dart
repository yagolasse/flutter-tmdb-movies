import 'package:movies_flutter/models/actor.dart';
import 'package:movies_flutter/models/crew.dart';

class Credits {
  final List<Actor> cast;
  final List<Crew> directors;
  final List<Crew> writers;

  static const DIRECTING_DEPARTMENT = 'Directing';
  static const WRITING_DEPARTMENT = 'Writing';

  Credits({this.cast, this.directors, this.writers});

  factory Credits.fromJson(Map<String, dynamic> json) {
    final crew = json['crew'] as List;
    return Credits(
        cast: (json['cast'] as List)
            .map((current) => Actor.fromJson(current))
            .toList(),
        directors: crew
            .map((current) => Crew.fromJson(current))
            .where((crew) => crew.department == DIRECTING_DEPARTMENT)
            .toList(),
        writers: crew
            .map((current) => Crew.fromJson(current))
            .where((crew) => crew.department == WRITING_DEPARTMENT)
            .toList());
  }
}
