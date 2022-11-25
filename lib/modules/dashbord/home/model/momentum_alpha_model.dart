


import 'dart:convert';

class MomentumAlphaModel {
  MomentumAlphaModel({
    this.main,
    this.alternateModels,
  });

  final Main? main;
  final List<Main>? alternateModels;

  factory MomentumAlphaModel.fromRawJson(String str) => MomentumAlphaModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MomentumAlphaModel.fromJson(Map<String, dynamic> json) {
    print("MomentumAlphaModel===>${json}");
    return MomentumAlphaModel(
      main: Main.fromJson(jsonDecode(json['\$'])["main"]),
      alternateModels: List<Main>.from(jsonDecode(json['\$'])["alternateModels"].map((x) => Main.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "main": main?.toJson(),
    "alternateModels": List<dynamic>.from(alternateModels!.map((x) => x.toJson())),
  };
}

class Main {
  Main({
    this.data,
    this.debugTitle,
  });

  final List<List<double>>? data;
  final String? debugTitle;

  factory Main.fromRawJson(String str) => Main.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    data: List<List<double>>.from(json["data"].map((x) => List<double>.from(x.map((x) => x.toDouble())))),
    debugTitle: json["debugTitle"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "debugTitle": debugTitle,
  };
}