import 'dart:convert';

class ShotmapModel {
  List<Shots>? shots;

  ShotmapModel({this.shots});

  ShotmapModel.fromJson(Map<String, dynamic> json) {
    if (jsonDecode(json['\$'])['shots'] != null) {
      shots = <Shots>[];
      jsonDecode(json['\$'])['shots'].forEach((v) {
        shots!.add(Shots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (shots != null) {
      data['shots'] = shots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Shots {
  int? id;
  String? eventType;
  int? teamId;
  int? playerId;
  String? playerName;
  double? x;
  double? y;
  int? min;
  int? minAdded;
  bool? isBlocked;
  bool? isOnTarget;
  double? blockedX;
  double? blockedY;
  double? goalCrossedY;
  double? goalCrossedZ;
  double? expectedGoals;
  double? expectedGoalsOnTarget;
  String? shotType;
  String? situation;
  String? period;
  bool? isOwnGoal;
  OnGoalShot? onGoalShot;

  Shots(
      {this.id,
      this.eventType,
      this.teamId,
      this.playerId,
      this.playerName,
      this.x,
      this.y,
      this.min,
      this.minAdded,
      this.isBlocked,
      this.isOnTarget,
      this.blockedX,
      this.blockedY,
      this.goalCrossedY,
      this.goalCrossedZ,
      this.expectedGoals,
      this.expectedGoalsOnTarget,
      this.shotType,
      this.situation,
      this.period,
      this.isOwnGoal,
      this.onGoalShot});

  Shots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventType = json['eventType'];
    teamId = json['teamId'];
    playerId = json['playerId'];
    playerName = json['playerName'];
    x = json['x'];
    y = json['y'];
    min = json['min'];
    minAdded = json['minAdded'];
    isBlocked = json['isBlocked'];
    isOnTarget = json['isOnTarget'];
    blockedX = json['blockedX'];
    blockedY = json['blockedY'];
    goalCrossedY = json['goalCrossedY'];
    goalCrossedZ = json['goalCrossedZ'];
    expectedGoals = json['expectedGoals'];
    expectedGoalsOnTarget = json['expectedGoalsOnTarget'];
    shotType = json['shotType'];
    situation = json['situation'] ?? "";
    period = json['period'];
    isOwnGoal = json['isOwnGoal'];
    onGoalShot = json['onGoalShot'] != null ? OnGoalShot.fromJson(json['onGoalShot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['eventType'] = eventType;
    data['teamId'] = teamId;
    data['playerId'] = playerId;
    data['playerName'] = playerName;
    data['x'] = x;
    data['y'] = y;
    data['min'] = min;
    data['minAdded'] = minAdded;
    data['isBlocked'] = isBlocked;
    data['isOnTarget'] = isOnTarget;
    data['blockedX'] = blockedX;
    data['blockedY'] = blockedY;
    data['goalCrossedY'] = goalCrossedY;
    data['goalCrossedZ'] = goalCrossedZ;
    data['expectedGoals'] = expectedGoals;
    data['expectedGoalsOnTarget'] = expectedGoalsOnTarget;
    data['shotType'] = shotType;
    data['situation'] = situation;
    data['period'] = period;
    data['isOwnGoal'] = isOwnGoal;
    if (onGoalShot != null) {
      data['onGoalShot'] = onGoalShot!.toJson();
    }
    return data;
  }
}

class OnGoalShot {
  double? x;
  double? y;
  double? zoomRatio;

  OnGoalShot({this.x, this.y, this.zoomRatio});

  OnGoalShot.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
    zoomRatio = json['zoomRatio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['x'] = x;
    data['y'] = y;
    data['zoomRatio'] = zoomRatio;
    return data;
  }
}
