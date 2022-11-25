// To parse this JSON data, do
//
//     final fixtureModel = fixtureModelFromJson(jsonString);

import 'dart:convert';

import 'package:football/modules/dashbord/home/model/match_model.dart';
import 'package:football/modules/dashbord/home/model/ms_model.dart';

extension E on String {
  String lastChars(int n) => substring(length - n);
}

FixtureModel fixtureModelFromJson(String str) =>
    FixtureModel.fromJson(json.decode(str));

String fixtureModelToJson(FixtureModel data) => json.encode(data.toJson());

class FixtureModel {
  FixtureModel({
    this.root,
  });

  Root? root;

  factory FixtureModel.fromJson(Map<String, dynamic> json) => FixtureModel(
        root: Root.fromJson(json["root"]),
      );

  Map<String, dynamic> toJson() => {
        "root": root?.toJson(),
      };
}

class Root {
  Root({
    this.lu,
    this.lh,
    this.rs,
    this.ms,
    this.tl,
    this.ct,
    this.ts,
    this.ccode,
    this.tbd,
  });

  Lh? lu;
  Lh? lh;
  Lh? rs;
  List<MSModel>? ms;
  Lh? tl;
  Ccode? ct;
  Ccode? ts;
  Ccode? ccode;
  Lh? tbd;

  factory Root.fromJson(Map<String, dynamic> json) => Root(
        lu: Lh.fromJson(json["LU"]),
        lh: Lh.fromJson(json["LH"]),
        rs: Lh.fromJson(json["RS"]),
        ms: MSModel.fromList(json["MS"]),
        tl: Lh.fromJson(json["TL"]),
        ct: Ccode.fromJson(json["CT"]),
        ts: Ccode.fromJson(json["TS"]),
        ccode: Ccode.fromJson(json["CCODE"]),
        tbd: Lh.fromJson(json["TBD"]),
      );

  Map<String, dynamic> toJson() => {
        "LU": lu?.toJson(),
        "LH": lh?.toJson(),
        "RS": rs?.toJson(),
        "MS": List<dynamic>.from(ms!.map((x) => x)),
        "TL": tl?.toJson(),
        "CT": ct?.toJson(),
        "TS": ts?.toJson(),
        "CCODE": ccode?.toJson(),
        "TBD": tbd?.toJson(),
      };
}

class Ccode {
  Ccode();

  factory Ccode.fromJson(Map<String, dynamic> json) => Ccode();

  Map<String, dynamic> toJson() => {};
}

class Lh {
  Lh({
    this.empty,
  });

  String? empty;

  factory Lh.fromJson(Map<String, dynamic> json) => Lh(
        empty: json["\u0024"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024": empty,
      };
}

class TeamsModel {
  TeamsModel({
    this.teamName,
    this.teamId,
    this.teamShortName,
  });

  String? teamName;
  String? teamId;
  String? teamShortName;

  // DataListOver? dataListOver;

  factory TeamsModel.fromJson(String json) {
    String? teamId = json.split(":")[0];
    String? teamName = json.split(":")[1];
    String? teamShortName = json.split(":")[2];

    return TeamsModel(
      teamId: teamId,
      teamName: teamName,
      teamShortName: teamShortName,
    );
  }

  Map<String, dynamic> toJson() => {
        "teamId": teamId,
        "teamName": teamName,
        "teamShortName": teamShortName,
      };
}

class CombineTeamsModel {
  CombineTeamsModel({
    this.team1,
    this.team2,
    this.time,
    this.matchId,
    this.score1,
    this.score2,
  });

  String? time;
  String? matchId;
  TeamsModel? team1;
  TeamsModel? team2;
  String? score1;
  String? score2;

  factory CombineTeamsModel.fromJson(
      String json, String json2, String details, List<MSModel>? ms) {
    MSModel? msModel;
    if (ms != null) {
      msModel = ms.firstWhere((element) {
        if (element != null) {
          return element.groupId == details.split(":")[0];
        } else {
          return false;
        }
      }, orElse: () => MSModel());
    }
    // String time = '';
    // if (details.isNotEmpty) {
    //   String timelast4 =
    //       details.split(":")[3].substring(details.split(":")[3].length - 4);
    //   String timeFirst2 = (int.parse(timelast4.substring(0, 2)) + 1).toString();
    //   String timelast2 =
    //       (int.parse(timelast4.substring(timelast4.length - 2)) + 30)
    //           .toString();
    //   String timeBefore =
    //       details.split(":")[3].substring(0, details.split(":")[3].length - 4);
    //
    //   time = timeBefore + timeFirst2 + timelast2;
    //   print("=====>${details.split(":")[3]} making time --->$time");
    // }
    return CombineTeamsModel(
      time: details.isEmpty ? '' : details.split(":")[3],
      score1: msModel?.score1,
      score2: msModel?.score2,
      matchId: details.isEmpty ? '' : details.split(":")[0].toString(),
      team1: TeamsModel.fromJson(json),
      team2: TeamsModel.fromJson(json2),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "team1": team1?.toJson(),
      "team2": team2?.toJson(),
      "time": time,
      "matchId": matchId,
      'score2': score2,
      'score1': score1,
    };
  }
}
