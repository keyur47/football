import 'dart:convert';

class MSModel {
  MSModel({
    this.groupId,
    this.score1,
    this.score2,
  });

  final String? groupId;
  final String? score1;
  final String? score2;

  factory MSModel.fromRawJson(String str) => MSModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<MSModel> fromList(json) {
    List<MSModel> tempList = [];
    if (json != null) {
      if (json['\$'] != null) {
        List allLineUp = json['\$'].split("#");

        List allLineUpData = [];
        for (var element in allLineUp) {
          if (element.isNotEmpty) {
            allLineUpData.add(element);
          }
        }
        for (var element in allLineUpData) {
          tempList.add(MSModel.fromJson(element));
        }
      }
    }
    return tempList;
  }

  factory MSModel.fromJson(json) {
    final String score1 = json.split(":")[2];
    final String score2 = json.split(":")[1];
    final String groupId = json.split(":")[0];
    return MSModel(
      groupId: groupId,
      score1: score1,
      score2: score2,
    );
  }

  Map<String, dynamic> toJson() => {
        "groupId": groupId,
        "score1": score1,
        "score2": score2,
      };
}
