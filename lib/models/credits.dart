import 'dart:io';

import 'package:movies_flutter/models/actor.dart';
import 'package:movies_flutter/models/crew.dart';

class Credits {
  final List<Actor> cast;
  final List<Crew> directors;
  final List<Crew> writers;
  
  static const Director = 'Director';
  static const Screenplay = 'Screenplay';

  Credits({this.cast, this.directors, this.writers});

  List<String> getDirectorsNames() {
    return directors.map((crew) => crew.name).toList();
  }

  List<String> getWritersNames() {
    return writers.map((crew) => crew.name).toList();
  }

  factory Credits.fromJson(Map<String, dynamic> json) {
    final mappedCrew =
        (json['crew'] as List).map((current) => Crew.fromJson(current));
    return Credits(
        cast: (json['cast'] as List)
            .map((current) => Actor.fromJson(current))
            .toList(),
        directors: mappedCrew
            .where((crew) => crew.job == Director)
            .toList(),
        writers: mappedCrew
            .where((crew) => crew.job == Screenplay)
            .toList());
  }
}
