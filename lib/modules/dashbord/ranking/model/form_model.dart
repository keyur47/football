// To parse this JSON data, do
//
//     final formModel = formModelFromJson(jsonString);

import 'dart:convert';

FormModel formModelFromJson(String str) => FormModel.fromJson(json.decode(str));

String formModelToJson(FormModel data) => json.encode(data.toJson());

class FormModel {
  FormModel({
    this.leagueId,
    this.teamForm,
  });

  int? leagueId;
  List<TeamForm>? teamForm;

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        leagueId: json["leagueId"] == null ? null : json["leagueId"],
        teamForm: json["teamForm"] == null ? null : List<TeamForm>.from(json["teamForm"].map((x) => TeamForm.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "leagueId": leagueId == null ? null : leagueId,
        "teamForm": teamForm == null ? null : List<dynamic>.from(teamForm!.map((x) => x.toJson())),
      };
}

class TeamForm {
  TeamForm({
    this.teamId,
    this.form,
  });

  int? teamId;
  List<Form>? form;

  factory TeamForm.fromJson(Map<String, dynamic> json) => TeamForm(
        teamId: json["teamId"] == null ? null : json["teamId"],
        form: json["form"] == null ? null : List<Form>.from(json["form"].map((x) => Form.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "teamId": teamId == null ? null : teamId,
        "form": form == null ? null : List<dynamic>.from(form!.map((x) => x.toJson())),
      };
}

class Form {
  Form({
    this.wdlIndicators,
    this.matches,
    this.formType,
  });

  String? wdlIndicators;
  List<Match>? matches;
  String? formType;

  factory Form.fromJson(Map<String, dynamic> json) => Form(
        wdlIndicators: json["wdlIndicators"] == null ? null : json["wdlIndicators"],
        matches: json["matches"] == null ? null : List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
        formType: json["formType"] == null ? null : json["formType"],
      );

  Map<String, dynamic> toJson() => {
        "wdlIndicators": wdlIndicators == null ? null : wdlIndicators,
        "matches": matches == null ? null : List<dynamic>.from(matches!.map((x) => x.toJson())),
        "formType": formType == null ? null : formType,
      };
}

class Match {
  Match({
    this.matchDate,
    this.matchId,
    this.homeTeamId,
    this.awayTeamId,
    this.homeScore,
    this.awayScore,
    this.homeTeam,
    this.awayTeam,
  });

  DateTime? matchDate;
  int? matchId;
  int? homeTeamId;
  int? awayTeamId;
  int? homeScore;
  int? awayScore;
  String? homeTeam;
  String? awayTeam;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        matchDate: json["matchDate"] == null ? null : DateTime.parse(json["matchDate"]),
        matchId: json["matchId"] == null ? null : json["matchId"],
        homeTeamId: json["homeTeamId"] == null ? null : json["homeTeamId"],
        awayTeamId: json["awayTeamId"] == null ? null : json["awayTeamId"],
        homeScore: json["homeScore"] == null ? null : json["homeScore"],
        awayScore: json["awayScore"] == null ? null : json["awayScore"],
        homeTeam: json["homeTeam"] == null ? null : json["homeTeam"],
        awayTeam: json["awayTeam"] == null ? null : json["awayTeam"],
      );

  Map<String, dynamic> toJson() => {
        "matchDate": matchDate == null ? null : matchDate?.toIso8601String(),
        "matchId": matchId == null ? null : matchId,
        "homeTeamId": homeTeamId == null ? null : homeTeamId,
        "awayTeamId": awayTeamId == null ? null : awayTeamId,
        "homeScore": homeScore == null ? null : homeScore,
        "awayScore": awayScore == null ? null : awayScore,
        "homeTeam": homeTeam == null ? null : homeTeam,
        "awayTeam": awayTeam == null ? null : awayTeam,
      };
}
