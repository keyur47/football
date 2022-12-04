import 'dart:ui';

import 'package:football/ads/banner_ad.dart';
import 'package:football/model/arguments_match_detail_model.dart';
import 'package:football/modules/dashbord/home/controller/home_controller.dart';
import 'package:football/modules/dashbord/home/model/detailes_stats_model.dart';
import 'package:football/modules/dashbord/home/model/external_lineup_model.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/utils/strings_utils.dart';
import 'package:football/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LineUpScreen extends StatefulWidget {
  ArgumentsMatchDetailModel? arg;

  LineUpScreen({Key? key, this.arg}) : super(key: key);

  @override
  State<LineUpScreen> createState() => _LineUpScreenState();
}

class _LineUpScreenState extends State<LineUpScreen> {
  final HomeController homeController = Get.find();
  List<ExternalLineUpModel?> homeTeamRow = [];
  List<ExternalLineUpModel?> awayTeamRow = [];
  late ArgumentsMatchDetailModel arg;

  @override
  void initState() {
    // arg = Get.arguments;
    //
    // api();
    homeTeamRow.clear();
    awayTeamRow.clear();
    List<ExternalLineUpModel?> homeTeamRowData = [];
    List<ExternalLineUpModel?> awayTeamRowData = [];

    if (homeController.matchDetailsModel?.value.root?.externalLineup != null) {
      homeTeamRowData.addAll(homeController.matchDetailsModel?.value.root?.externalLineup?.where(
            (element) {
              return element.id == widget.arg?.team1Id;
            },
          ).toList() ??
          []);

      List<ExternalLineUpModel?> filterHomeTeamRow = [];
      homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?.forEach((element) {
        for (var homeTeamRowElement in homeTeamRowData) {
          if (homeTeamRowElement?.matchId.toString() == element.playerId.toString() &&
              element.playsOnHomeTeam == true &&
              element.gameStarted == true) {
            filterHomeTeamRow.add(homeTeamRowElement);
          }
        }
      });

      homeTeamRow = filterHomeTeamRow;
      // homeTeamRow = homeTeamRow.getRange(0, 12).toList();

      awayTeamRowData.addAll(homeController.matchDetailsModel?.value.root?.externalLineup
              ?.where((element) => element.id == widget.arg?.team2Id)
              .toList() ??
          []);
      List<ExternalLineUpModel?> filterAwayTeamRow = [];
      homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?.forEach((element) {
        for (var homeTeamRowElement in awayTeamRowData) {
          if (homeTeamRowElement?.matchId.toString() == element.playerId.toString() &&
              element.playsOnHomeTeam == false &&
              element.gameStarted == true) {
            filterAwayTeamRow.add(homeTeamRowElement);
          }
        }
      });
      // awayTeamRow = awayTeamRow.getRange(0, 12).toList();
      awayTeamRow = filterAwayTeamRow;
    }
    print("************${awayTeamRow.length}");
    super.initState();
  }

  // api() async {
  //   await homeController.matchDetailsApiCall(matchID: arg.matchId);
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            homeTeamRow.isEmpty || awayTeamRow.isEmpty ? AppColors.white.withOpacity(0.75) : AppColors.primaryColor,
        body: RefreshIndicator(
          color: Colors.black,
          backgroundColor: Colors.white,
          onRefresh: () async {
            await homeController.matchDetailsApiCall(matchID: widget.arg?.team1Id);
          },
          child: SingleChildScrollView(
            child: homeTeamRow.isEmpty || awayTeamRow.isEmpty
                ? SizedBox(
                    height: SizeUtils.screenHeight / 1.5,
                    child: const Center(
                      child: AppText(
                        text: StringsUtils.notAvailable,
                        fontWeight: FontWeight.w500,
                      ),
                    ))
                : Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: SizeUtils.verticalBlockSize * 8,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: ExactAssetImage(
                                  'assets/icon/football_field.png',
                                ),
                              ),
                            ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: SizeUtils.horizontalBlockSize * 3,
                                  right: SizeUtils.horizontalBlockSize * 5,
                                  top: 2,
                                  bottom: 2,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _horizontalList(1, homeTeamRow, true),
                                    _horizontalList2(3, homeTeamRow, true),
                                    _horizontalList3(3, 4, homeTeamRow, true),
                                    _horizontalList4(3 + 4, 3, homeTeamRow, true),
                                    Divider(
                                      color: AppColors.dividerColor,
                                      height: SizeUtils.horizontalBlockSize * 15,
                                      thickness: 4,
                                    ),
                                    _horizontalList4(3 + 4, 3, awayTeamRow, false),
                                    _horizontalList3(3, 4, awayTeamRow, false),
                                    _horizontalList2(3, awayTeamRow, false),
                                    _horizontalList(1, awayTeamRow, false),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeUtils.verticalBlockSize * 8,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: SizeUtils.horizontalBlockSize * 3, bottom: SizeUtils.verticalBlockSize * 2),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: AppText(
                                  text: widget.arg?.teamNameTwo ?? '',
                                  fontSize: SizeUtils.fSize_16(),
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () => isBannerLoaded.value == true
                                ? const SizedBox(
                                    height: 52,
                                    width: double.infinity,
                                  )
                                : SizedBox(),
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeUtils.verticalBlockSize * 8,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeUtils.horizontalBlockSize * 3,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: AppText(
                              text: widget.arg?.teamNameOne ?? '',
                              fontSize: SizeUtils.fSize_16(),
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  colorTeamOneType(int? type) {
    switch (type) {
      case 7:
        return Colors.green;

      case 8:
        return Colors.green;

      case 9:
        return Colors.blue;

      default:
        return Colors.orange;
    }
  }

  Widget box(
      {String? image,
      Color? color,
      String? name,
      Color? numberColor,
      String? point,
      double? rating,
      required String playerID}) {
    bool captain = homeController.matchDetailsModel?.value.root?.captain?.empty?.contains(playerID) ?? false;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: SizeUtils.horizontalBlockSize * 10,
              width: SizeUtils.horizontalBlockSize * 10,
              decoration: BoxDecoration(
                color: color ?? AppColors.white,
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(
                //   SizeUtils.horizontalBlockSize * 4,
                // ),
              ),
              child: Center(
                child: AppText(
                  text: "$image",
                  fontWeight: FontWeight.w900,
                  fontSize: SizeUtils.fSize_20(),
                  color: AppColors.fotMobColor,
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(26, -2, 0),
              child: Container(
                height: SizeUtils.horizontalBlockSize * 3.5,
                width: SizeUtils.horizontalBlockSize * 6.5,
                decoration: BoxDecoration(
                    color: colorTeamOneType(rating?.toInt()),
                    borderRadius: BorderRadius.circular(SizeUtils.verticalBlockSize * 2)),
                child: Center(
                  child: AppText(
                    text: "${rating?.toStringAsFixed(1)}",
                    fontSize: SizeUtils.fSize_8(),
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 0.7,
        ),
        Row(
          children: [
            if (captain)
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1),
                  child: AppText(
                    text: "C",
                    maxLines: 1,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    // overflow: TextOverflow.ellipsis,
                    fontSize: SizeUtils.fSize_8(),
                    // color: AppColors.black,
                  ),
                ),
              ),
            if (captain)
              SizedBox(
                width: SizeUtils.horizontalBlockSize * 1,
              ),
            AppText(
              text: "$point",
              maxLines: 1,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
              // overflow: TextOverflow.ellipsis,
              fontSize: SizeUtils.fSize_10(),
              // color: AppColors.black,
            ),
            SizedBox(
              width: SizeUtils.horizontalBlockSize * 1,
            ),
            SizedBox(
              width: SizeUtils.horizontalBlockSize * 12,
              child: AppText(
                text: "$name",
                maxLines: 1,
                color: AppColors.white,
                fontWeight: FontWeight.w500,
                // overflow: TextOverflow.ellipsis,
                fontSize: SizeUtils.fSize_10(),
                // color: AppColors.black,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _horizontalList(int n, List<ExternalLineUpModel?> homeTeamRow, bool playsOnHomeTeam) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeUtils.verticalBlockSize * 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(n, (i) {
          return box(
            image: homeTeamRow[i]?.name?.split(' ').last.substring(0, 1),
            point: homeTeamRow[i]?.point,
            rating: homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?.firstWhere((element) {
              return element.playerId.toString() == homeTeamRow[i]?.matchId &&
                  element.playsOnHomeTeam == playsOnHomeTeam &&
                  element.gameStarted == true;
            }, orElse: () => PlayerStats()).playerRating,
            name: homeTeamRow[i]?.name?.split(' ').last,
            playerID: homeTeamRow[i]?.matchId ?? '',
          );
        }),
      ),
    );
  }

  Widget _horizontalList2(int n, List<ExternalLineUpModel?> homeTeamRow, bool playsOnHomeTeam) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeUtils.verticalBlockSize * 1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(n, (i) {
          return box(
              image: homeTeamRow[i + 1]?.name?.split(' ').last.substring(0, 1),
              point: homeTeamRow[i + 1]?.point,
              rating: homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?.firstWhere((element) {
                return element.playerId.toString() == homeTeamRow[i + 1]?.matchId &&
                    element.playsOnHomeTeam == playsOnHomeTeam &&
                    element.gameStarted == true;
              }, orElse: () => PlayerStats()).playerRating,
              name: homeTeamRow[i + 1]?.name?.split(' ').last,
              playerID: homeTeamRow[i + 1]?.matchId ?? '');
        }),
      ),
    );
  }

  Widget _horizontalList3(int beforN, int totalShowN, List<ExternalLineUpModel?> homeTeamRow, bool playsOnHomeTeam) {
    // int thirdLine = preLength - 1;
    // int a = thirdLine - 1;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeUtils.verticalBlockSize * 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(totalShowN, (i) {
          return box(
              image: homeTeamRow[(beforN + 1) + i]?.name?.split(' ').last.substring(0, 1),
              point: homeTeamRow[(beforN + 1) + i]?.point,
              rating: homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?.firstWhere((element) {
                return element.playerId.toString() == homeTeamRow[(beforN + 1) + i]?.matchId &&
                    element.playsOnHomeTeam == playsOnHomeTeam &&
                    element.gameStarted == true;
              }, orElse: () => PlayerStats()).playerRating,
              name: homeTeamRow[(beforN + 1) + i]?.name?.split(' ').last,
              playerID: homeTeamRow[(beforN + 1) + i]?.matchId ?? '');
        }),
      ),
    );
  }

  Widget _horizontalList4(
      int totalAllAboveLenght, int totalShowN, List<ExternalLineUpModel?> homeTeamRow, bool playsOnHomeTeam) {
    // int thirdLine = preLength - 1;
    // int a = thirdLine - 1;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeUtils.verticalBlockSize * 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(totalShowN, (i) {
          return box(
              image: homeTeamRow[(totalAllAboveLenght + 1) + i]?.name?.split(' ').last.substring(0, 1),
              point: homeTeamRow[(totalAllAboveLenght + 1) + i]?.point,
              rating: homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?.firstWhere((element) {
                return element.playerId.toString() == homeTeamRow[(totalAllAboveLenght + 1) + i]?.matchId &&
                    element.playsOnHomeTeam == playsOnHomeTeam &&
                    element.gameStarted == true;
              }, orElse: () => PlayerStats()).playerRating,
              name: homeTeamRow[(totalAllAboveLenght + 1) + i]?.name?.split(' ').last,
              playerID: homeTeamRow[(totalAllAboveLenght + 1) + i]?.matchId ?? '');
        }),
      ),
    );
  }
}
