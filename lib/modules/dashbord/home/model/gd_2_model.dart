import 'dart:convert';

class Gd2Model {
  Gd2Model({
    this.imageHashtags,
    this.minutesPlayer,
    this.commentsPlayer,
    this.split3,
    this.split4,
    this.split5,
    this.split6,
    this.playerId,
    this.split8,
    this.split9,
    this.split10,
    this.split11,
    this.playerModel,
  });

  final String? imageHashtags;
  final String? minutesPlayer;
  final String? commentsPlayer;
  String? split3;
  final String? split4;
  final String? split5;
  final String? split6;
  final String? playerId;
  final String? split8;
  String? split9;
  final String? split10;
  String? split11;

  final PlayerModel? playerModel;

  factory Gd2Model.fromRawJson(String str) => Gd2Model.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<Gd2Model> fromList(json) {
    List<Gd2Model> tempList = [];
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
          tempList.add(Gd2Model.fromJson(element));
        }
      }
    }
    return tempList;
  }

  factory Gd2Model.fromJson(String json) {
    final String imageHashtags = json.split(":")[0];
    final String minutesPlayer = json.split(":")[1];
    final String commentsPlayer = json.split(":")[2];
    final String split3 = json.split(":")[3];
    final String split4 = json.split(":")[4];
    final String split5 = json.split(":")[5];
    final String split6 = json.split(":")[6];
    final String playerId = json.split(":")[7];
    final String split8 = json.split(":")[8];
    final String split9 = json.split(":")[9];
    final String split10 = json.split(":")[10];
    final String split11 = json.split(":")[11];

    return Gd2Model(
      imageHashtags: imageHashtags,
      minutesPlayer: minutesPlayer,
      commentsPlayer: commentsPlayer,
      split3: split3,
      split4: split4,
      split5: split5,
      split6: split6,
      playerId: playerId,
      split8: split8,
      split9: split9,
      split10: split10,
      split11: split11,
    );
  }

  Map<String, dynamic> toJson() => {
        "imageHashtags": imageHashtags,
        "minutesPlayer": minutesPlayer,
        "commentsPlayer": commentsPlayer,
        "split3": split3,
        "split4": split4,
        "split5": split5,
        "split6": split6,
        "playerId": playerId,
        "split8": split8,
        "split9": split9,
        "split10": split10,
        "split11": split11,
      };
}

class PlayerModel {
  List<String>? gd21;
  String? id;

  PlayerModel({this.id, this.gd21});
}
