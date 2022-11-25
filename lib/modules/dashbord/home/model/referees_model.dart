
import 'dart:convert';

class RefereesModel {
  RefereesModel({
    this.referees,
  });

  final List<Referee>? referees;

  factory RefereesModel.fromRawJson(String str) => RefereesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RefereesModel.fromJson(Map<String, dynamic> json) => RefereesModel(
    referees: List<Referee>.from(jsonDecode(json['\$'])["referees"].map((x) => Referee.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "referees": List<dynamic>.from(referees!.map((x) => x.toJson())),
  };
}

class Referee {
  Referee({
    this.name,
    this.refereeType,
    this.ccode,
  });

  final String? name;
  final String? refereeType;
  final String? ccode;

  factory Referee.fromRawJson(String str) => Referee.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Referee.fromJson(Map<String, dynamic> json) => Referee(
    name: json["name"],
    refereeType: json["refereeType"],
    ccode: json["ccode"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "refereeType": refereeType,
    "ccode": ccode,
  };
}