import 'dart:convert';

class ExternalLineUpModel {
  ExternalLineUpModel({
    this.id,
    this.name,
    this.point,
    this.matchId,
    this.wicket,
  });

  final String? id;
  final String? name;
  final String? point;
  final String? matchId;
  final String? wicket;

  factory ExternalLineUpModel.fromRawJson(String str) => ExternalLineUpModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<ExternalLineUpModel> fromList(json) {
    List<ExternalLineUpModel> tempList = [];
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
          tempList.add(ExternalLineUpModel.fromJson(element));
        }
      }
    }
    return tempList;
  }

  factory ExternalLineUpModel.fromJson(String json) {
    final String id = json.split(":")[0];
    final String matchId = json.split(":")[1];
    final String wicket = json.split(":")[2];
    final String name = json.split(":")[3];
    final String point = json.split(":")[5];

    return ExternalLineUpModel(
      id: id,
      name: name,
      point: point,
      matchId: matchId,
      wicket: wicket,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "point": point,
        "matchId": matchId,
        "wicket": wicket,
      };
}
