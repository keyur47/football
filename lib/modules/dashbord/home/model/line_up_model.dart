import 'dart:convert';

class LineUpModel {
  LineUpModel({
    this.id,
    this.name,
    this.goal,
    this.matchId,
    this.wicket,
    this.zero,
  });

  final String? id;
  final String? name;
  final String? goal;
  final String? matchId;
  final String? wicket;
  final String? zero;

  factory LineUpModel.fromRawJson(String str) => LineUpModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<LineUpModel> fromList(json) {
    List<LineUpModel> tempList = [];
    // print("json===>${jsonDecode(json['\$'])}");
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
          tempList.add(LineUpModel.fromJson(element));
        }
      }
    }
    return tempList;
  }

  factory LineUpModel.fromJson(String json) {
    final String id = json.split(":")[0];
    final String matchId = json.split(":")[1];
    final String zero = json.split(":")[2];
    final String name = json.split(":")[3];
    final String goal = json.split(":")[5];
    final String wicket = json.split(":")[6];

    return LineUpModel(
      id: id,
      name: name,
      goal: goal,
      matchId: matchId,
      wicket: wicket,
      zero: zero,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "goal": goal,
        "matchId": matchId,
        "wicket": wicket,
        "zero": zero,
      };
}
