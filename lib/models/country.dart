class Country {
  final String iso31661;

  Country({this.iso31661});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(iso31661: json['iso_3166_1']);
  }
}
