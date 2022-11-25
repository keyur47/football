
import 'dart:convert';

class VenueModel {
  VenueModel({
    this.id,
    this.name,
    this.city,
    this.countryCode,
    this.address,
    this.opened,
    this.capacity,
    this.surface,
    this.lat,
    this.long,
    this.isGrass,
  });

  final String? id;
  final String? name;
  final String? city;
  final String? countryCode;
  final String? address;
  final int? opened;
  final int? capacity;
  final String? surface;
  final double? lat;
  final double? long;
  final bool? isGrass;

  factory VenueModel.fromRawJson(String str) => VenueModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VenueModel.fromJson(Map<String, dynamic> json) => VenueModel(
    id: jsonDecode(json['\$'])["id"],
    name: jsonDecode(json['\$'])["name"],
    city: jsonDecode(json['\$'])["city"],
    countryCode: jsonDecode(json['\$'])["countryCode"],
    address: jsonDecode(json['\$'])["address"],
    opened: jsonDecode(json['\$'])["opened"],
    capacity: jsonDecode(json['\$'])["capacity"],
    surface: jsonDecode(json['\$'])["surface"],
    lat: jsonDecode(json['\$'])["lat"].toDouble(),
    long: jsonDecode(json['\$'])["long"].toDouble(),
    isGrass: jsonDecode(json['\$'])["isGrass"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "city": city,
    "countryCode": countryCode,
    "address": address,
    "opened": opened,
    "capacity": capacity,
    "surface": surface,
    "lat": lat,
    "long": long,
    "isGrass": isGrass,
  };
}


class VoteResultModel {
  VoteResultModel({
    this.pollName,
    this.votes,
  });

  final String? pollName;
  final List<Vote>? votes;

  factory VoteResultModel.fromRawJson(String str) => VoteResultModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VoteResultModel.fromJson(Map<String, dynamic> json) => VoteResultModel(
    pollName: jsonDecode(json['\$'])["PollName"],
    votes: List<Vote>.from(jsonDecode(json['\$'])["Votes"].map((x) => Vote.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "PollName": pollName,
    "Votes": List<dynamic>.from(votes!.map((x) => x.toJson())),
  };
}

class Vote {
  Vote({
    this.name,
    this.votes,
  });

  final String ?name;
  final List<int>? votes;

  factory Vote.fromRawJson(String str) => Vote.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Vote.fromJson(Map<String, dynamic> json) => Vote(
    name: json["Name"],
    votes: List<int>.from(json["Votes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Votes": List<dynamic>.from(votes!.map((x) => x)),
  };
}
