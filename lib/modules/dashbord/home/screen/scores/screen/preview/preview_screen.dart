import 'package:football/ads/banner_ad.dart';
import 'package:football/helper/firebase_analyticsUtils.dart';
import 'package:football/helper/loading_helper.dart';
import 'package:football/model/arguments_match_detail_model.dart';
import 'package:football/modules/dashbord/home/controller/home_controller.dart';
import 'package:football/modules/dashbord/home/model/detailes_stats_model.dart';
import 'package:football/modules/dashbord/home/model/shotmap_model.dart';
import 'package:football/modules/dashbord/home/widget/top_player_widget.dart';
import 'package:football/modules/dashbord/ranking/controller/ranking_controller.dart';
import 'package:football/modules/dashbord/ranking/model/ranking_model.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/assets_path.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/utils/strings_utils.dart';
import 'package:football/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({Key? key}) : super(key: key);

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  final RankingController rankingController = Get.find();

  final HomeController homeController = Get.find();
  late ArgumentsMatchDetailModel arg;

  @override
  void initState() {
    arg = Get.arguments;
    FirebaseAnalyticsUtils.sendCurrentScreen(FirebaseAnalyticsUtils.previewScreen);

    super.initState();
  }

  final List<String> topStats = [
    'Expected goals (xG)',
    'Total shots',
    'Shots on target',
  ];

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 2));
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          right: SizeUtils.horizontalBlockSize * 1.5,
          left: SizeUtils.horizontalBlockSize * 1.5,
          top: SizeUtils.verticalBlockSize * 0.8,
        ),
        child: Obx(
          () => homeController.isFactsLoading.value
              ? const Loading(
                  colors: AppColors.primaryColor,
                )
              : (homeController.matchDetailsModel?.value.root?.gd2?.isEmpty ?? true)
                  ? const Center(
                      child: AppText(
                        text: StringsUtils.notAvailable,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeUtils.horizontalBlockSize * 3.5,
                                vertical: SizeUtils.verticalBlockSize * 1.8,
                              ),
                              child: Container(
                                constraints: const BoxConstraints(maxHeight: double.maxFinite),
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: homeController.gdeName.length,
                                    separatorBuilder: (context, index) {
                                      return separatorBox(index);
                                    },
                                    itemBuilder: (context, index) {
                                      final e = homeController.gdeName[index];
                                      PlayerStats? playerStats = homeController
                                          .matchDetailsModel?.value.root?.detailedstats?.playerStats
                                          ?.firstWhere((element) => element.playerId.toString() == e.playerId,
                                              orElse: () => PlayerStats());
                                      bool isHomeTeam = playerStats?.playsOnHomeTeam ?? false;
                                      Shots? shots = homeController.matchDetailsModel?.value.root?.shotmap?.shots
                                          ?.firstWhere((element) => element.playerId.toString() == e.playerId,
                                              orElse: () => Shots());
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: SizeUtils.horizontalBlockSize * 2.4,
                                        ),
                                        child: Column(
                                          children: [
                                            htBox(index),
                                            box(
                                              playerComment1: (e.split3 ?? ""),
                                              minutes: "${e.minutesPlayer}",
                                              playerComment: "${e.commentsPlayer}",
                                              subPlayerComment: e.split8 ?? "",
                                              player: (e.minutesPlayer == e.minutesPlayer) ? true : false,
                                              teamId: isHomeTeam ? true : false,
                                              teamImage1: e.split8 == "offside"
                                                  ? AssetsPath.whiteBackground
                                                  : imageTeamOneType(e.imageHashtags.toString()),
                                              teamImage2: e.split8 == "offside"
                                                  ? AssetsPath.whiteBackground
                                                  : imageTeamOneType(e.imageHashtags.toString()),
                                            ),
                                            ftBox(index),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              // .toList() ??
                              // [],
                            ),
                          ),
                          Card(
                            elevation: 5,
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
                                  // Center(
                                  //   child: AppText(
                                  //     text: 'Top stats',
                                  //     color: AppColors.black,
                                  //     fontSize: SizeUtils.fSize_14(),
                                  //     letterSpacing: 0.5,
                                  //     fontWeight: FontWeight.w600,
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: SizeUtils.horizontalBlockSize * 3,
                                    ),
                                    child: Center(
                                      child: AppText(
                                        text: 'Average possession',
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
                                        flex: homeController.matchDetailsModel?.value.root?.detailedstats?.homeTeamStats
                                                ?.possession ??
                                            0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(SizeUtils.horizontalBlockSize * 2),
                                              bottomLeft: Radius.circular(SizeUtils.horizontalBlockSize * 2),
                                            ),
                                            color: AppColors.primaryColor,
                                          ),
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 10),
                                              Padding(
                                                padding:
                                                    EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 2.5),
                                                child: AppText(
                                                  text:
                                                      '${homeController.matchDetailsModel?.value.root?.detailedstats?.homeTeamStats?.possession.toString() ?? '0'} %',
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
                                        flex: homeController.matchDetailsModel?.value.root?.detailedstats?.awayTeamStats
                                                ?.possession ??
                                            0,
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
                                                padding:
                                                    EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 2.5),
                                                child: AppText(
                                                  text:
                                                      '${homeController.matchDetailsModel?.value.root?.detailedstats?.awayTeamStats?.possession.toString() ?? '0'} %',
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
                                                  borderRadius:
                                                      BorderRadius.circular(SizeUtils.horizontalBlockSize * 2),
                                                  color: AppColors.primaryColor.withOpacity(0.1)),
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
                                                  borderRadius:
                                                      BorderRadius.circular(SizeUtils.horizontalBlockSize * 2),
                                                  color: Colors.black.withOpacity(0.1)),
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
                          SizedBox(height: SizeUtils.horizontalBlockSize * 1.3),
                          arg.teamNameOne != ''
                              ? Container(
                                  constraints: const BoxConstraints(maxHeight: double.maxFinite),
                                  child: Obx(() {
                                    return rankingController.isLoading.value
                                        ? const Center(
                                            child: Loading(),
                                          )
                                        : fullView() ?? const SizedBox();
                                  }),
                                )
                              : const Center(
                                  child: AppText(text: 'No Data Found', fontSize: 14),
                                ),
                          topRatedView(),
                          isBannerLoaded.value == true
                              ? const SizedBox(
                                  height: 63,
                                  width: double.infinity,
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
        ),
      ),
    );
  }

  separatorBox(int index) {
    if (int.parse(homeController.gdeName[index].minutesPlayer ?? '0') < 45 &&
        int.parse(homeController.gdeName[index + 1].minutesPlayer ?? '0') >= 45) {
      return Column(
        children: [
          AppText(
            text: '+${homeController.matchDetailsModel?.value.root?.at?[0].minute90} minutes added' ?? '',
            fontSize: SizeUtils.fSize_11(),
          ),
          SizedBox(height: SizeUtils.horizontalBlockSize * 2),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 2,
                  width: double.infinity,
                  child: Divider(thickness: 1),
                ),
              ),
              SizedBox(
                width: SizeUtils.horizontalBlockSize * 2,
              ),
              Container(
                width: SizeUtils.horizontalBlockSize * 6,
                height: SizeUtils.horizontalBlockSize * 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: AppColors.black),
                  color: AppColors.white,
                ),
                child: Center(
                  child: Transform(
                    transform: Matrix4.translationValues(0.5, 1, 0),
                    child: const AppText(text: "HT"),
                  ),
                ),
              ),
              SizedBox(
                width: SizeUtils.horizontalBlockSize * 2,
              ),
              Expanded(
                child: Container(
                  height: 2,
                  width: double.infinity,
                  child: Divider(thickness: 1),
                ),
              ),
            ],
          ),
        ],
      );
    }
    //
    // else if (int.parse(homeController.gdeName[index].minutesPlayer ?? '0') < 90 &&
    //     int.parse(homeController.gdeName[index + 1].minutesPlayer ?? '0') >= 90) {
    //   return Column(
    //     children: [
    //       AppText(
    //         text: '+${homeController.matchDetailsModel?.value.root?.at?[1].minute90} minutes added' ?? '',
    //         fontSize: SizeUtils.fSize_11(),
    //       ),
    //     ],
    //   );
    // }

    else {
      return SizedBox();
    }
  }

  Widget htBox(int index) {
    if ((index == 0 &&
        ((int.parse(homeController.gdeName[index].minutesPlayer ?? '0') <= 50) &&
            (int.parse(homeController.gdeName[index].minutesPlayer ?? '0') >= 45)))) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: SizeUtils.horizontalBlockSize * 2,
        ),
        child: Column(
          children: [
            AppText(
              text: '+${homeController.matchDetailsModel?.value.root?.at?[0].minute90} minutes added' ?? '',
              fontSize: SizeUtils.fSize_11(),
            ),
            SizedBox(height: SizeUtils.horizontalBlockSize * 2),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 2,
                    width: double.infinity,
                    child: Divider(thickness: 1),
                  ),
                ),
                SizedBox(
                  width: SizeUtils.horizontalBlockSize * 2,
                ),
                Container(
                  width: SizeUtils.horizontalBlockSize * 6,
                  height: SizeUtils.horizontalBlockSize * 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: AppColors.black),
                    color: AppColors.white,
                  ),
                  child: Center(
                    child: Transform(
                      transform: Matrix4.translationValues(0.5, 1, 0),
                      child: AppText(text: "HT"),
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeUtils.horizontalBlockSize * 2,
                ),
                Expanded(
                  child: Container(
                    height: 2,
                    width: double.infinity,
                    child: Divider(thickness: 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget ftBox(int index) {
    if ((index == homeController.gdeName.length - 1 &&
        ((int.parse(homeController.gdeName[index].minutesPlayer ?? '0') <= 90) &&
            (int.parse(homeController.gdeName[index].minutesPlayer ?? '0') >= 45)))) {
      return Padding(
        padding: EdgeInsets.only(
          top: SizeUtils.horizontalBlockSize * 2,
        ),
        child: Column(
          children: [
            // index == homeController.gdeName.length - 1 &&
            //         int.parse(homeController.gdeName[index].minutesPlayer ?? '0') == 90
            //     ? SizedBox()
            //     :
            AppText(
              text: '+${homeController.matchDetailsModel?.value.root?.at?[1].minute90} minutes added' ?? '',
              fontSize: SizeUtils.fSize_11(),
            ),
            SizedBox(height: SizeUtils.horizontalBlockSize * 2),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 2,
                    width: double.infinity,
                    child: Divider(thickness: 1),
                  ),
                ),
                SizedBox(
                  width: SizeUtils.horizontalBlockSize * 2,
                ),
                Container(
                  width: SizeUtils.horizontalBlockSize * 6,
                  height: SizeUtils.horizontalBlockSize * 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: AppColors.black),
                    color: AppColors.white,
                  ),
                  child: Center(
                    child: Transform(
                      transform: Matrix4.translationValues(0.5, 1, 0),
                      child: AppText(text: "FT"),
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeUtils.horizontalBlockSize * 2,
                ),
                Expanded(
                  child: Container(
                    height: 2,
                    width: double.infinity,
                    child: Divider(thickness: 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget topRatedView() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          SizeUtils.horizontalBlockSize * 2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: SizeUtils.horizontalBlockSize * 3.5,
          bottom: SizeUtils.horizontalBlockSize * 3.5,
          left: SizeUtils.horizontalBlockSize * 4,
          right: SizeUtils.horizontalBlockSize * 4,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Top rated",
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                fontSize: SizeUtils.fSize_12(),
              ),
            ),
            SizedBox(
              height: SizeUtils.horizontalBlockSize * 4,
            ),
            TopPlayerList(
              lColor: colorTeamOneType(homeController.homeTeamRow[0]?.playerRating?.toInt()),
              rColor: colorTeamOneType(homeController.awayTeamRow[0]?.playerRating?.toInt()),
              lLetter: homeController.homeTeamRow[0]?.playerName ?? "",
              lName: homeController.homeTeamRow[0]?.playerName ?? "",
              lRating: double.parse(homeController.homeTeamRow[0]?.playerRating.toString() ?? "").toStringAsFixed(1),
              lImage: arg.teamImageOne.toString(),
              rLetter: homeController.awayTeamRow[0]?.playerName ?? "",
              rName: homeController.awayTeamRow[0]?.playerName ?? "",
              rImage: arg.teamImageTwo.toString(),
              rRating: double.parse(homeController.awayTeamRow[0]?.playerRating.toString() ?? "").toStringAsFixed(1),
            ),
            SizedBox(
              height: SizeUtils.horizontalBlockSize * 2,
            ),
            TopPlayerList(
              lColor: colorTeamOneType(homeController.homeTeamRow[1]?.playerRating?.toInt()),
              rColor: colorTeamOneType(homeController.awayTeamRow[1]?.playerRating?.toInt()),
              lLetter: homeController.homeTeamRow[1]?.playerName ?? "",
              lName: homeController.homeTeamRow[1]?.playerName ?? "",
              lRating: double.parse(homeController.homeTeamRow[1]?.playerRating.toString() ?? "").toStringAsFixed(1),
              lImage: arg.teamImageOne.toString(),
              rLetter: homeController.awayTeamRow[1]?.playerName ?? "",
              rName: homeController.awayTeamRow[1]?.playerName ?? "",
              rImage: arg.teamImageTwo.toString(),
              rRating: double.parse(homeController.awayTeamRow[1]?.playerRating.toString() ?? "").toStringAsFixed(1),
            ),
            SizedBox(
              height: SizeUtils.horizontalBlockSize * 2,
            ),
            TopPlayerList(
              // color: AppColors.green,
              lColor: colorTeamOneType(homeController.homeTeamRow[2]?.playerRating?.toInt()),
              rColor: colorTeamOneType(homeController.awayTeamRow[2]?.playerRating?.toInt()),
              lLetter: homeController.homeTeamRow[2]?.playerName ?? "",
              lName: homeController.homeTeamRow[2]?.playerName ?? "",
              lRating: double.parse(homeController.homeTeamRow[2]?.playerRating.toString() ?? "").toStringAsFixed(1),
              lImage: arg.teamImageOne.toString(),
              rLetter: homeController.awayTeamRow[2]?.playerName ?? "",
              rName: homeController.awayTeamRow[2]?.playerName ?? "",
              rImage: arg.teamImageTwo.toString(),
              rRating: double.parse(homeController.awayTeamRow[2]?.playerRating.toString() ?? "").toStringAsFixed(1),
            ),
          ],
        ),
      ),
    );
  }

  colorTeamOneType(int? type) {
    switch (type) {
      case 7:
        return Colors.green.withOpacity(0.7);
      case 8:
        return Colors.green.withOpacity(0.7);
      case 9:
        return Colors.blue.withOpacity(0.7);
      default:
        return Colors.orange.withOpacity(0.7);
    }
  }

  topStatsHomeTeamData(index) {
    HomeTeamStats? stats = homeController.matchDetailsModel?.value.root?.detailedstats?.homeTeamStats;
    if (index == 0) {
      return stats?.expectedGoals ?? 0;
    } else if (index == 1) {
      return int.parse((stats?.shotsInsideBox ?? '0').toString()) +
          int.parse((stats?.shotsOutsideBox ?? '0').toString());
    } else if (index == 2) {
      return stats?.shotsOnTarget ?? 0;
    }
  }

  topAwayTeamTeamData(index) {
    AwayTeamStats? stats = homeController.matchDetailsModel?.value.root?.detailedstats?.awayTeamStats;
    if (index == 0) {
      return stats?.expectedGoals ?? 0;
    } else if (index == 1) {
      return int.parse((stats?.shotsInsideBox ?? '0').toString()) + int.parse((stats?.shotsOutsideBox ?? 0).toString());
    } else if (index == 2) {
      return stats?.shotsOnTarget ?? 0;
    }
  }

  imageTeamOneType(String? type) {
    switch (type) {
      case "5":
        return AssetsPath.yellowCard;
        break;
      case "6":
        return AssetsPath.yellowCard;
        break;
      case '2':
        return AssetsPath.blackCircle;
        break;
      case "1":
        return AssetsPath.blackCircle;
        break;
      default:
        return AssetsPath.blackCircle;
    }
  }

  Widget box({
    String? minutes,
    String? playerComment,
    String? playerComment1,
    String? subPlayerComment,
    String? teamImage1,
    String? teamImage2,
    bool player = false,
    bool teamId = false,
  }) {
    if (teamId) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: SizeUtils.horizontalBlockSize * 6.2,
            child: AppText(
              text: "$minutes",
              color: AppColors.black,
              fontSize: SizeUtils.fSize_13(),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: SizeUtils.horizontalBlockSize * 1,
          ),
          teamImage1 == AssetsPath.varImage
              ? Image.asset(
                  "$teamImage1",
                  width: SizeUtils.horizontalBlockSize * 7,
                )
              : ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: AppColors.white,
                    child: Image.asset(
                      "$teamImage1",
                      width: SizeUtils.horizontalBlockSize * 6,
                    ),
                  ),
                ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              subPlayerComment != " "
                  ? player
                      ? Row(
                          children: [
                            SizedBox(
                              width: SizeUtils.horizontalBlockSize * 2,
                            ),
                            AppText(
                              text: parse(subPlayerComment != " " ? "$subPlayerComment" : "$subPlayerComment")
                                  .documentElement!
                                  .text,
                              // text: subPlayerComment != " " ? "$subPlayerComment" : "$subPlayerComment",
                              color: AppColors.black,
                              fontSize: SizeUtils.fSize_12(),
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        )
                      : const SizedBox()
                  : const SizedBox(),
              Row(
                children: [
                  SizedBox(
                    width: SizeUtils.horizontalBlockSize * 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: parse(playerComment).documentElement!.text,
                        color: AppColors.black,
                        fontSize: SizeUtils.fSize_12(),
                        fontWeight: FontWeight.w400,
                      ),
                      if (playerComment?.trim() != playerComment1?.trim())
                        AppText(
                          text: parse(playerComment1).documentElement!.text,
                          color: AppColors.grey,
                          fontSize: SizeUtils.fSize_12(),
                          fontWeight: FontWeight.w400,
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              subPlayerComment != " "
                  ? player
                      ? Row(
                          children: [
                            AppText(
                              text: parse(subPlayerComment != " " ? "$subPlayerComment" : "$subPlayerComment")
                                  .documentElement!
                                  .text,
                              // text: subPlayerComment != " " ? "Goal ruled out - $subPlayerComment" : "$subPlayerComment",
                              color: AppColors.black,
                              fontSize: SizeUtils.fSize_12(),
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              width: SizeUtils.horizontalBlockSize * 2,
                            ),
                          ],
                        )
                      : const SizedBox()
                  : const SizedBox(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: parse(playerComment).documentElement!.text,
                        color: AppColors.black,
                        fontSize: SizeUtils.fSize_12(),
                        fontWeight: FontWeight.w400,
                      ),
                      if (playerComment?.trim() != playerComment1?.trim())
                        AppText(
                          text: parse(playerComment1).documentElement!.text,
                          color: AppColors.grey,
                          fontSize: SizeUtils.fSize_12(),
                          fontWeight: FontWeight.w400,
                        ),
                    ],
                  ),
                  SizedBox(
                    width: SizeUtils.horizontalBlockSize * 2,
                  ),
                ],
              ),
            ],
          ),
          teamImage2 == AssetsPath.varImage
              ? Image.asset(
                  "$teamImage2",
                  width: SizeUtils.horizontalBlockSize * 6,
                )
              : ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: AppColors.white,
                    child: Image.asset(
                      "$teamImage2",
                    ),
                  ),
                ),
          SizedBox(
            width: SizeUtils.horizontalBlockSize * 2,
          ),
          SizedBox(
            width: SizeUtils.horizontalBlockSize * 6.2,
            child: AppText(
              text: "$minutes",
              color: AppColors.black,
              textAlign: TextAlign.end,
              fontSize: SizeUtils.fSize_13(),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }
  }

  Widget? fullView({
    int? teamIndex,
    String? groupNo,
    String? imageUrl,
    String? countryName,
    String? plPoints,
    String? wPoints,
    String? dPoint,
    String? lPoint,
    String? plusPoint,
    String? gdPoint,
    String? ptsPoint,
  }) {
    return Container(
      constraints: const BoxConstraints(maxHeight: double.maxFinite),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 1),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        primary: true,
        itemCount: rankingController.rankingTableModel.value.root?.table?.subt?.length ?? 0,
        itemBuilder: (context, teamIndex) {
          Subt? subt = rankingController.rankingTableModel.value.root?.table?.subt?[teamIndex];
          int? index = rankingController.rankingTableModel.value.root?.table?.subt
              ?.indexWhere((element) => element.t?.map((e) => e.name).toString().contains(arg.teamNameOne!) ?? false);

          return index == teamIndex
              ? Padding(
                  padding: EdgeInsets.only(
                    bottom: SizeUtils.verticalBlockSize * 1.8,
                  ),
                  child: Card(
                    elevation: 3,
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 2),
                    ),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 2),
                    //     color: AppColors.white,
                    //     boxShadow: [
                    //       BoxShadow(color: AppColors.black.withOpacity(0.4), blurRadius: 2),
                    //     ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: SizeUtils.horizontalBlockSize * 3.5,
                            left: SizeUtils.horizontalBlockSize * 4,
                          ),
                          child: Text(
                            "World Cup ${subt?.name.toString() ?? ''}",
                            style: const TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: SizeUtils.verticalBlockSize * 2.3,
                            left: SizeUtils.horizontalBlockSize * 4,
                          ),
                          child: Row(
                            children: [
                              const Expanded(
                                  flex: 8,
                                  child: Text(
                                    "Position",
                                    style:
                                        TextStyle(color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12.9),
                                  )),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Pl',
                                  // textAlign: TextAlign.center,
                                  style:
                                      TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              ),
                              SizedBox(width: SizeUtils.horizontalBlockSize * 1),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'W',
                                  // textAlign: TextAlign.center,
                                  style:
                                      TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              ),
                              SizedBox(width: SizeUtils.horizontalBlockSize * 1),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'D',
                                  // textAlign: TextAlign.center,
                                  style:
                                      TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              ),
                              SizedBox(width: SizeUtils.horizontalBlockSize * 1),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'L',
                                  // textAlign: TextAlign.center,
                                  style:
                                      TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              ),
                              // Expanded(
                              //   flex: 1,
                              //   child: Text(
                              //     '+/-',
                              //     // textAlign: TextAlign.center,
                              //     style: TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w400, fontSize: 12.9),
                              //   ),
                              // ),
                              // SizedBox(width: SizeUtils.horizontalBlockSize * 2),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'GD',
                                  // textAlign: TextAlign.center,
                                  style:
                                      TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              ),
                              SizedBox(width: SizeUtils.horizontalBlockSize * 2),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Pts',
                                  // textAlign: TextAlign.center,
                                  style:
                                      TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                width: SizeUtils.horizontalBlockSize * 2,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Divider(),
                        Column(
                          children: List.generate(
                            rankingController.rankingTableModel.value.root?.table?.subt?[teamIndex].t?.length ?? 0,
                            (index1) => Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Row(
                                children: [
                                  // index1 == 0 || index1 == 1
                                  // ? Container(
                                  //     width: 2.5,
                                  //     height: SizeUtils.verticalBlockSize * 6,
                                  //     decoration: BoxDecoration(
                                  //         borderRadius: const BorderRadius.only(
                                  //             topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
                                  //         color: AppColors.green[200]),
                                  //   )
                                  // : const SizedBox(),
                                  Expanded(
                                    child: Container(
                                      height: SizeUtils.verticalBlockSize * 6.5,
                                      // color: arg.teamNameOne ==
                                      //             rankingController.rankingTableModel.value.root?.table
                                      //                 ?.subt?[teamIndex].t?[index1].name ||
                                      //         arg.teamNameTwo ==
                                      //             rankingController.rankingTableModel.value.root?.table
                                      //                 ?.subt?[teamIndex].t?[index1].name
                                      //     ? AppColors.black.withOpacity(0.1)
                                      //     : AppColors.white,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 8,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: SizeUtils.horizontalBlockSize * 3,
                                                ),
                                                index1 == 0
                                                    ? AppText(
                                                        text: ' ${index1 + 1}',
                                                        textAlign: TextAlign.end,
                                                        color: AppColors.black,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14)
                                                    : AppText(
                                                        text: '${index1 + 1}',
                                                        textAlign: TextAlign.end,
                                                        color: AppColors.black,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14),
                                                SizedBox(
                                                  width: SizeUtils.horizontalBlockSize * 2.8,
                                                ),
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(200),
                                                  child: Image.asset(
                                                    homeController.imageTeamOneType(subt?.t?[index1].name),
                                                    fit: BoxFit.cover,
                                                    height: 20,
                                                    width: 20,
                                                    // scale: 40,
                                                  ),
                                                ),
                                                // SizedBox(
                                                //   height: 20,
                                                //   width: 30,
                                                //   child: Image.asset(
                                                //     homeController.imageTeamOneType(subt?.t?[index1].name),
                                                //     fit: BoxFit.fill,
                                                //     // scale: 40,
                                                //   ),
                                                // ),
                                                SizedBox(
                                                  width: SizeUtils.horizontalBlockSize * 2.8,
                                                ),
                                                Text(
                                                  subt?.t?[index1].name ?? '',
                                                  // textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      color: AppColors.black,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              '${(int.parse(subt?.t?[index1].w ?? '0')) + (int.parse(subt?.t?[index1].d ?? '0')) + (int.parse(subt?.t?[index1].l ?? '0'))}',
                                              // textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 13),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              subt?.t?[index1].w ?? '',
                                              // textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 13),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              subt?.t?[index1].d ?? '',
                                              // textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 13),
                                            ),
                                          ),

                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              subt?.t?[index1].l ?? '',
                                              // textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 13),
                                            ),
                                          ),
                                          // SizedBox(width: SizeUtils.horizontalBlockSize * 1.5),
                                          // Expanded(
                                          //   flex: 1,
                                          //   child: Text(
                                          //     '${subt?.t?[index1].g}-${subt?.t?[index1].hc}',
                                          //     // textAlign: TextAlign.center,
                                          //     style: const TextStyle(
                                          //         color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 13),
                                          //   ),
                                          // ),

                                          // SizedBox(width: SizeUtils.horizontalBlockSize * 2),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              (int.parse(subt?.t?[index1].g ?? '0')) -
                                                          (int.parse(subt?.t?[index1].hc ?? '0')) >
                                                      0
                                                  ? ' +${(int.parse(subt?.t?[index1].g ?? '0')) - (int.parse(subt?.t?[index1].hc ?? '0'))}'
                                                  : (int.parse(subt?.t?[index1].g ?? '0')) -
                                                              (int.parse(subt?.t?[index1].hc ?? '0')) ==
                                                          0
                                                      ? '   0'
                                                      : ' ${(int.parse(subt?.t?[index1].g ?? '0')) - (int.parse(subt?.t?[index1].hc ?? '0'))}',
                                              // textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 13),
                                            ),
                                          ),
                                          SizedBox(
                                            width: SizeUtils.horizontalBlockSize * 3,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              subt?.t?[index1].p ?? '',
                                              // textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 13),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
