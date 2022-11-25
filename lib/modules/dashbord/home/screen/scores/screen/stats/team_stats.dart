import 'package:football/modules/dashbord/home/controller/home_controller.dart';
import 'package:football/modules/dashbord/home/model/detailes_stats_model.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/navigation_utils/routes.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamStats extends StatefulWidget {
  TeamStats({Key? key}) : super(key: key);

  @override
  State<TeamStats> createState() => _TeamStatsState();
}

class _TeamStatsState extends State<TeamStats> {
  final HomeController _homeController = Get.find();

  List<String> topStats = [
    'Expected goals (xG)',
    'Total shots',
    'Big chances missed',
    'Accurate Passes',
    'Fouls committed',
    'offsides',
    'corners'
  ];

  List<String> shots = ['Blocked shots', 'Hit Woodwork', 'Shots inside box', 'Shots outside box'];

  List<String> expectedGoals = [
    'Expected goals (xG)',
    'xG first half',
    'xG second half',
    'xG open play',
    'xG set play',
    'xG penalty',
    'xG on target (xGOT)'
  ];

  List<String> passes = ['Passes', 'Accurate passes', 'Own half', 'Accurate long balls', 'Accurate crosses', 'Throws'];

  List<String> defence = ['Tackles won', 'Interceptions', 'Clearances', 'Keeper Saves'];

  List<String> duels = [
    'Duels won',
    'Aerial duels won',
  ];

  // List<String> discipline = ['Yellow cards', 'Red cards'];
  topStatsHomeTeamData(index) {
    HomeTeamStats? stats = _homeController.matchDetailsModel?.value.root?.detailedstats?.homeTeamStats;
    if (index == 0) {
      return stats?.expectedGoals;
    } else if (index == 1) {
      return int.parse((stats?.shotsInsideBox ?? '0').toString()) +
          int.parse((stats?.shotsOutsideBox ?? '0').toString());
    } else if (index == 2) {
      return stats?.bigChanceMissed;
    } else if (index == 3) {
      return stats?.passSuccess;
    } else if (index == 4) {
      return stats?.foulsConceded;
    } else if (index == 5) {
      return stats?.offsides;
    } else if (index == 6) {
      return stats?.corners;
    }
  }

  topAwayTeamTeamData(index) {
    AwayTeamStats? stats = _homeController.matchDetailsModel?.value.root?.detailedstats?.awayTeamStats;
    if (index == 0) {
      return stats?.expectedGoals;
    } else if (index == 1) {
      return int.parse((stats?.shotsInsideBox ?? '0').toString()) +
          int.parse((stats?.shotsOutsideBox ?? '0').toString());
    } else if (index == 2) {
      return stats?.punches;
    } else if (index == 3) {
      return stats?.passSuccess;
    } else if (index == 4) {
      return stats?.foulsConceded;
    } else if (index == 5) {
      return stats?.offsides;
    } else if (index == 6) {
      return stats?.corners;
    }
  }

  shotsAwayListData(index) {
    AwayTeamStats? stats = _homeController.matchDetailsModel?.value.root?.detailedstats?.awayTeamStats;
    if (index == 0) {
      return stats?.shotsInsideBox;
    } else if (index == 1) {
      return int.parse((stats?.shotsInsideBox ?? '0').toString()) +
          int.parse((stats?.shotsOutsideBox ?? '0').toString());
    } else if (index == 2) {
      return stats?.shotsInsideBox;
    } else if (index == 3) {
      return stats?.shotsOutsideBox;
    }
  }

  shotsHomeTeamListData(index) {
    HomeTeamStats? stats = _homeController.matchDetailsModel?.value.root?.detailedstats?.homeTeamStats;
    if (index == 0) {
      return stats?.shotsInsideBox;
    } else if (index == 1) {
      return int.parse((stats?.shotsInsideBox ?? '0').toString()) +
          int.parse((stats?.shotsOutsideBox ?? '0').toString());
    } else if (index == 2) {
      return stats?.shotsInsideBox;
    } else if (index == 3) {
      return stats?.shotsOutsideBox;
    }
  }

  expectedGoalsAwayListData(index) {
    HomeTeamStats? stats = _homeController.matchDetailsModel?.value.root?.detailedstats?.homeTeamStats;
    if (index == 0) {
      return stats?.expectedGoals ?? 0;
    } else if (index == 1) {
      return stats?.expectedGoalsFirstHalf ?? 0;
    } else if (index == 2) {
      return stats?.expectedGoalsSecondHalf ?? 0;
    } else if (index == 3) {
      return stats?.expectedGoalsOpenPlay ?? 0;
    } else if (index == 4) {
      return stats?.expectedGoalsSetPlay ?? 0;
    } else if (index == 5) {
      ///penalty
      return stats?.expectedGoalsPenalty ?? 0;
    } else if (index == 6) {
      return stats?.expectedGoalsOnTarget ?? 0;
    }
  }

  expectedGoalsHomeTeamListData(index) {
    AwayTeamStats? stats = _homeController.matchDetailsModel?.value.root?.detailedstats?.awayTeamStats;
    if (index == 0) {
      return stats?.expectedGoals ?? 0;
    } else if (index == 1) {
      return stats?.expectedGoalsFirstHalf ?? 0;
    } else if (index == 2) {
      return stats?.expectedGoalsSecondHalf;
    } else if (index == 3) {
      return stats?.expectedGoalsOpenPlay ?? 0;
    } else if (index == 4) {
      return stats?.expectedGoalsSetPlay ?? 0;
    } else if (index == 5) {
      return stats?.expectedGoalsPenalty ?? 0;
    } else if (index == 6) {
      return stats?.expectedGoalsOnTarget ?? 0;
    }
  }

  passesGoalsHomeTeamListData(index) {
    HomeTeamStats? stats = _homeController.matchDetailsModel?.value.root?.detailedstats?.homeTeamStats;
    if (index == 0) {
      return stats?.totalPasses ?? 0;
    } else if (index == 1) {
      return stats?.passSuccess ?? 0;
    } else if (index == 2) {
      return stats?.accurateBackZonePass ?? 0;
    } else if (index == 3) {
      return stats?.longBallAccurate ?? 0;
    } else if (index == 4) {
      return stats?.accurateCrosses ?? 0;
    } else if (index == 5) {
      return stats?.throws ?? 0;
    }
  }

  passesGoalsAwayListData(index) {
    AwayTeamStats? stats = _homeController.matchDetailsModel?.value.root?.detailedstats?.awayTeamStats;
    if (index == 0) {
      return stats?.totalPasses ?? 0;
    } else if (index == 1) {
      return stats?.passSuccess ?? 0;
    } else if (index == 2) {
      return stats?.accurateBackZonePass;
    } else if (index == 3) {
      return stats?.longBallAccurate ?? 0;
    } else if (index == 4) {
      return stats?.accurateCrosses ?? 0;
    } else if (index == 5) {
      return stats?.throws ?? 0;
    }
  }

  duelsGoalsAwayListData(index) {
    AwayTeamStats? stats = _homeController.matchDetailsModel?.value.root?.detailedstats?.awayTeamStats;
    if (index == 0) {
      return stats?.duelWon ?? 0;
    } else if (index == 1) {
      return stats?.aerialsWon ?? 0;
    }
  }

  duelsGoalsHomeTeamListData(index) {
    HomeTeamStats? stats = _homeController.matchDetailsModel?.value.root?.detailedstats?.homeTeamStats;
    if (index == 0) {
      return stats?.duelWon ?? 0;
    } else if (index == 1) {
      return stats?.aerialsWon ?? 0;
    } else if (index == 2) {
      return stats?.clearances;
    } else if (index == 3) {
      return stats?.saves ?? 0;
    }
  }

  defenceGoalsAwayListData(index) {
    AwayTeamStats? stats = _homeController.matchDetailsModel?.value.root?.detailedstats?.awayTeamStats;
    if (index == 0) {
      return stats?.tacklesSuccess ?? 0;
    } else if (index == 1) {
      return stats?.interceptions ?? 0;
    } else if (index == 2) {
      return stats?.clearances ?? 0;
    } else if (index == 3) {
      return stats?.saves ?? 0;
    }
  }

  defenceGoalsHomeTeamListData(index) {
    HomeTeamStats? stats = _homeController.matchDetailsModel?.value.root?.detailedstats?.homeTeamStats;
    if (index == 0) {
      return stats?.tacklesSuccess ?? 0;
    } else if (index == 1) {
      return stats?.interceptions ?? 0;
    } else if (index == 2) {
      return stats?.clearances ?? 0;
    } else if (index == 3) {
      return stats?.saves ?? 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeUtils.horizontalBlockSize * 2,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeUtils.horizontalBlockSize * 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(Routes.playerDetailScreen);
                  },
                  child: Center(
                    child: AppText(
                      text: 'Top stats',
                      color: AppColors.black,
                      fontSize: SizeUtils.fSize_14(),
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeUtils.horizontalBlockSize * 3,
                  ),
                  child: Center(
                    child: AppText(
                      text: 'Ball possession',
                      color: AppColors.black,
                      fontSize: SizeUtils.fSize_13(),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(SizeUtils.horizontalBlockSize * 2),
                              bottomLeft: Radius.circular(SizeUtils.horizontalBlockSize * 2),
                            ),
                            color: AppColors.red),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 2.5),
                              child: AppText(
                                text:
                                    '${_homeController.matchDetailsModel?.value.root?.detailedstats?.homeTeamStats?.possession.toString() ?? '0'} %',
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: SizeUtils.fSize_14(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(SizeUtils.horizontalBlockSize * 2),
                              bottomRight: Radius.circular(SizeUtils.horizontalBlockSize * 2),
                            ),
                            color: AppColors.black),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 2.5),
                              child: AppText(
                                text:
                                    '${_homeController.matchDetailsModel?.value.root?.detailedstats?.awayTeamStats?.possession.toString() ?? '0'} %',
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: SizeUtils.fSize_14(),
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  constraints: const BoxConstraints(maxHeight: double.maxFinite),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: topStats.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 2),
                                color: AppColors.red.withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7, bottom: 5, right: 7, top: 5),
                              child: AppText(
                                text: topStatsHomeTeamData(index).toString(),
                                color: AppColors.black,
                                fontSize: SizeUtils.fSize_13(),
                              ),
                            ),
                          ),
                          AppText(
                            text: topStats[index],
                            color: AppColors.grey,
                            fontSize: SizeUtils.fSize_13(),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 2),
                                color: Colors.blue.withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7, bottom: 5, right: 7, top: 5),
                              child: AppText(
                                text: topAwayTeamTeamData(index).toString(),
                                color: AppColors.black,
                                fontSize: SizeUtils.fSize_13(),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeUtils.horizontalBlockSize * 2,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeUtils.horizontalBlockSize * 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Center(
                  child: AppText(
                    text: 'Shots',
                    color: AppColors.black,
                    fontSize: SizeUtils.fSize_14(),
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 17),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 2),
                          color: AppColors.red.withOpacity(0.1)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7, bottom: 5, right: 7, top: 5),
                        child: AppText(
                          text: '3',
                          color: AppColors.black,
                          fontSize: SizeUtils.fSize_13(),
                        ),
                      ),
                    ),
                    AppText(
                      text: 'TotalShots',
                      color: AppColors.grey,
                      fontSize: SizeUtils.fSize_13(),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 2),
                          color: Colors.blue.withOpacity(0.1)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7, bottom: 5, right: 7, top: 5),
                        child: AppText(
                          text: '3',
                          color: AppColors.black,
                          fontSize: SizeUtils.fSize_13(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 17),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(SizeUtils.horizontalBlockSize * 2),
                                  bottomLeft: Radius.circular(SizeUtils.horizontalBlockSize * 2),
                                ),
                                color: AppColors.red),
                            // child: Row(
                            //   children: [
                            //     const SizedBox(width: 10),
                            //     Padding(
                            //       padding: EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 2.5),
                            //       child: AppText(
                            //         text: '50%',
                            //         color: AppColors.white,
                            //         fontWeight: FontWeight.bold,
                            //         fontSize: SizeUtils.fSize_14(),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ),
                        ),
                        // const SizedBox(width: 5),
                        Expanded(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(SizeUtils.horizontalBlockSize * 2),
                                  bottomRight: Radius.circular(SizeUtils.horizontalBlockSize * 2),
                                ),
                                color: AppColors.black),
                            // child: Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     Padding(
                            //       padding: EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 2.5),
                            //       child: AppText(
                            //         text: '50%',
                            //         color: AppColors.white,
                            //         fontWeight: FontWeight.bold,
                            //         fontSize: SizeUtils.fSize_14(),
                            //       ),
                            //     ),
                            //     const SizedBox(width: 10),
                            //   ],
                            // ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 18),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        child: Container(
                          height: SizeUtils.horizontalBlockSize * 15,
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: AppColors.white, width: 6),
                              left: BorderSide(color: AppColors.white, width: 6),
                              right: BorderSide(color: AppColors.white, width: 6),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 7, bottom: 5, right: 7, top: 5),
                                  child: AppText(
                                    text: _homeController.matchDetailsModel?.value.root?.detailedstats?.homeTeamStats
                                            ?.shotsOutsideBox
                                            .toString() ??
                                        '',
                                    color: AppColors.white,
                                    fontSize: SizeUtils.fSize_15(),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                AppText(
                                  text: 'Shots on target',
                                  color: AppColors.white,
                                  fontSize: SizeUtils.fSize_14(),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 7, bottom: 5, right: 7, top: 5),
                                  child: AppText(
                                    text:
                                        "${_homeController.matchDetailsModel?.value.root?.detailedstats?.awayTeamStats?.shotsOnTarget ?? 0}",
                                    color: AppColors.white,
                                    fontSize: SizeUtils.fSize_15(),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: SizeUtils.horizontalBlockSize * 85,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 7, bottom: 5, right: 7, top: 5),
                              child: AppText(
                                text: _homeController
                                        .matchDetailsModel?.value.root?.detailedstats?.homeTeamStats?.shotsOffTarget
                                        .toString() ??
                                    '',
                                color: AppColors.white,
                                fontSize: SizeUtils.fSize_15(),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            AppText(
                              text: 'Shots off target',
                              color: AppColors.white,
                              fontSize: SizeUtils.fSize_14(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7, bottom: 5, right: 7, top: 5),
                              child: AppText(
                                text: _homeController
                                        .matchDetailsModel?.value.root?.detailedstats?.awayTeamStats?.shotsOffTarget
                                        .toString() ??
                                    '',
                                color: AppColors.white,
                                fontSize: SizeUtils.fSize_15(),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  constraints: const BoxConstraints(maxHeight: double.maxFinite),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: shots.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 2),
                                color: AppColors.red.withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7, bottom: 5, right: 7, top: 5),
                              child: AppText(
                                text: shotsHomeTeamListData(index).toString(),
                                color: AppColors.black,
                                fontSize: SizeUtils.fSize_13(),
                              ),
                            ),
                          ),
                          AppText(
                            text: shots[index],
                            color: AppColors.grey,
                            fontSize: SizeUtils.fSize_13(),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 2),
                                color: Colors.blue.withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7, bottom: 5, right: 7, top: 5),
                              child: AppText(
                                text: shotsAwayListData(index).toString(),
                                color: AppColors.black,
                                fontSize: SizeUtils.fSize_13(),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeUtils.horizontalBlockSize * 2,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeUtils.horizontalBlockSize * 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: 'Expected goals (xG)',
                      color: AppColors.black,
                      fontSize: SizeUtils.fSize_14(),
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(color: AppColors.grey.withOpacity(0.5), shape: BoxShape.circle),
                        child: const Icon(
                          Icons.question_mark_rounded,
                          size: 12,
                          color: AppColors.white,
                        ))
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  constraints: const BoxConstraints(maxHeight: double.maxFinite),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: expectedGoals.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 2),
                                color: AppColors.red.withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7, bottom: 5, right: 7, top: 5),
                              child: AppText(
                                text: expectedGoalsHomeTeamListData(index).toString(),
                                color: AppColors.black,
                                fontSize: SizeUtils.fSize_13(),
                              ),
                            ),
                          ),
                          AppText(
                            text: expectedGoals[index],
                            color: AppColors.grey,
                            fontSize: SizeUtils.fSize_13(),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 2),
                                color: Colors.blue.withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7, bottom: 5, right: 7, top: 5),
                              child: AppText(
                                text: expectedGoalsAwayListData(index).toString(),
                                color: AppColors.black,
                                fontSize: SizeUtils.fSize_13(),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeUtils.horizontalBlockSize * 2,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeUtils.horizontalBlockSize * 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: 'Passes',
                        color: AppColors.black,
                        fontSize: SizeUtils.fSize_14(),
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  constraints: const BoxConstraints(maxHeight: double.maxFinite),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: passes.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 2),
                                color: AppColors.red.withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7, bottom: 5, right: 7, top: 5),
                              child: AppText(
                                text: passesGoalsHomeTeamListData(index).toString(),
                                color: AppColors.black,
                                fontSize: SizeUtils.fSize_13(),
                              ),
                            ),
                          ),
                          AppText(
                            text: passes[index],
                            color: AppColors.grey,
                            fontSize: SizeUtils.fSize_13(),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 2),
                                color: Colors.blue.withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7, bottom: 5, right: 7, top: 5),
                              child: AppText(
                                text: passesGoalsAwayListData(index).toString(),
                                color: AppColors.black,
                                fontSize: SizeUtils.fSize_13(),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeUtils.horizontalBlockSize * 2,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeUtils.horizontalBlockSize * 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: 'Defence',
                        color: AppColors.black,
                        fontSize: SizeUtils.fSize_14(),
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  constraints: const BoxConstraints(maxHeight: double.maxFinite),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: defence.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 2),
                                color: AppColors.red.withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7, bottom: 5, right: 7, top: 5),
                              child: AppText(
                                text: defenceGoalsHomeTeamListData(index).toString(),
                                color: AppColors.black,
                                fontSize: SizeUtils.fSize_13(),
                              ),
                            ),
                          ),
                          AppText(
                            text: defence[index],
                            color: AppColors.grey,
                            fontSize: SizeUtils.fSize_13(),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 2),
                                color: Colors.blue.withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7, bottom: 5, right: 7, top: 5),
                              child: AppText(
                                text: defenceGoalsAwayListData(index).toString(),
                                color: AppColors.black,
                                fontSize: SizeUtils.fSize_13(),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeUtils.horizontalBlockSize * 2,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeUtils.horizontalBlockSize * 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: 'Duels',
                        color: AppColors.black,
                        fontSize: SizeUtils.fSize_14(),
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  constraints: const BoxConstraints(maxHeight: double.maxFinite),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: duels.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 2),
                                color: AppColors.red.withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7, bottom: 5, right: 7, top: 5),
                              child: AppText(
                                text: duelsGoalsHomeTeamListData(index).toString(),
                                color: AppColors.black,
                                fontSize: SizeUtils.fSize_13(),
                              ),
                            ),
                          ),
                          AppText(
                            text: duels[index],
                            color: AppColors.grey,
                            fontSize: SizeUtils.fSize_13(),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 2),
                                color: Colors.blue.withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7, bottom: 5, right: 7, top: 5),
                              child: AppText(
                                text: duelsGoalsAwayListData(index).toString(),
                                color: AppColors.black,
                                fontSize: SizeUtils.fSize_13(),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeUtils.horizontalBlockSize * 2,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeUtils.horizontalBlockSize * 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 15),
                // Center(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       AppText(
                //         text: 'Discipline',
                //         color: AppColors.black,
                //         fontSize: SizeUtils.fSize_14(),
                //         letterSpacing: 0.5,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 20),
                // Container(
                //   constraints:
                //       const BoxConstraints(maxHeight: double.maxFinite),
                //   child: ListView.separated(
                //     physics: const NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     itemCount: discipline.length,
                //     itemBuilder: (context, index) {
                //       return Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Container(
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(
                //                     SizeUtils.horizontalBlockSize * 2),
                //                 color: AppColors.red.withOpacity(0.1)),
                //             child: Padding(
                //               padding: const EdgeInsets.only(
                //                   left: 7, bottom: 5, right: 7, top: 5),
                //               child: AppText(
                //                 text: '3',
                //                 color: AppColors.black,
                //                 fontSize: SizeUtils.fSize_13(),
                //               ),
                //             ),
                //           ),
                //           AppText(
                //             text: discipline[index],
                //             color: AppColors.grey,
                //             fontSize: SizeUtils.fSize_13(),
                //           ),
                //           Container(
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(
                //                     SizeUtils.horizontalBlockSize * 2),
                //                 color: Colors.blue.withOpacity(0.1)),
                //             child: Padding(
                //               padding: const EdgeInsets.only(
                //                   left: 7, bottom: 5, right: 7, top: 5),
                //               child: AppText(
                //                 text: '3',
                //                 color: AppColors.black,
                //                 fontSize: SizeUtils.fSize_13(),
                //               ),
                //             ),
                //           ),
                //         ],
                //       );
                //     },
                //     separatorBuilder: (context, index) {
                //       return const SizedBox(height: 10);
                //     },
                //   ),
                // ),
                // const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
