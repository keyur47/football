import 'dart:convert';
import 'dart:developer';

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

      // combileTemes.clear();
      const String fullURL = "https://data.fotmob.com/league_data.77.fot.gz";
      final response = await _networkAPICall.getWithoutDecode(fullURL);

      String xmlFormat = Utils.instance.xmlFormatString(response);
      myTransformer.parse(xmlFormat);

      var json = myTransformer.toBadgerfish();
      FixtureModel fixtureModel = FixtureModel.fromJson(jsonDecode(json));
      List<String>? tlTagList = fixtureModel.root?.tl?.empty?.split('|');
      List<String>? rsTagList = fixtureModel.root?.rs?.empty?.toString().trim().split(',');

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
                rsAllData.add(rsTagList[i].split("#")[1].substring(2));
              }
            }
          } else {
            rsAllData.add(rsTagList[i]);
          }
        }
      }
      rsAllData.removeAt(0);
      for (var rsElement in rsAllData) {
        List<String> rsList = rsElement.split(":").getRange(1, 3).toList();

        combileTemes.add(
          CombineTeamsModel.fromJson(
            tlAllData.firstWhere((element) {
              return rsList[0].contains(element.split(":")[0]);
            }),
            tlAllData.firstWhere((element) => rsList[1].contains(element.split(":")[0])),
            rsElement,
            fixtureModel.root?.ms,
          ),
        );
      }
      combileTemes.forEach((element) {
        // print("element====>${element.time}");
      });

      // for (int i = 0; i < (rsAllData.length); i ++) {
      //   List<String>? details = [];
      //   if (rsAllData[i].isNotEmpty) {
      //     for(int j = 0; j < (tlAllData.length); j = j + 2){
      //       log("xmlFormat===>${tlAllData[j].split(':')[0]}:${tlAllData[j + 1].split(':')[0]} ***** ${rsAllData[i].split(':')[1]}:${rsAllData[i].split(':')[2]}");
      //
      //       if(('${tlAllData[j].split(':')[0]}:${tlAllData[j + 1].split(':')[0]}') ==
      //           ('${rsAllData[i].split(':')[1]}:${rsAllData[i].split(':')[2]}')){
      //          details.add(rsAllData[i]);
      //         if (details.isNotEmpty) {
      //           combileTemes.add(
      //             CombineTeamsModel.fromJson(
      //               tlAllData[j],
      //               tlAllData[j + 1],
      //               details,
      //               fixtureModel.root?.ms,
      //             ),
      //           );
      //         }
      //       }
      //     }
      //   }
      // }

      // for (int i = 0; i < (tlAllData.length); i = i + 2) {
      //   if (tlAllData[i].isNotEmpty) {
      //     List<String>? details = rsAllData.where((element) {
      //       // log("xmlFormat===>${tlAllData[i]}");
      //       log("xmlFormat===>${tlAllData[i].split(':')[0]}:${tlAllData[i + 1].split(':')[0]}   ----- ${element.split(':')[1]}:${element.split(':')[2]}");
      //       return ('${tlAllData[i].split(':')[0]}:${tlAllData[i + 1].split(':')[0]}') ==
      //           ('${element.split(':')[1]}:${element.split(':')[2]}');
      //     }).toList();
      //     log("details===>${details}");
      //     if (details.isNotEmpty) {
      //       combileTemes.add(
      //         CombineTeamsModel.fromJson(
      //           tlAllData[i],
      //           tlAllData[i + 1],
      //           details,
      //           fixtureModel.root?.ms,
      //         ),
      //       );
      //     }
      //   }
      // }

      return combileTemes;
    } catch (e, st) {
      print('error in fixtureApi  $e--------$st');
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
