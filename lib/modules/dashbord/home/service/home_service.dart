import 'dart:convert';

import 'package:football/helper/network_helper.dart';
import 'package:football/modules/dashbord/home/model/Fixture_model.dart';
import 'package:football/utils/utils.dart';
import 'package:xml2json/xml2json.dart';

class HomeService {
  static final NetworkAPICall _networkAPICall = NetworkAPICall();
  static final Xml2Json myTransformer = Xml2Json();

  HomeService();

  static Future<List<CombineTeamsModel>> fixtureApi() async {
    try {
      List<CombineTeamsModel> combileTemes = [];
      const String fullURL = "https://data.fotmob.com/league_data.77.fot.gz";
      final response = await _networkAPICall.getWithoutDecode(fullURL);

      String xmlFormat = Utils.instance.xmlFormatString(response);
      myTransformer.parse(xmlFormat);

      var json = myTransformer.toBadgerfish();
      FixtureModel fixtureModel = FixtureModel.fromJson(jsonDecode(json));
      List<String>? tlTagList = fixtureModel.root?.tl?.empty?.split('|');
      List<String>? rsTagList =
          fixtureModel.root?.rs?.empty?.toString().trim().split(',');

      List<String>? tlAllData = [];
      List<String>? rsAllData = [];
      tlTagList?.forEach((element) {
        if (element.isNotEmpty) {
          tlAllData.add(element);
        }
      });
      if (rsTagList != null) {
        for (int i = 0; i < (rsTagList.length); i++) {
          if (rsTagList[i].contains('#')) {
            int lenght = rsTagList[i].split("#").length;
            for (int j = 0; j < lenght; j++) {
              if (j == 0) {
                rsAllData.add(rsTagList[i].split("#")[j]);
              } else {
                rsAllData.add(rsTagList[i].split("#")[j].substring(2));
              }
            }
          } else {
            rsAllData.add(rsTagList[i]);
          }
        }
      }
      rsAllData.removeAt(0);
      rsAllData.forEach((element) {
        print("rsElement===>$element");
      });
      for (var rsElement in rsAllData) {
        List<String> rsList = rsElement.split(":").getRange(1, 3).toList();

        combileTemes.add(
          CombineTeamsModel.fromJson(
            tlAllData.firstWhere((element) {
              return rsList[0].contains(element.split(":")[0]);
            }),
            tlAllData.firstWhere(
                (element) => rsList[1].contains(element.split(":")[0])),
            rsElement,
            fixtureModel.root?.ms,
          ),
        );
      }
      return combileTemes;
    } catch (e, st) {
      return [];
    }
  }

  static Future<String> matchDetailsApi({String? matchID}) async {
    // combileTemes.clear();
    String fullURL = "https://data.fotmob.com/matchfacts.$matchID.fot.gz";
    final response = await _networkAPICall.getWithoutDecode(fullURL);
    String xmlFormat = Utils.instance.xmlFormatString(response);
    myTransformer.parse(xmlFormat);
    var json = myTransformer.toBadgerfish();
    return json;
  }
}
