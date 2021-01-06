import 'dart:convert';

class Characters {
  List<dynamic> results;
  final String name, gender;
  final int height, weight;
  final String previous;
  final int count;

  Characters({
    this.name,
    this.gender,
    this.height,
    this.weight,
    this.results,
    this.previous,
    this.count
  });

  factory Characters.fromJson(Map<String, dynamic> json) {
    return Characters(
      name: json['name'] ?? "",
      gender: json['gender'] ?? "",
      height: json['height'] ?? -1,
      weight: json['mass'] ?? -1,
      results: json['results'] ?? "",
      previous: json['previous'] ?? "",
      count: json['count'] ?? -1
    );
  }

  static Characters mapJson(String responseBody) {
    final mapped = json.decode(responseBody);
    return Characters.fromJson(mapped);
  }
}
