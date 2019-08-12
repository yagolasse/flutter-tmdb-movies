class Crew {
  final String name;
  final String department;
  final String job;

  Crew({this.name, this.department, this.job});

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(name: json['name'], department: json['department'], job: json['job']);
  }

  String getName() {
    return name;
  }
}
