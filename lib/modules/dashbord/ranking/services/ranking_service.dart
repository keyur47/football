import 'dart:developer';

import 'package:football/helper/network_helper.dart';

class RankingService {
  static final NetworkAPICall _networkAPICall = NetworkAPICall();

  static Future tableApi() async {
    try {
      const String fullURL = "https://data.fotmob.com/tables.ext.77.fot.gz";
      final response = await _networkAPICall.getWithoutDecode(fullURL);
      return response;
    } catch (e, st) {
      print('error in fixtureApi  $e--------$st');
      return [];
    }
  }

  static Future formApi() async {
    try {
      const String fullURL = "https://pub.fotmob.com/prod/pub/league/77/form";
      final response = await _networkAPICall.getWithoutDecode(fullURL);
      log("formResult====>${response}");
      return response;
    } catch (e, st) {
      print('error in fixtureApi  $e--------$st');
      rethrow;
    }
  }
}
