import 'package:movies_flutter/models/actor.dart';
import 'package:movies_flutter/models/crew.dart';

class Credits {
  final List<Actor> cast;
  final List<Crew> directors;
  final List<Crew> writers;

  final Function toCrewName = (crew) => crew.name;

  static const DIRECTING_DEPARTMENT = 'Directing';
  static const WRITING_DEPARTMENT = 'Writing';

  Credits({this.cast, this.directors, this.writers});

  List<String> getDirectorsNames() {
    return directors.map(toCrewName).toList();
  }

  List<String> getWritersNames() {
    return writers.map(toCrewName).toList();
  }

  factory Credits.fromJson(Map<String, dynamic> json) {
    final mappedCrew =
        (json['crew'] as List).map((current) => Crew.fromJson(current));
    return Credits(
        cast: (json['cast'] as List)
            .map((current) => Actor.fromJson(current))
            .toList(),
        directors: mappedCrew
            .where((crew) => crew.department == DIRECTING_DEPARTMENT)
            .toList(),
        writers: mappedCrew
            .where((crew) => crew.department == WRITING_DEPARTMENT)
            .toList());
  }
}
