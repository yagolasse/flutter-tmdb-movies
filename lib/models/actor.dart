class Actor {
  final int id;
  final String name;
  final String character;
  final String profilePath;

  Actor({this.id, this.name, this.character, this.profilePath});

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
        id: json['id'],
        name: json['name'],
        character: json['character'],
        profilePath: json['profile_path']);
  }
}
