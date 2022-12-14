// To parse this JSON data, do
//
//     final interviewerTile = interviewerTileFromJson(jsonString);
import 'dart:convert';

class InterviewerTile {
  InterviewerTile({
    required this.name,
    required this.cell,
  });

  final Name name;
  final String cell;

  factory InterviewerTile.fromRawJson(String str) =>
      InterviewerTile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InterviewerTile.fromJson(Map<String, dynamic> json) =>
      InterviewerTile(
        name: Name.fromJson(json["name"]),
        cell: json["cell"],
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "cell": cell,
      };
}

class Name {
  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  final String title;
  final String first;
  final String last;

  factory Name.fromRawJson(String str) => Name.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}
