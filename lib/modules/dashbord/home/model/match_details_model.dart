// To parse this JSON data, do
//
//     final matchDetailsModel = matchDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:football/modules/dashbord/home/model/detailes_stats_model.dart';
import 'package:football/modules/dashbord/home/model/external_lineup_model.dart';
import 'package:football/modules/dashbord/home/model/gd_2_model.dart';
import 'package:football/modules/dashbord/home/model/line_up_model.dart';
import 'package:football/modules/dashbord/home/model/match_model.dart';
import 'package:football/modules/dashbord/home/model/mlt_model.dart';
import 'package:football/modules/dashbord/home/model/momentum_alpha_model.dart';
import 'package:football/modules/dashbord/home/model/odd_spoll_model.dart';
import 'package:football/modules/dashbord/home/model/referees_model.dart';
import 'package:football/modules/dashbord/home/model/resodds_Model.dart';
import 'package:football/modules/dashbord/home/model/shotmap_model.dart';
import 'package:football/modules/dashbord/home/model/venus_model.dart';

class MatchDetailsModel {
  MatchDetailsModel({
    this.root,
  });

  final Root? root;

  factory MatchDetailsModel.fromRawJson(String str) => MatchDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MatchDetailsModel.fromJson(Map<String, dynamic> json) => MatchDetailsModel(
        root: Root.fromJson(json["root"]),
      );

  Map<String, dynamic> toJson() => {
        "root": root?.toJson(),
      };
}

class Root {
  Root({
    this.match,
    this.gd,
    this.gd2,
    this.lineup,
    this.matchStats,
    this.subst,
    this.subst2,
    this.gst,
    this.gst2,
    this.ccode,
    this.coach,
    this.ln,
    this.vn,
    this.ltc,
    this.h2H,
    this.lodds,
    this.nw,
    this.nw2,
    this.at,
    this.detailedstats,
    this.tw,
    this.media,
    this.minfo,
    this.formHt,
    this.formAt,
    this.web,
    this.captain,
    this.nt,
    this.buzzLangs,
    this.externalLineup,
    this.insights,
    this.mlist,
    this.momentumAlpha,
    this.oddspoll,
    this.refs,
    this.resodds,
    this.shotmap,
    this.venue,
    this.voteResult,
  });

  final MatchModel? match;
  final Captain? gd;
  final List<Gd2Model>? gd2;
  final List<LineUpModel>? lineup;
  final Captain? matchStats;
  final Captain? subst;
  final Captain? subst2;
  final Captain? gst;
  final Captain? gst2;
  final Captain? ccode;
  final Captain? coach;
  final Captain? ln;
  final Captain? vn;
  final Captain? ltc;
  final Captain? h2H;
  final Lodds? lodds;
  final Captain? nw;
  final Captain? nw2;
  final Captain? at;
  final DetailedStatsModel? detailedstats;
  final Captain? tw;
  final Captain? media;
  final Captain? minfo;
  final Captain? formHt;
  final Captain? formAt;
  final Captain? web;
  final Captain? captain;
  final Captain? nt;
  final Captain? buzzLangs;
  final List<ExternalLineUpModel>? externalLineup;
  final List<InsightsModel>? insights;
  final MlistModel? mlist;
  final MomentumAlphaModel? momentumAlpha;
  final OddspollModel? oddspoll;
  final RefereesModel? refs;
  final ResoddsModel? resodds;
  final ShotmapModel? shotmap;
  final VenueModel? venue;
  final VoteResultModel? voteResult;

  factory Root.fromRawJson(String str) => Root.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Root.fromJson(Map<String, dynamic> json) => Root(
        // match: json["MATCH"] != null ? MatchModel.fromJson(json["MATCH"]) : null,
        gd: Captain.fromJson(json["GD"]),
        gd2: json["GD2"] != null ? Gd2Model.fromList(json["GD2"]) : null,
        lineup: json["LINEUP"] != null ? LineUpModel.fromList(json["LINEUP"]) : null,
        matchStats: json["MATCH_STATS"] != null ? Captain.fromJson(json["MATCH_STATS"]) : null,
        subst: json["SUBST"] != null ? Captain.fromJson(json["SUBST"]) : null,
        subst2: json["SUBST2"] != null ? Captain.fromJson(json["SUBST2"]) : null,
        gst: json["GST"] != null ? Captain.fromJson(json["GST"]) : null,
        gst2: json["GST2"] != null ? Captain.fromJson(json["GST2"]) : null,
        ccode: json["CCODE"] != null ? Captain.fromJson(json["CCODE"]) : null,
        coach: json["COACH"] != null ? Captain.fromJson(json["COACH"]) : null,
        ln: json["ln"] != null ? Captain.fromJson(json["ln"]) : null,
        vn: json["vn"] != null ? Captain.fromJson(json["vn"]) : null,
        ltc: json["ltc"] != null ? Captain.fromJson(json["ltc"]) : null,
        h2H: json["h2h"] != null ? Captain.fromJson(json["h2h"]) : null,
        lodds: json["lodds"] != null ? Lodds.fromJson(json["lodds"]) : null,
        nw: json["nw"] != null ? Captain.fromJson(json["nw"]) : null,
        nw2: json["nw2"] != null ? Captain.fromJson(json["nw2"]) : null,
        at: json["at"] != null ? Captain.fromJson(json["at"]) : null,
        detailedstats: json["detailedstats"] != null ? DetailedStatsModel.fromJson(json["detailedstats"]) : null,
        tw: json["tw"] != null ? Captain.fromJson(json["tw"]) : null,
        media: json["media"] != null ? Captain.fromJson(json["media"]) : null,
        minfo: json["minfo"] != null ? Captain.fromJson(json["minfo"]) : null,
        formHt: json["form_ht"] != null ? Captain.fromJson(json["form_ht"]) : null,
        formAt: json["form_at"] != null ? Captain.fromJson(json["form_at"]) : null,
        web: json["web"] != null ? Captain.fromJson(json["web"]) : null,
        captain: json["CAPTAIN"] != null ? Captain.fromJson(json["CAPTAIN"]) : null,
        nt: json["nt"] != null ? Captain.fromJson(json["nt"]) : null,
        buzzLangs: json["buzz_langs"] != null ? Captain.fromJson(json["buzz_langs"]) : null,
        externalLineup: json["EXTERNAL_LINEUP"] != null ? ExternalLineUpModel.fromList(json["EXTERNAL_LINEUP"]) : [],
        insights: json["insights"] != null ? InsightsModel.fromList(json["insights"]) : null,
        mlist: json["mlist"] != null ? MlistModel.fromJson(json["mlist"]) : null,
        momentumAlpha: json["momentum_alpha"] != null ? MomentumAlphaModel.fromJson(json["momentum_alpha"]) : null,
        oddspoll: json["oddspoll"] != null ? OddspollModel.fromJson(json["oddspoll"]) : null,
        refs: json["refs"] != null ? RefereesModel.fromJson(json["refs"]) : null,
        resodds: json["resodds"] != null ? ResoddsModel.fromJson(json["resodds"]) : null,
        shotmap: json["shotmap"] != null ? ShotmapModel.fromJson(json["shotmap"]) : null,
        venue: json["venue"] != null ? VenueModel.fromJson(json["venue"]) : null,
        voteResult: json["vote_result"] != null ? VoteResultModel.fromJson(json["vote_result"]) : null,
      );

  Map<String, dynamic> toJson() => {
        // "MATCH": match?.toJson(),
        "GD": gd?.toJson(),
        "GD2": List<dynamic>.from(gd2!.map((x) => x.toJson())),
        "LINEUP": List<dynamic>.from(lineup!.map((x) => x.toJson())),
        "MATCH_STATS": matchStats?.toJson(),
        "SUBST": subst?.toJson(),
        "SUBST2": subst2?.toJson(),
        "GST": gst?.toJson(),
        "GST2": gst2?.toJson(),
        "CCODE": ccode?.toJson(),
        "COACH": coach?.toJson(),
        "ln": ln?.toJson(),
        "vn": vn?.toJson(),
        "ltc": ltc?.toJson(),
        "h2h": h2H?.toJson(),
        "lodds": lodds?.toJson(),
        "nw": nw?.toJson(),
        "nw2": nw2?.toJson(),
        "at": at?.toJson(),
        "detailedstats": detailedstats?.toJson(),
        "tw": tw?.toJson(),
        "media": media?.toJson(),
        "minfo": minfo?.toJson(),
        "form_ht": formHt?.toJson(),
        "form_at": formAt?.toJson(),
        "web": web?.toJson(),
        "CAPTAIN": captain?.toJson(),
        "nt": nt?.toJson(),
        "buzz_langs": buzzLangs?.toJson(),
        "EXTERNAL_LINEUP": List<dynamic>.from(externalLineup!.map((x) => x.toJson())),
        "insights": List<dynamic>.from(insights!.map((x) => x.toJson())),
        "mlist": mlist?.toJson(),
        "momentum_alpha": momentumAlpha?.toJson(),
        "oddspoll": oddspoll?.toJson(),
        "refs": refs?.toJson(),
        "resodds": resodds?.toJson(),
        "shotmap": shotmap?.toJson(),
        "venue": venue?.toJson(),
        "vote_result": voteResult?.toJson(),
      };
}

class Captain {
  Captain({
    this.empty,
  });

  final String? empty;

  factory Captain.fromRawJson(String str) => Captain.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Captain.fromJson(Map<String, dynamic> json) => Captain(
        empty: json["\u0024"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024": empty,
      };
}

class Lodds {
  Lodds();

  factory Lodds.fromRawJson(String str) => Lodds.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Lodds.fromJson(Map<String, dynamic> json) => Lodds();

  Map<String, dynamic> toJson() => {};
}

class InsightsModel {
  InsightsModel({
    this.type,
    this.playerId,
    this.teamId,
    this.priority,
    this.defaultText,
    this.localizedTextId,
    this.statValues,
  });

  final String? type;
  final dynamic playerId;
  final int? teamId;
  final int? priority;
  final String? defaultText;
  final String? localizedTextId;
  final List<StatValue>? statValues;

  factory InsightsModel.fromRawJson(String str) => InsightsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<InsightsModel> fromList(json) {
    List<InsightsModel> tempList = [];
    if (json != null) {
      if (json['\$'] != null) {
        jsonDecode(json['\$']).forEach((element) {
          tempList.add(InsightsModel.fromJson(element));
        });
      }
    }
    return tempList;
  }

  factory InsightsModel.fromJson(Map<String, dynamic> json) => InsightsModel(
        type: json["type"],
        playerId: json["playerId"],
        teamId: json["teamId"],
        priority: json["priority"],
        defaultText: json["defaultText"],
        localizedTextId: json["localizedTextId"],
        statValues: List<StatValue>.from(json["statValues"].map((x) => StatValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "playerId": playerId,
        "teamId": teamId,
        "priority": priority,
        "defaultText": defaultText,
        "localizedTextId": localizedTextId,
        "statValues": List<dynamic>.from(statValues!.map((x) => x.toJson())),
      };
}

class StatValue {
  StatValue({
    this.value,
    this.name,
    this.type,
  });

  final int? value;
  final dynamic name;
  final String? type;

  factory StatValue.fromRawJson(String str) => StatValue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StatValue.fromJson(Map<String, dynamic> json) => StatValue(
        value: json["value"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "name": name,
        "type": type,
      };
}
