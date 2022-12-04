import 'dart:convert';

class DetailedStatsModel {
  List<PlayerStats>? playerStats;
  HomeTeamStats? homeTeamStats;
  AwayTeamStats? awayTeamStats;
  String? optaMatchId;

  DetailedStatsModel({this.playerStats, this.homeTeamStats, this.awayTeamStats, this.optaMatchId});

  DetailedStatsModel.fromJson(Map<String, dynamic> json) {
    if (jsonDecode(json['\$'])['PlayerStats'] != null) {
      playerStats = <PlayerStats>[];
      jsonDecode(json['\$'])['PlayerStats'].forEach((v) {
        playerStats!.add(PlayerStats.fromJson(v));
      });
    }
    homeTeamStats = jsonDecode(json['\$'])['HomeTeamStats'] != null
        ? HomeTeamStats.fromJson(jsonDecode(json['\$'])['HomeTeamStats'])
        : null;
    awayTeamStats = jsonDecode(json['\$'])['AwayTeamStats'] != null
        ? AwayTeamStats.fromJson(jsonDecode(json['\$'])['AwayTeamStats'])
        : null;
    optaMatchId = jsonDecode(json['\$'])['OptaMatchId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (playerStats != null) {
      data['PlayerStats'] = playerStats!.map((v) => v.toJson()).toList();
    }
    if (homeTeamStats != null) {
      data['HomeTeamStats'] = homeTeamStats!.toJson();
    }
    if (awayTeamStats != null) {
      data['AwayTeamStats'] = awayTeamStats!.toJson();
    }
    data['OptaMatchId'] = optaMatchId;
    return data;
  }
}

class PlayerStats {
  int? playerId;
  String? playerName;
  bool? playsOnHomeTeam;
  bool? gameStarted;
  String? optaId;
  int? goalsConcededInBox;
  int? shotsOutsideBox;
  int? totalPasses;
  int? passSuccess;
  int? keyPasses;
  int? dribblesAttempted;
  int? dribblesWon;
  int? aerialsWon;
  int? clearances;
  int? wasFouled;
  int? totalCrosses;
  int? minutesPlayed;
  int? longBall;
  int? longBallAccurate;
  int? shotsOffTarget;
  int? goals;
  int? punches;
  int? throws;
  int? duelLost;
  int? duelWon;
  int? formationPlace;
  int? accurateForwardZonePass;
  int? accurateBackZonePass;
  int? successFinalThirdPasses;
  int? totalFinalThirdPasses;
  double? playerRating;
  int? lostPossession;
  int? longPassOwnToOpponentSuccess;
  int? ballRecoveries;
  int? touches;
  int? headedClearance;
  int? goalsConcededViaPenalty;
  int? goalsConceded;
  double? expectedGoals;
  double? expectedGoalsNonPenalty;
  double? expectedGoalsConceded;
  double? expectedGoalsOpenPlay;
  double? expectedGoalsOnTargetConceded;
  double? expectedGoalsOnTargetNonPenaltyConceded;
  double? expectedAssists;
  int? finalThirdEntries;
  int? shotsInsideBox;
  int? aerialsLost;
  int? tacklesAttempted;
  int? interceptions;
  int? offsides;
  int? foulsConceded;
  int? bigChance;
  int? shotsOnTarget;
  int? penaltyWon;
  bool? manOfTheMatch;
  int? dribbledPast;
  double? expectedGoalsSetPlay;
  double? expectedGoalsOnTarget;
  int? bigChanceScored;
  int? dispossessed;
  int? tacklesSuccess;
  int? yellowCard;
  int? accurateCrosses;
  int? corners;
  int? bigChanceMissed;
  int? cleanSheet;
  int? assists;
  int? goodHighClaim;
  int? bigChanceCreated;
  int? saves;
  int? savesOutBox;
  int? penaltyGoalConceded;
  int? divingSave;
  int? diveSave;

  PlayerStats(
      {this.playerId,
      this.playerName,
      this.playsOnHomeTeam,
      this.gameStarted,
      this.optaId,
      this.goalsConcededInBox,
      this.shotsOutsideBox,
      this.totalPasses,
      this.passSuccess,
      this.keyPasses,
      this.dribblesAttempted,
      this.dribblesWon,
      this.aerialsWon,
      this.clearances,
      this.wasFouled,
      this.totalCrosses,
      this.minutesPlayed,
      this.longBall,
      this.longBallAccurate,
      this.shotsOffTarget,
      this.goals,
      this.punches,
      this.throws,
      this.duelLost,
      this.duelWon,
      this.formationPlace,
      this.accurateForwardZonePass,
      this.accurateBackZonePass,
      this.successFinalThirdPasses,
      this.totalFinalThirdPasses,
      this.playerRating,
      this.lostPossession,
      this.longPassOwnToOpponentSuccess,
      this.ballRecoveries,
      this.touches,
      this.headedClearance,
      this.goalsConcededViaPenalty,
      this.goalsConceded,
      this.expectedGoals,
      this.expectedGoalsNonPenalty,
      this.expectedGoalsConceded,
      this.expectedGoalsOpenPlay,
      this.expectedGoalsOnTargetConceded,
      this.expectedGoalsOnTargetNonPenaltyConceded,
      this.expectedAssists,
      this.finalThirdEntries,
      this.shotsInsideBox,
      this.aerialsLost,
      this.tacklesAttempted,
      this.interceptions,
      this.offsides,
      this.foulsConceded,
      this.bigChance,
      this.shotsOnTarget,
      this.penaltyWon,
      this.manOfTheMatch,
      this.dribbledPast,
      this.expectedGoalsSetPlay,
      this.expectedGoalsOnTarget,
      this.bigChanceScored,
      this.dispossessed,
      this.tacklesSuccess,
      this.yellowCard,
      this.accurateCrosses,
      this.corners,
      this.bigChanceMissed,
      this.cleanSheet,
      this.assists,
      this.goodHighClaim,
      this.bigChanceCreated,
      this.saves,
      this.savesOutBox,
      this.penaltyGoalConceded,
      this.divingSave,
      this.diveSave});

  PlayerStats.fromJson(Map<String, dynamic> json) {
    playerId = json['PlayerId'];
    playerName = json['PlayerName'];
    playsOnHomeTeam = json['PlaysOnHomeTeam'];
    gameStarted = json['GameStarted'];
    optaId = json['OptaId'];
    goalsConcededInBox = json['GoalsConcededInBox'];
    shotsOutsideBox = json['ShotsOutsideBox'];
    totalPasses = json['TotalPasses'];
    passSuccess = json['PassSuccess'];
    keyPasses = json['KeyPasses'];
    dribblesAttempted = json['DribblesAttempted'];
    dribblesWon = json['DribblesWon'];
    aerialsWon = json['AerialsWon'];
    clearances = json['Clearances'];
    wasFouled = json['WasFouled'];
    totalCrosses = json['TotalCrosses'];
    minutesPlayed = json['MinutesPlayed'];
    longBall = json['LongBall'];
    longBallAccurate = json['LongBallAccurate'];
    shotsOffTarget = json['ShotsOffTarget'];
    goals = json['Goals'];
    punches = json['Punches'];
    throws = json['Throws'];
    duelLost = json['DuelLost'];
    duelWon = json['DuelWon'];
    formationPlace = json['FormationPlace'];
    accurateForwardZonePass = json['AccurateForwardZonePass'];
    accurateBackZonePass = json['AccurateBackZonePass'];
    successFinalThirdPasses = json['SuccessFinalThirdPasses'];
    totalFinalThirdPasses = json['TotalFinalThirdPasses'];
    playerRating = json['PlayerRating'];
    lostPossession = json['LostPossession'];
    longPassOwnToOpponentSuccess = json['LongPassOwnToOpponentSuccess'];
    ballRecoveries = json['BallRecoveries'];
    touches = json['Touches'];
    headedClearance = json['HeadedClearance'];
    goalsConcededViaPenalty = json['GoalsConcededViaPenalty'];
    goalsConceded = json['GoalsConceded'];
    expectedGoals = json['ExpectedGoals'];
    expectedGoalsNonPenalty = json['ExpectedGoalsNonPenalty'];
    expectedGoalsConceded = json['ExpectedGoalsConceded'];
    expectedGoalsOpenPlay = json['ExpectedGoalsOpenPlay'];
    expectedGoalsOnTargetConceded = json['ExpectedGoalsOnTargetConceded'];
    expectedGoalsOnTargetNonPenaltyConceded = json['ExpectedGoalsOnTargetNonPenaltyConceded'];
    expectedAssists = json['ExpectedAssists'];
    finalThirdEntries = json['FinalThirdEntries'];
    shotsInsideBox = json['ShotsInsideBox'];
    aerialsLost = json['AerialsLost'];
    tacklesAttempted = json['TacklesAttempted'];
    interceptions = json['interceptions'];
    offsides = json['Offsides'];
    foulsConceded = json['FoulsConceded'];

    ///
    bigChance = json['BigChance'] ?? 0;
    shotsOnTarget = json['ShotsOnTarget'];
    penaltyWon = json['PenaltyWon'];
    manOfTheMatch = json['ManOfTheMatch'];
    dribbledPast = json['DribbledPast'];
    expectedGoalsSetPlay = json['ExpectedGoalsSetPlay'];
    expectedGoalsOnTarget = json['ExpectedGoalsOnTarget'];
    bigChanceScored = json['BigChanceScored'];
    dispossessed = json['Dispossessed'];
    tacklesSuccess = json['TacklesSuccess'];
    yellowCard = json['YellowCard'];
    accurateCrosses = json['AccurateCrosses'];
    corners = json['Corners'];
    bigChanceMissed = json['BigChanceMissed'];
    cleanSheet = json['CleanSheet'];
    assists = json['Assists'];
    goodHighClaim = json['GoodHighClaim'];
    bigChanceCreated = json['BigChanceCreated'];
    saves = json['Saves'];
    savesOutBox = json['SavesOutBox'];
    penaltyGoalConceded = json['PenaltyGoalConceded'];
    divingSave = json['DivingSave'];
    diveSave = json['DiveSave'];
    saves = json['Saves'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PlayerId'] = playerId;
    data['PlayerName'] = playerName;
    data['PlaysOnHomeTeam'] = playsOnHomeTeam;
    data['GameStarted'] = gameStarted;
    data['OptaId'] = optaId;
    data['GoalsConcededInBox'] = goalsConcededInBox;
    data['ShotsOutsideBox'] = shotsOutsideBox;
    data['TotalPasses'] = totalPasses;
    data['PassSuccess'] = passSuccess;
    data['KeyPasses'] = keyPasses;
    data['DribblesAttempted'] = dribblesAttempted;
    data['DribblesWon'] = dribblesWon;
    data['AerialsWon'] = aerialsWon;
    data['Clearances'] = clearances;
    data['WasFouled'] = wasFouled;
    data['TotalCrosses'] = totalCrosses;
    data['MinutesPlayed'] = minutesPlayed;
    data['LongBall'] = longBall;
    data['LongBallAccurate'] = longBallAccurate;
    data['ShotsOffTarget'] = shotsOffTarget;
    data['Goals'] = goals;
    data['Punches'] = punches;
    data['Throws'] = throws;
    data['DuelLost'] = duelLost;
    data['DuelWon'] = duelWon;
    data['FormationPlace'] = formationPlace;
    data['AccurateForwardZonePass'] = accurateForwardZonePass;
    data['AccurateBackZonePass'] = accurateBackZonePass;
    data['SuccessFinalThirdPasses'] = successFinalThirdPasses;
    data['TotalFinalThirdPasses'] = totalFinalThirdPasses;
    data['PlayerRating'] = playerRating;
    data['LostPossession'] = lostPossession;
    data['LongPassOwnToOpponentSuccess'] = longPassOwnToOpponentSuccess;
    data['BallRecoveries'] = ballRecoveries;
    data['Touches'] = touches;
    data['HeadedClearance'] = headedClearance;
    data['GoalsConcededViaPenalty'] = goalsConcededViaPenalty;
    data['GoalsConceded'] = goalsConceded;
    data['ExpectedGoals'] = expectedGoals;
    data['ExpectedGoalsNonPenalty'] = expectedGoalsNonPenalty;
    data['ExpectedGoalsConceded'] = expectedGoalsConceded;
    data['ExpectedGoalsOpenPlay'] = expectedGoalsOpenPlay;
    data['ExpectedGoalsOnTargetConceded'] = expectedGoalsOnTargetConceded;
    data['ExpectedGoalsOnTargetNonPenaltyConceded'] = expectedGoalsOnTargetNonPenaltyConceded;
    data['ExpectedAssists'] = expectedAssists;
    data['FinalThirdEntries'] = finalThirdEntries;
    data['ShotsInsideBox'] = shotsInsideBox;
    data['AerialsLost'] = aerialsLost;
    data['TacklesAttempted'] = tacklesAttempted;
    data['interceptions'] = interceptions;
    data['Offsides'] = offsides;
    data['FoulsConceded'] = foulsConceded;
    data['BigChance'] = bigChance;
    data['ShotsOnTarget'] = shotsOnTarget;
    data['PenaltyWon'] = penaltyWon;
    data['ManOfTheMatch'] = manOfTheMatch;
    data['DribbledPast'] = dribbledPast;
    data['ExpectedGoalsSetPlay'] = expectedGoalsSetPlay;
    data['ExpectedGoalsOnTarget'] = expectedGoalsOnTarget;
    data['BigChanceScored'] = bigChanceScored;
    data['Dispossessed'] = dispossessed;
    data['TacklesSuccess'] = tacklesSuccess;
    data['YellowCard'] = yellowCard;
    data['AccurateCrosses'] = accurateCrosses;
    data['Corners'] = corners;
    data['BigChanceMissed'] = bigChanceMissed;
    data['CleanSheet'] = cleanSheet;
    data['Assists'] = assists;
    data['GoodHighClaim'] = goodHighClaim;
    data['BigChanceCreated'] = bigChanceCreated;
    data['Saves'] = saves;
    data['SavesOutBox'] = savesOutBox;
    data['PenaltyGoalConceded'] = penaltyGoalConceded;
    data['DivingSave'] = divingSave;
    data['DiveSave'] = diveSave;
    data['Saves'] = saves;

    return data;
  }
}

class HomeTeamStats {
  String? teamName;
  int? teamId;
  bool? gameStarted;
  int? corners;
  String? optaId;
  int? saves;
  int? savesOutBox;
  int? goalsConcededInBox;
  int? shotsInsideBox;
  int? shotsOutsideBox;
  int? totalPasses;
  int? passSuccess;
  int? keyPasses;
  int? dribblesAttempted;
  int? dribblesWon;
  int? aerialsWon;
  int? aerialsLost;
  int? tacklesSuccess;
  int? tacklesAttempted;
  int? clearances;
  int? interceptions;
  int? dispossessed;
  int? offsides;
  int? foulsConceded;
  int? possession;
  double? possessionAsDouble;
  int? totalCrosses;
  int? bigChanceCreated;
  int? bigChanceMissed;
  int? bigChance;
  int? longBall;
  int? longBallAccurate;
  int? shotsOffTarget;
  int? goals;
  int? punches;
  int? throws;
  int? duelLost;
  int? duelWon;
  int? accurateForwardZonePass;
  int? accurateBackZonePass;
  int? accurateCrosses;
  int? successFinalThirdPasses;
  int? totalFinalThirdPasses;
  int? penaltyGoalConceded;
  int? formationUsed;
  double? playerRating;
  int? lostPossession;
  int? longPassOwnToOpponentSuccess;
  int? homeAttendance;
  int? divingSave;
  int? ballRecoveries;
  int? touches;
  int? headedClearance;
  int? dribbledPast;
  int? goalsConcededViaPenalty;
  int? goalsConceded;
  double? expectedGoals;
  double? expectedGoalsNonPenalty;
  double? expectedGoalsSetPlay;
  double? expectedGoalsConceded;
  double? expectedGoalsOpenPlay;
  double? expectedGoalsOnTargetConceded;
  double? expectedGoalsOnTargetNonPenaltyConceded;
  double? expectedGoalsFirstHalf;
  double? expectedGoalsSecondHalf;
  double? expectedAssists;
  double? expectedGoalsPenalty;
  int? finalThirdEntries;
  double? expectedGoalsOnTarget;
  int? shotsOnTarget;

  HomeTeamStats(
      {this.teamName,
      this.teamId,
      this.gameStarted,
      this.corners,
      this.optaId,
      this.shotsOnTarget,
      this.saves,
      this.savesOutBox,
      this.goalsConcededInBox,
      this.shotsInsideBox,
      this.shotsOutsideBox,
      this.totalPasses,
      this.passSuccess,
      this.keyPasses,
      this.dribblesAttempted,
      this.dribblesWon,
      this.aerialsWon,
      this.expectedGoalsSetPlay,
      this.aerialsLost,
      this.tacklesSuccess,
      this.tacklesAttempted,
      this.clearances,
      this.interceptions,
      this.dispossessed,
      this.offsides,
      this.foulsConceded,
      this.possession,
      this.possessionAsDouble,
      this.totalCrosses,
      this.bigChanceCreated,
      this.bigChanceMissed,
      this.bigChance,
      this.longBall,
      this.longBallAccurate,
      this.shotsOffTarget,
      this.goals,
      this.punches,
      this.throws,
      this.duelLost,
      this.duelWon,
      this.accurateForwardZonePass,
      this.accurateBackZonePass,
      this.accurateCrosses,
      this.successFinalThirdPasses,
      this.totalFinalThirdPasses,
      this.penaltyGoalConceded,
      this.formationUsed,
      this.playerRating,
      this.lostPossession,
      this.longPassOwnToOpponentSuccess,
      this.homeAttendance,
      this.divingSave,
      this.ballRecoveries,
      this.touches,
      this.headedClearance,
      this.dribbledPast,
      this.goalsConcededViaPenalty,
      this.goalsConceded,
      this.expectedGoals,
      this.expectedGoalsNonPenalty,
      this.expectedGoalsConceded,
      this.expectedGoalsOpenPlay,
      this.expectedGoalsOnTargetConceded,
      this.expectedGoalsOnTargetNonPenaltyConceded,
      this.expectedGoalsFirstHalf,
      this.expectedGoalsSecondHalf,
      this.expectedGoalsOnTarget,
      this.expectedGoalsPenalty,
      this.expectedAssists,
      this.finalThirdEntries});

  HomeTeamStats.fromJson(Map<String, dynamic> json) {
    teamName = json['TeamName'];
    teamId = json['TeamId'];
    gameStarted = json['GameStarted'];
    corners = json['Corners'];
    optaId = json['OptaId'];
    saves = json['Saves'];
    savesOutBox = json['SavesOutBox'];
    goalsConcededInBox = json['GoalsConcededInBox'];
    shotsInsideBox = json['ShotsInsideBox'];
    shotsOutsideBox = json['ShotsOutsideBox'];
    totalPasses = json['TotalPasses'];
    passSuccess = json['PassSuccess'];
    keyPasses = json['KeyPasses'];
    dribblesAttempted = json['DribblesAttempted'];
    dribblesWon = json['DribblesWon'];
    aerialsWon = json['AerialsWon'];
    aerialsLost = json['AerialsLost'];
    tacklesSuccess = json['TacklesSuccess'];
    tacklesAttempted = json['TacklesAttempted'];
    clearances = json['Clearances'];
    interceptions = json['interceptions'];
    dispossessed = json['Dispossessed'];
    offsides = json['Offsides'];
    foulsConceded = json['FoulsConceded'];
    possession = json['Possession'];
    possessionAsDouble = json['PossessionAsDouble'];
    totalCrosses = json['TotalCrosses'];
    bigChanceCreated = json['BigChanceCreated'];
    bigChanceMissed = json['BigChanceMissed'] ?? 0;
    bigChance = json['BigChance'];
    longBall = json['LongBall'];
    longBallAccurate = json['LongBallAccurate'];
    shotsOffTarget = json['ShotsOffTarget'];
    goals = json['Goals'];
    punches = json['Punches'] ?? 0;
    throws = json['Throws'];
    duelLost = json['DuelLost'];
    duelWon = json['DuelWon'];
    accurateForwardZonePass = json['AccurateForwardZonePass'];
    accurateBackZonePass = json['AccurateBackZonePass'];
    accurateCrosses = json['AccurateCrosses'];
    successFinalThirdPasses = json['SuccessFinalThirdPasses'];
    totalFinalThirdPasses = json['TotalFinalThirdPasses'];
    penaltyGoalConceded = json['PenaltyGoalConceded'];
    formationUsed = json['FormationUsed'];
    playerRating = json['PlayerRating'];
    lostPossession = json['LostPossession'];
    longPassOwnToOpponentSuccess = json['LongPassOwnToOpponentSuccess'];
    homeAttendance = json['HomeAttendance'];
    divingSave = json['DivingSave'];
    ballRecoveries = json['BallRecoveries'];
    touches = json['Touches'];
    headedClearance = json['HeadedClearance'];
    dribbledPast = json['DribbledPast'];
    goalsConcededViaPenalty = json['GoalsConcededViaPenalty'];
    goalsConceded = json['GoalsConceded'];
    expectedGoals = json['ExpectedGoals'];
    expectedGoalsNonPenalty = json['ExpectedGoalsNonPenalty'];
    expectedGoalsConceded = json['ExpectedGoalsConceded'];
    expectedGoalsOpenPlay = json['ExpectedGoalsOpenPlay'];
    expectedGoalsSetPlay = json['ExpectedGoalsSetPlay'];
    expectedGoalsOnTargetConceded = json['ExpectedGoalsOnTargetConceded'];
    expectedGoalsOnTargetNonPenaltyConceded = json['ExpectedGoalsOnTargetNonPenaltyConceded'];
    expectedGoalsFirstHalf = json['ExpectedGoalsFirstHalf'];
    expectedGoalsSecondHalf = json['ExpectedGoalsSecondHalf'];
    expectedAssists = json['ExpectedAssists'];
    finalThirdEntries = json['FinalThirdEntries'];
    expectedGoalsPenalty = json['expectedGoalsPenalty'];
    expectedGoalsOnTarget = json['ExpectedGoalsOnTarget'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['TeamName'] = teamName;
    data['TeamId'] = teamId;
    data['GameStarted'] = gameStarted;
    data['Corners'] = corners;
    data['OptaId'] = optaId;
    data['Saves'] = saves;
    data['SavesOutBox'] = savesOutBox;
    data['GoalsConcededInBox'] = goalsConcededInBox;
    data['ShotsInsideBox'] = shotsInsideBox;
    data['ShotsOutsideBox'] = shotsOutsideBox;
    data['TotalPasses'] = totalPasses;
    data['PassSuccess'] = passSuccess;
    data['KeyPasses'] = keyPasses;
    data['DribblesAttempted'] = dribblesAttempted;
    data['DribblesWon'] = dribblesWon;
    data['expectedGoalsSetPlay'] = expectedGoalsSetPlay;
    data['AerialsWon'] = aerialsWon;
    data['AerialsLost'] = aerialsLost;
    data['TacklesSuccess'] = tacklesSuccess;
    data['TacklesAttempted'] = tacklesAttempted;
    data['Clearances'] = clearances;
    data['interceptions'] = interceptions;
    data['Dispossessed'] = dispossessed;
    data['Offsides'] = offsides;
    data['FoulsConceded'] = foulsConceded;
    data['Possession'] = possession;
    data['PossessionAsDouble'] = possessionAsDouble;
    data['TotalCrosses'] = totalCrosses;
    data['BigChanceCreated'] = bigChanceCreated;
    data['BigChanceMissed'] = bigChanceMissed ?? 0;
    data['BigChance'] = bigChance;
    data['LongBall'] = longBall;
    data['LongBallAccurate'] = longBallAccurate;
    data['ShotsOffTarget'] = shotsOffTarget;
    data['Goals'] = goals;
    data['Punches'] = punches ?? 0;
    data['Throws'] = throws;
    data['DuelLost'] = duelLost;
    data['DuelWon'] = duelWon;
    data['AccurateForwardZonePass'] = accurateForwardZonePass;
    data['AccurateBackZonePass'] = accurateBackZonePass;
    data['AccurateCrosses'] = accurateCrosses;
    data['SuccessFinalThirdPasses'] = successFinalThirdPasses;
    data['TotalFinalThirdPasses'] = totalFinalThirdPasses;
    data['PenaltyGoalConceded'] = penaltyGoalConceded;
    data['FormationUsed'] = formationUsed;
    data['PlayerRating'] = playerRating;
    data['LostPossession'] = lostPossession;
    data['LongPassOwnToOpponentSuccess'] = longPassOwnToOpponentSuccess;
    data['HomeAttendance'] = homeAttendance;
    data['DivingSave'] = divingSave;
    data['BallRecoveries'] = ballRecoveries;
    data['Touches'] = touches;
    data['HeadedClearance'] = headedClearance;
    data['DribbledPast'] = dribbledPast;
    data['GoalsConcededViaPenalty'] = goalsConcededViaPenalty;
    data['GoalsConceded'] = goalsConceded;
    data['ExpectedGoals'] = expectedGoals;
    data['ExpectedGoalsNonPenalty'] = expectedGoalsNonPenalty;
    data['ExpectedGoalsConceded'] = expectedGoalsConceded;
    data['ExpectedGoalsOpenPlay'] = expectedGoalsOpenPlay;
    data['ExpectedGoalsOnTargetConceded'] = expectedGoalsOnTargetConceded;
    data['ExpectedGoalsOnTargetNonPenaltyConceded'] = expectedGoalsOnTargetNonPenaltyConceded;
    data['ExpectedGoalsFirstHalf'] = expectedGoalsFirstHalf;
    data['ExpectedGoalsSecondHalf'] = expectedGoalsSecondHalf;
    data['ExpectedAssists'] = expectedAssists;
    data['FinalThirdEntries'] = finalThirdEntries;
    data['ExpectedGoalsOnTarget'] = expectedGoalsOnTarget;
    data['expectedGoalsPenalty'] = expectedGoalsPenalty;
    return data;
  }
}

class AwayTeamStats {
  String? teamName;
  int? teamId;
  bool? gameStarted;
  int? corners;
  String? optaId;
  int? shotsInsideBox;
  int? shotsOutsideBox;
  int? totalPasses;
  int? passSuccess;
  int? keyPasses;
  int? dribblesAttempted;
  int? dribblesWon;
  int? aerialsWon;
  int? aerialsLost;
  int? tacklesSuccess;
  int? tacklesAttempted;
  int? clearances;
  int? interceptions;
  int? dispossessed;
  int? offsides;
  int? foulsConceded;
  int? possession;
  double? possessionAsDouble;
  int? totalCrosses;
  int? bigChance;
  int? assists;
  int? longBall;
  int? longBallAccurate;
  int? shotsOnTarget;
  int? shotsOffTarget;
  int? goals;
  int? punches;
  int? throws;
  int? duelLost;
  int? duelWon;
  int? accurateForwardZonePass;
  int? accurateBackZonePass;
  int? accurateCrosses;
  int? successFinalThirdPasses;
  int? totalFinalThirdPasses;
  int? formationUsed;
  int? penaltyWon;
  double? playerRating;
  int? lostPossession;
  int? longPassOwnToOpponentSuccess;
  int? goodHighClaim;
  int? cleanSheet;
  int? ballRecoveries;
  int? touches;
  int? headedClearance;
  int? dribbledPast;
  double? expectedGoalsSetPlay;
  double? expectedGoals;
  double? expectedGoalsNonPenalty;
  double? expectedGoalsPenalty;
  int? saves;
  double? expectedGoalsConceded;
  double? expectedGoalsOpenPlay;
  double? expectedGoalsOnTarget;
  double? expectedGoalsOnTargetFirstHalf;
  double? expectedGoalsOnTargetSecondHalf;
  double? expectedGoalsFirstHalf;
  double? expectedGoalsSecondHalf;
  double? expectedAssists;
  int? bigChanceScored;
  int? finalThirdEntries;

  AwayTeamStats(
      {this.teamName,
      this.teamId,
      this.gameStarted,
      this.corners,
      this.optaId,
      this.shotsInsideBox,
      this.shotsOutsideBox,
      this.totalPasses,
      this.passSuccess,
      this.keyPasses,
      this.dribblesAttempted,
      this.dribblesWon,
      this.aerialsWon,
      this.expectedGoalsPenalty,
      this.saves,
      this.aerialsLost,
      this.tacklesSuccess,
      this.tacklesAttempted,
      this.clearances,
      this.interceptions,
      this.dispossessed,
      this.offsides,
      this.foulsConceded,
      this.possession,
      this.possessionAsDouble,
      this.totalCrosses,
      this.bigChance,
      this.assists,
      this.longBall,
      this.longBallAccurate,
      this.shotsOnTarget,
      this.shotsOffTarget,
      this.goals,
      this.punches,
      this.throws,
      this.duelLost,
      this.duelWon,
      this.accurateForwardZonePass,
      this.accurateBackZonePass,
      this.accurateCrosses,
      this.successFinalThirdPasses,
      this.totalFinalThirdPasses,
      this.formationUsed,
      this.penaltyWon,
      this.playerRating,
      this.lostPossession,
      this.longPassOwnToOpponentSuccess,
      this.goodHighClaim,
      this.cleanSheet,
      this.ballRecoveries,
      this.touches,
      this.headedClearance,
      this.dribbledPast,
      this.expectedGoalsSetPlay,
      this.expectedGoals,
      this.expectedGoalsNonPenalty,
      this.expectedGoalsConceded,
      this.expectedGoalsOpenPlay,
      this.expectedGoalsOnTarget,
      this.expectedGoalsOnTargetFirstHalf,
      this.expectedGoalsOnTargetSecondHalf,
      this.expectedGoalsFirstHalf,
      this.expectedGoalsSecondHalf,
      this.expectedAssists,
      this.bigChanceScored,
      this.finalThirdEntries});

  AwayTeamStats.fromJson(Map<String, dynamic> json) {
    teamName = json['TeamName'];
    shotsOnTarget = json['ShotsOnTarget'] ?? 0;
    teamId = json['TeamId'];
    gameStarted = json['GameStarted'];
    corners = json['Corners'] ?? 0;
    optaId = json['OptaId'];
    expectedGoalsPenalty = json['expectedGoalsPenalty'];
    shotsInsideBox = json['ShotsInsideBox'];
    shotsOutsideBox = json['ShotsOutsideBox'];
    totalPasses = json['TotalPasses'];
    passSuccess = json['PassSuccess'];
    keyPasses = json['KeyPasses'];
    dribblesAttempted = json['DribblesAttempted'];
    dribblesWon = json['DribblesWon'];
    aerialsWon = json['AerialsWon'];
    aerialsLost = json['AerialsLost'];
    tacklesSuccess = json['TacklesSuccess'];
    tacklesAttempted = json['TacklesAttempted'];
    clearances = json['Clearances'];
    interceptions = json['interceptions'];
    dispossessed = json['Dispossessed'];
    offsides = json['Offsides'] ?? 0;
    foulsConceded = json['FoulsConceded'];
    possession = json['Possession'];
    possessionAsDouble = json['PossessionAsDouble'];
    totalCrosses = json['TotalCrosses'];
    bigChance = json['BigChance'];
    assists = json['Assists'];
    longBall = json['LongBall'];
    longBallAccurate = json['LongBallAccurate'];
    shotsOnTarget = json['ShotsOnTarget'] ?? 0;
    shotsOffTarget = json['ShotsOffTarget'] ?? 0;
    goals = json['Goals'];
    punches = json['Punches'] ?? 0;
    throws = json['Throws'];
    duelLost = json['DuelLost'];
    duelWon = json['DuelWon'];
    accurateForwardZonePass = json['AccurateForwardZonePass'];
    accurateBackZonePass = json['AccurateBackZonePass'];
    accurateCrosses = json['AccurateCrosses'];
    successFinalThirdPasses = json['SuccessFinalThirdPasses'];
    totalFinalThirdPasses = json['TotalFinalThirdPasses'];
    formationUsed = json['FormationUsed'];
    penaltyWon = json['PenaltyWon'];
    playerRating = json['PlayerRating'];
    lostPossession = json['LostPossession'];
    longPassOwnToOpponentSuccess = json['LongPassOwnToOpponentSuccess'];
    goodHighClaim = json['GoodHighClaim'];
    cleanSheet = json['CleanSheet'];
    ballRecoveries = json['BallRecoveries'];
    touches = json['Touches'];
    headedClearance = json['HeadedClearance'];
    dribbledPast = json['DribbledPast'];
    expectedGoalsSetPlay = json['ExpectedGoalsSetPlay'];
    expectedGoals = json['ExpectedGoals'];
    expectedGoalsNonPenalty = json['ExpectedGoalsNonPenalty'];
    expectedGoalsConceded = json['ExpectedGoalsConceded'];
    expectedGoalsOpenPlay = json['ExpectedGoalsOpenPlay'];
    expectedGoalsOnTarget = json['ExpectedGoalsOnTarget'];
    expectedGoalsOnTargetFirstHalf = json['ExpectedGoalsOnTargetFirstHalf'];
    expectedGoalsOnTargetSecondHalf = json['ExpectedGoalsOnTargetSecondHalf'];
    expectedGoalsFirstHalf = json['ExpectedGoalsFirstHalf'];
    expectedGoalsSecondHalf = json['ExpectedGoalsSecondHalf'];
    expectedAssists = json['ExpectedAssists'];
    bigChanceScored = json['BigChanceScored'];
    finalThirdEntries = json['FinalThirdEntries'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['TeamName'] = teamName;
    data['ShotsOnTarget'] = shotsOnTarget;
    data['expectedGoalsPenalty'] = expectedGoalsPenalty;
    data['TeamId'] = teamId;
    data['GameStarted'] = gameStarted;
    data['Corners'] = corners;
    data['OptaId'] = optaId;
    data['ShotsInsideBox'] = shotsInsideBox;
    data['ShotsOutsideBox'] = shotsOutsideBox;
    data['TotalPasses'] = totalPasses;
    data['PassSuccess'] = passSuccess;
    data['KeyPasses'] = keyPasses;
    data['DribblesAttempted'] = dribblesAttempted;
    data['DribblesWon'] = dribblesWon;
    data['AerialsWon'] = aerialsWon;
    data['AerialsLost'] = aerialsLost;
    data['TacklesSuccess'] = tacklesSuccess;
    data['TacklesAttempted'] = tacklesAttempted;
    data['Clearances'] = clearances;
    data['interceptions'] = interceptions;
    data['Dispossessed'] = dispossessed;
    data['Offsides'] = offsides ?? 0;
    data['FoulsConceded'] = foulsConceded;
    data['Possession'] = possession;
    data['PossessionAsDouble'] = possessionAsDouble;
    data['TotalCrosses'] = totalCrosses;
    data['BigChance'] = bigChance;
    data['Assists'] = assists;
    data['LongBall'] = longBall;
    data['LongBallAccurate'] = longBallAccurate;
    data['ShotsOnTarget'] = shotsOnTarget;
    data['ShotsOffTarget'] = shotsOffTarget;
    data['Goals'] = goals;
    data['Punches'] = punches ?? 0;
    data['Throws'] = throws;
    data['DuelLost'] = duelLost;
    data['DuelWon'] = duelWon;
    data['AccurateForwardZonePass'] = accurateForwardZonePass;
    data['AccurateBackZonePass'] = accurateBackZonePass;
    data['AccurateCrosses'] = accurateCrosses;
    data['SuccessFinalThirdPasses'] = successFinalThirdPasses;
    data['TotalFinalThirdPasses'] = totalFinalThirdPasses;
    data['FormationUsed'] = formationUsed;
    data['PenaltyWon'] = penaltyWon;
    data['PlayerRating'] = playerRating;
    data['LostPossession'] = lostPossession;
    data['LongPassOwnToOpponentSuccess'] = longPassOwnToOpponentSuccess;
    data['GoodHighClaim'] = goodHighClaim;
    data['CleanSheet'] = cleanSheet;
    data['BallRecoveries'] = ballRecoveries;
    data['Touches'] = touches;
    data['HeadedClearance'] = headedClearance;
    data['DribbledPast'] = dribbledPast;
    data['ExpectedGoalsSetPlay'] = expectedGoalsSetPlay;
    data['ExpectedGoals'] = expectedGoals;
    data['ExpectedGoalsNonPenalty'] = expectedGoalsNonPenalty;
    data['ExpectedGoalsConceded'] = expectedGoalsConceded;
    data['ExpectedGoalsOpenPlay'] = expectedGoalsOpenPlay;
    data['ExpectedGoalsOnTarget'] = expectedGoalsOnTarget;
    data['ExpectedGoalsOnTargetFirstHalf'] = expectedGoalsOnTargetFirstHalf;
    data['ExpectedGoalsOnTargetSecondHalf'] = expectedGoalsOnTargetSecondHalf;
    data['ExpectedGoalsFirstHalf'] = expectedGoalsFirstHalf;
    data['ExpectedGoalsSecondHalf'] = expectedGoalsSecondHalf;
    data['ExpectedAssists'] = expectedAssists;
    data['BigChanceScored'] = bigChanceScored;
    data['FinalThirdEntries'] = finalThirdEntries;
    data['Saves'] = saves;

    return data;
  }
}
