// To parse this JSON data, do
//
//     final newsModal = newsModalFromJson(jsonString);

import 'dart:convert';

NewsModal newsModalFromJson(String str) => NewsModal.fromJson(json.decode(str));

String newsModalToJson(NewsModal data) => json.encode(data.toJson());

class NewsModal {
  NewsModal({
    this.total,
    this.took,
    this.hits,
    this.next,
    this.current,
  });

  int? total;
  int? took;
  Hits? hits;
  String? next;
  String? current;

  factory NewsModal.fromJson(Map<String, dynamic> json) => NewsModal(
        total: json["total"] == null ? null : json["total"],
        took: json["took"] == null ? null : json["took"],
        hits: json["hits"] == null ? null : Hits.fromJson(json["hits"]),
        next: json["next"] == null ? null : json["next"],
        current: json["current"] == null ? null : json["current"],
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "took": took == null ? null : took,
        "hits": hits == null ? null : hits?.toJson(),
        "next": next == null ? null : next,
        "current": current == null ? null : current,
      };
}

class Hits {
  Hits({
    this.total,
    this.hits,
  });

  int? total;
  List<Hit>? hits;

  factory Hits.fromJson(Map<String, dynamic> json) => Hits(
        total: json["total"] == null ? null : json["total"],
        hits: json["hits"] == null ? null : List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "hits": hits == null ? null : List<dynamic>.from(hits!.map((x) => x.toJson())),
      };
}

class Hit {
  Hit({
    this.id,
    this.source,
    this.links,
  });

  String? id;
  Source? source;
  List<Link>? links;

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        id: json["_id"] == null ? null : json["_id"],
        source: json["_source"] == null ? null : Source.fromJson(json["_source"]),
        links: json["links"] == null ? null : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "_source": source == null ? null : source?.toJson(),
        "links": links == null ? null : List<dynamic>.from(links!.map((x) => x.toJson())),
      };
}

class Link {
  Link({
    this.rel,
    this.href,
    this.type,
    this.width,
    this.size,
  });

  String? rel;
  String? href;
  String? type;
  String? width;
  String? size;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        rel: json["rel"] == null ? null : json["rel"],
        href: json["href"] == null ? null : json["href"],
        type: json["type"] == null ? null : json["type"],
        width: json["width"] == null ? null : json["width"],
        size: json["size"] == null ? null : json["size"],
      );

  Map<String, dynamic> toJson() => {
        "rel": rel == null ? null : rel,
        "href": href == null ? null : href,
        "type": type == null ? null : type,
        "width": width == null ? null : width,
        "size": size == null ? null : size,
      };
}

class Source {
  Source({
    this.categories,
    this.id,
    this.imageUrl,
    this.title,
    this.boostFactor,
    this.tags,
    this.language,
    this.dateUpdated,
    this.content,
    this.source,
    this.summary,
    this.titleEn,
    this.mediaLinks,
    this.webUri,
    this.shareUri,
  });

  List<Category>? categories;
  String? id;
  String? imageUrl;
  String? title;
  double? boostFactor;
  List<String>? tags;
  String? language;
  DateTime? dateUpdated;
  String? content;
  String? source;
  String? summary;
  String? titleEn;
  List<dynamic>? mediaLinks;
  String? webUri;
  String? shareUri;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        categories: json["categories"] == null ? null : List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        id: json["id"] == null ? null : json["id"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        title: json["title"] == null ? null : json["title"],
        boostFactor: json["boostFactor"] == null ? null : json["boostFactor"],
        tags: json["tags"] == null ? null : List<String>.from(json["tags"].map((x) => x)),
        language: json["language"] == null ? null : json["language"],
        dateUpdated: json["dateUpdated"] == null ? null : DateTime.parse(json["dateUpdated"]),
        content: json["content"] == null ? null : json["content"],
        source: json["source"] == null ? null : json["source"],
        summary: json["summary"] == null ? null : json["summary"],
        titleEn: json["titleEn"] == null ? null : json["titleEn"],
        mediaLinks: json["mediaLinks"] == null ? null : List<dynamic>.from(json["mediaLinks"].map((x) => x)),
        webUri: json["webUri"] == null ? null : json["webUri"],
        shareUri: json["shareUri"] == null ? null : json["shareUri"],
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "id": id == null ? null : id,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "title": title == null ? null : title,
        "boostFactor": boostFactor == null ? null : boostFactor,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
        "language": language == null ? null : language,
        "dateUpdated": dateUpdated == null ? null : dateUpdated?.toIso8601String(),
        "content": content == null ? null : content,
        "source": source == null ? null : source,
        "summary": summary == null ? null : summary,
        "titleEn": titleEn == null ? null : titleEn,
        "mediaLinks": mediaLinks == null ? null : List<dynamic>.from(mediaLinks!.map((x) => x)),
        "webUri": webUri == null ? null : webUri,
        "shareUri": shareUri == null ? null : shareUri,
      };
}

class Category {
  Category({
    this.term,
    this.scheme,
    this.label,
    this.keywordId,
  });

  String? term;
  String? scheme;
  String? label;
  int? keywordId;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        term: json["term"] == null ? null : json["term"],
        scheme: json["scheme"] == null ? null : json["scheme"],
        label: json["label"] == null ? null : json["label"],
        keywordId: json["keywordId"] == null ? null : json["keywordId"],
      );

  Map<String, dynamic> toJson() => {
        "term": term == null ? null : term,
        "scheme": scheme == null ? null : scheme,
        "label": label == null ? null : label,
        "keywordId": keywordId == null ? null : keywordId,
      };
}
