
import 'dart:convert';
class ResoddsModel {
  List<ResolvedOutcome>? resolvedOutcome;
  List<OddsProviders>? oddsProviders;

  ResoddsModel({this.resolvedOutcome, this.oddsProviders});

  ResoddsModel.fromJson(Map<String, dynamic> json) {
    if (jsonDecode(json['\$'])['resolvedOutcome'] != null) {
      resolvedOutcome = <ResolvedOutcome>[];
      jsonDecode(json['\$'])['resolvedOutcome'].forEach((v) {
        resolvedOutcome!.add(ResolvedOutcome.fromJson(v));
      });
    }
    if (jsonDecode(json['\$'])['oddsProviders'] != null) {
      oddsProviders = <OddsProviders>[];
      jsonDecode(json['\$'])['oddsProviders'].forEach((v) {
        oddsProviders!.add(OddsProviders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (resolvedOutcome != null) {
      data['resolvedOutcome'] =
          resolvedOutcome!.map((v) => v.toJson()).toList();
    }
    if (oddsProviders != null) {
      data['oddsProviders'] =
          oddsProviders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResolvedOutcome {
  String? typeOfOdds;
  int? teamId;
  String? subtype;

  ResolvedOutcome({this.typeOfOdds, this.teamId, this.subtype});

  ResolvedOutcome.fromJson(Map<String, dynamic> json) {
    typeOfOdds = json['typeOfOdds'];
    teamId = json['teamId'];
    subtype = json['subtype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['typeOfOdds'] = typeOfOdds;
    data['teamId'] = teamId;
    data['subtype'] = subtype;
    return data;
  }
}

class OddsProviders {
  int? id;
  String? name;
  String? typeOfOdds;
  int? matchId;
  List<Odds>? odds;

  OddsProviders({this.id, this.name, this.typeOfOdds, this.matchId, this.odds});

  OddsProviders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    typeOfOdds = json['typeOfOdds'];
    matchId = json['matchId'];
    if (json['odds'] != null) {
      odds = <Odds>[];
      json['odds'].forEach((v) {
        odds!.add(Odds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['typeOfOdds'] = typeOfOdds;
    data['matchId'] = matchId;
    if (odds != null) {
      data['odds'] = odds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Odds {
  int? teamId;
  String? subtype;
  double? value;

  Odds({this.teamId, this.subtype, this.value});

  Odds.fromJson(Map<String, dynamic> json) {
    teamId = json['teamId'];
    subtype = json['subtype'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['teamId'] = teamId;
    data['subtype'] = subtype;
    data['value'] = value;
    return data;
  }
}
