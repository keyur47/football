import 'dart:convert';

class MatchModel {
  MatchModel({
    this.groupId,
    this.teamName2,
    this.teamName1,
    this.matchId1,
    this.matchId2,
  });

  final String? groupId;
  final String? teamName1;
  final String? teamName2;

  final String? matchId1;
  final String? matchId2;

  factory MatchModel.fromRawJson(String str) => MatchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<MatchModel> fromList(json) {
    List<MatchModel> tempList = [];
    if (json != null) {
      if (json['\$'] != null) {
        List allLineUp = json['\$'].split("|");

        List allLineUpData = [];
        for (var element in allLineUp) {
          if (element.isNotEmpty) {
            allLineUpData.add(element);
          }
        }
        for (var element in allLineUpData) {
          tempList.add(MatchModel.fromJson(element));
        }
      }
    }
    return tempList;
  }

  factory MatchModel.fromJson(json) {
    final String teamName1 = json['\$'].split("|")[1];
    final String matchId1 = json['\$'].split("|")[2];
    final String teamName2 = json['\$'].split("|")[3];
    final String matchId2 = json['\$'].split("|")[4];
    final String groupId = json['\$'].split("|")[10];
    return MatchModel(
      groupId: groupId,
      teamName2: teamName2,
      teamName1: teamName1,
      matchId1: matchId1,
      matchId2: matchId2,
    );
  }

  Map<String, dynamic> toJson() => {
        "groupId": groupId,
        "teamName2": teamName2,
        "teamName1": teamName1,
        "matchId1": matchId1,
        "matchId2": matchId2,
      };
}
