
import 'dart:convert';

class MlistModel {
  MlistModel({
    this.media,
  });

  final List<Media>? media;

  factory MlistModel.fromRawJson(String str) => MlistModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MlistModel.fromJson(Map<String, dynamic> json) {
    print("======>${json['\$']}");
    return MlistModel(
      media: List<Media>.from(jsonDecode(json['\$'])["media"].map((x) => Media.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "media": List<dynamic>.from(media!.map((x) => x.toJson())),
  };
}

class Media {
  Media({
    this.id,
    this.matchId,
    this.eventId,
    this.elapsed,
    this.eventType,
    this.title,
    this.url,
    this.previewImageUrl,
    this.displaySource,
    this.isHighlight,
    this.rating,
    this.updated,
    this.official,
    this.published,
    this.live,
    this.restriction,
    this.logKey,
    this.properties,
  });

  final int? id;
  final int? matchId;
  final int? eventId;
  final String? elapsed;
  final String? eventType;
  final String? title;
  final String? url;
  final String? previewImageUrl;
  final String? displaySource;
  final bool ?isHighlight;
  final int? rating;
  final DateTime? updated;
  final bool? official;
  final DateTime? published;
  final bool? live;
  final Restriction? restriction;
  final String? logKey;
  final Properties? properties;

  factory Media.fromRawJson(String str) => Media.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    matchId: json["matchId"],
    eventId: json["eventId"],
    elapsed: json["elapsed"],
    eventType: json["eventType"],
    title: json["title"],
    url: json["url"],
    previewImageUrl: json["previewImageUrl"],
    displaySource: json["displaySource"],
    isHighlight: json["isHighlight"],
    rating: json["rating"],
    updated: DateTime.parse(json["updated"]),
    official: json["official"],
    published: DateTime.parse(json["published"]),
    live: json["live"],
    restriction: Restriction.fromJson(json["restriction"]),
    logKey: json["logKey"],
    properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "matchId": matchId,
    "eventId": eventId,
    "elapsed": elapsed,
    "eventType": eventType,
    "title": title,
    "url": url,
    "previewImageUrl": previewImageUrl,
    "displaySource": displaySource,
    "isHighlight": isHighlight,
    "rating": rating,
    "updated": updated?.toIso8601String(),
    "official": official,
    "published": published?.toIso8601String(),
    "live": live,
    "restriction": restriction?.toJson(),
    "logKey": logKey ,
    "properties":  properties?.toJson(),
  };
}

class Properties {
  Properties({
    this.logKey,
    this.yt,
    this.duration,
    this.embeddable,
    this.defaultAudioLanguage,
    this.hitLang,
  });

  final String? logKey;
  final String? yt;
  final String? duration;
  final String? embeddable;
  final String? defaultAudioLanguage;
  final String? hitLang;

  factory Properties.fromRawJson(String str) => Properties.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    logKey: json["logKey"],
    yt: json["yt"],
    duration: json["duration"],
    embeddable: json["embeddable"],
    defaultAudioLanguage: json["defaultAudioLanguage"],
    hitLang: json["hit_lang"],
  );

  Map<String, dynamic> toJson() => {
    "logKey": logKey,
    "yt": yt,
    "duration": duration,
    "embeddable": embeddable,
    "defaultAudioLanguage": defaultAudioLanguage,
    "hit_lang": hitLang,
  };
}

class Restriction {
  Restriction({
    this.allowed,
  });

  final String ?allowed;

  factory Restriction.fromRawJson(String str) => Restriction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Restriction.fromJson(Map<String, dynamic> json) => Restriction(
    allowed: json["allowed"],
  );

  Map<String, dynamic> toJson() => {
    "allowed": allowed,
  };
}
