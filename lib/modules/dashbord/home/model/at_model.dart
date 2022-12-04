import 'dart:convert';

class ATModel {
  ATModel({
    this.minute45,
    this.minute90,
  });

  final String? minute45;
  final String? minute90;

  factory ATModel.fromRawJson(String str) => ATModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<ATModel> fromList(json) {
    List<ATModel> tempList = [];
    if (json != null) {
      if (json['\$'] != null) {
        print('======>$json');
        List allLineUp = json['\$'].split("#");

        List allLineUpData = [];
        for (var element in allLineUp) {
          if (element.isNotEmpty) {
            allLineUpData.add(element);
          }
        }
        for (var element in allLineUpData) {
          tempList.add(ATModel.fromJson(element));
        }
      }
    }
    return tempList;
  }

  factory ATModel.fromJson(json) {
    print('======jsonjson>$json ');

    final String minute45 = json.split(":")[0];
    final String minute90 = json.split(":")[1];
    print('======minute45minute45minute45minute45>$minute45 ');
    print('======minute90minute90minute90minute90>$minute90 ');

    return ATModel(
      minute45: minute45,
      minute90: minute90,
    );
  }

  Map<String, dynamic> toJson() => {
        "minute45": minute45,
        "minute90": minute90,
      };
}
