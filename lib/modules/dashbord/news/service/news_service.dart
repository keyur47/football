import 'dart:convert';
import 'dart:developer';

import 'package:football/helper/network_helper.dart';
import 'package:football/model/news_model.dart';

class NewsService {
  static final NetworkAPICall _networkAPICall = NetworkAPICall();

  static Future<NewsModal> newsMethod() async {
    try {
      final response = await _networkAPICall
          .get("https://apigw.fotmob.com/searchapi/search?ver=3&country=USA&lang=en&term=league_77");
      print('response--->$response');
      return NewsModal.fromJson(response);
    } catch (e, st) {
      log("error in newsdata========$e========$st");
      rethrow;
    }
  }
}
