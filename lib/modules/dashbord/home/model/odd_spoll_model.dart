
import 'dart:convert';

class OddspollModel {
  OddspollModel({
    this.pollName,
    this.matchId,
    this.homeTeamId,
    this.awayTeamId,
    this.homeTeam,
    this.awayTeam,
    this.facts,
  });

  final String? pollName;
  final int? matchId;
  final int? homeTeamId;
  final int? awayTeamId;
  final String? homeTeam;
  final String? awayTeam;
  final List<Fact>? facts;

  factory OddspollModel.fromRawJson(String str) => OddspollModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OddspollModel.fromJson(Map<String, dynamic> json) {
    return OddspollModel(
      pollName: jsonDecode(json['\$'])["PollName"],
      matchId: jsonDecode(json['\$'])["MatchId"],
      homeTeamId: jsonDecode(json['\$'])["HomeTeamId"],
      awayTeamId: jsonDecode(json['\$'])["AwayTeamId"],
      homeTeam: jsonDecode(json['\$'])["HomeTeam"],
      awayTeam: jsonDecode(json['\$'])["AwayTeam"],
      facts: List<Fact>.from(jsonDecode(json['\$'])["Facts"].map((x) => Fact.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "PollName": pollName,
    "MatchId": matchId,
    "HomeTeamId": homeTeamId,
    "AwayTeamId": awayTeamId,
    "HomeTeam": homeTeam,
    "AwayTeam": awayTeam,
    "Facts": List<dynamic>.from(facts!.map((x) => x.toJson())),
  };
}

class Fact {
  Fact({
    this.oddsType,
    this.defaultLabel,
    this.textLabelId,
    this.defaultTemplate,
    this.textTemplateId,
    this.statValues,
    this.defaultLabels,
    this.labelTemplates,
    this.icon,
  });

  final String? oddsType;
  final String? defaultLabel;
  final String? textLabelId;
  final String? defaultTemplate;
  final String? textTemplateId;
  final List<String>? statValues;
  final List<String>? defaultLabels;
  final List<String>? labelTemplates;
  final String ?icon;

  factory Fact.fromRawJson(String str) => Fact.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Fact.fromJson(Map<String, dynamic> json) => Fact(
    oddsType: json["OddsType"],
    defaultLabel: json["DefaultLabel"],
    textLabelId: json["TextLabelId"],
    defaultTemplate: json["DefaultTemplate"],
    textTemplateId: json["TextTemplateId"],
    statValues: List<String>.from(json["StatValues"].map((x) => x)),
    defaultLabels: List<String>.from(json["DefaultLabels"].map((x) => x)),
    labelTemplates: List<String>.from(json["LabelTemplates"].map((x) => x)),
    icon: json["Icon"],
  );

  Map<String, dynamic> toJson() => {
    "OddsType": oddsType,
    "DefaultLabel": defaultLabel,
    "TextLabelId": textLabelId,
    "DefaultTemplate": defaultTemplate,
    "TextTemplateId": textTemplateId,
    "StatValues": List<dynamic>.from(statValues!.map((x) => x)),
    "DefaultLabels": List<dynamic>.from(defaultLabels!.map((x) => x)),
    "LabelTemplates": List<dynamic>.from(labelTemplates!.map((x) => x)),
    "Icon": icon,
  };
}