
class Crew {
  final String name;
  final String department;

  Crew({this.name, this.department});

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(name: json['name'], department: json['department']);
  }
}