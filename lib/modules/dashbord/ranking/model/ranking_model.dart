// To parse this JSON data, do
//
//     final rankingTableModel = rankingTableModelFromJson(jsonString);

import 'dart:convert';

class RankingTableModel {
  RankingTableModel({
    this.root,
  });

  final Root? root;

  factory RankingTableModel.fromRawJson(String str) => RankingTableModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RankingTableModel.fromJson(Map<String, dynamic> json) => RankingTableModel(
    root: Root.fromJson(json["root"]),
  );

  Map<String, dynamic> toJson() => {
    "root": root?.toJson(),
  };
}

class Root {
  Root({
    this.table,
  });

  final Table? table;

  factory Root.fromRawJson(String str) => Root.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Root.fromJson(Map<String, dynamic> json) => Root(
    table: Table.fromJson(json["table"]),
  );

  Map<String, dynamic> toJson() => {
    "table": table?.toJson(),
  };
}

class Table {
  Table({
    this.name,
    this.ccode,
    this.lid,
    this.wp,
    this.tp,
    this.qp,
    this.rp,
    this.composite,
    this.subt,
    this.form,
  });

  final String? name;
  final String? ccode;
  final String? lid;
  final String? wp;
  final String? tp;
  final String? qp;
  final String? rp;
  final String? composite;
  final List<Subt>? subt;
  final Form? form;

  factory Table.fromRawJson(String str) => Table.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Table.fromJson(Map<String, dynamic> json) => Table(
    name: json["@name"],
    ccode: json["@ccode"],
    lid: json["@lid"],
    wp: json["@wp"],
    tp: json["@tp"],
    qp: json["@qp"],
    rp: json["@rp"],
    composite: json["@composite"],
    subt: List<Subt>.from(json["subt"].map((x) => Subt.fromJson(x))),
    form: Form.fromJson(json["form"]),
  );

  Map<String, dynamic> toJson() => {
    "@name": name,
    "@ccode": ccode,
    "@lid": lid,
    "@wp": wp,
    "@tp": tp,
    "@qp": qp,
    "@rp": rp,
    "@composite": composite,
    "subt": List<dynamic>.from(subt!.map((x) => x.toJson())),
    "form": form?.toJson(),
  };
}

class Form {
  Form({
    this.url,
  });

  final String? url;

  factory Form.fromRawJson(String str) => Form.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Form.fromJson(Map<String, dynamic> json) => Form(
    url: json["@url"],
  );

  Map<String, dynamic> toJson() => {
    "@url": url,
  };
}

class Subt {
  Subt({
    this.name,
    this.wp,
    this.tp,
    this.qp,
    this.rp,
    this.id,
    this.lQualNext,
    this.t,
    this.rules,
  });

  final String? name;
  final String? wp;
  final String? tp;
  final String? qp;
  final String? rp;
  final String? id;
  final String? lQualNext;
  final List<T>? t;
  final Rules? rules;

  factory Subt.fromRawJson(String str) => Subt.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Subt.fromJson(Map<String, dynamic> json) => Subt(
    name: json["@name"],
    wp: json["@wp"],
    tp: json["@tp"],
    qp: json["@qp"],
    rp: json["@rp"],
    id: json["@id"],
    lQualNext: json["@l_qual_next"],
    t: List<T>.from(json["t"].map((x) => T.fromJson(x))),
    rules: Rules.fromJson(json["rules"]),
  );

  Map<String, dynamic> toJson() => {
    "@name": name,
    "@wp": wp,
    "@tp": tp,
    "@qp": qp,
    "@rp": rp,
    "@id": id,
    "@l_qual_next": lQualNext,
    "t": List<dynamic>.from(t!.map((x) => x.toJson())),
    "rules": rules?.toJson(),
  };
}

class Rules {
  Rules({
    this.ti,
  });

  final Ti? ti;

  factory Rules.fromRawJson(String str) => Rules.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rules.fromJson(Map<String, dynamic> json) => Rules(
    ti: Ti.fromJson(json["ti"]),
  );

  Map<String, dynamic> toJson() => {
    "ti": ti?.toJson(),
  };
}

class Ti {
  Ti({
    this.desc,
    this.color,
    this.tkey,
    this.value,
  });

  final String? desc;
  final String? color;
  final String? tkey;
  final String? value;

  factory Ti.fromRawJson(String str) => Ti.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ti.fromJson(Map<String, dynamic> json) => Ti(
    desc: json["@desc"],
    color: json["@color"],
    tkey: json["@tkey"],
    value: json["@value"],
  );

  Map<String, dynamic> toJson() => {
    "@desc": desc,
    "@color": color,
    "@tkey": tkey,
    "@value": value,
  };
}

class T {
  T({
    this.name,
    this.id,
    this.p,
    this.w,
    this.d,
    this.l,
    this.g,
    this.c,
    this.hp,
    this.hw,
    this.hd,
    this.hl,
    this.hg,
    this.hc,
    this.change,
  });

  final String? name;
  final String? id;
  final String? p;
  final String? w;
  final String? d;
  final String? l;
  final String? g;
  final String? c;
  final String? hp;
  final String? hw;
  final String? hd;
  final String? hl;
  final String? hg;
  final String? hc;
  final String? change;

  factory T.fromRawJson(String str) => T.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory T.fromJson(Map<String, dynamic> json) => T(
    name: json["@name"],
    id: json["@id"],
    p: json["@p"],
    w: json["@w"],
    d: json["@d"],
    l: json["@l"],
    g: json["@g"],
    c: json["@c"],
    hp: json["@hp"],
    hw: json["@hw"],
    hd: json["@hd"],
    hl: json["@hl"],
    hg: json["@hg"],
    hc: json["@hc"],
    change: json["@change"],
  );

  Map<String, dynamic> toJson() => {
    "@name": name,
    "@id": id,
    "@p": p,
    "@w": w,
    "@d": d,
    "@l": l,
    "@g": g,
    "@c": c,
    "@hp": hp,
    "@hw": hw,
    "@hd": hd,
    "@hl": hl,
    "@hg": hg,
    "@hc": hc,
    "@change": change,
  };
}
