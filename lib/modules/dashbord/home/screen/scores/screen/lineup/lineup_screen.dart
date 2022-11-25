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

  @override
  void initState() {
    homeTeamRow.clear();
    awayTeamRow.clear();
    print("hiyy=====>${homeController.matchDetailsModel?.value.root?.externalLineup?.length}");
    if (homeController.matchDetailsModel?.value.root?.externalLineup != null) {
      homeTeamRow.addAll(homeController.matchDetailsModel?.value.root?.externalLineup?.where(
            (element) {
              return element.id == widget.arg?.team1Id;
            },
          ).toList() ??
          []);

      List<ExternalLineUpModel?> filterHomeTeamRow = [];
      homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?.forEach((element) {
        for (var homeTeamRowElement in homeTeamRow) {
          // print("************${homeTeamRowElement?.matchId}  ${element.playerId}");
          if (homeTeamRowElement?.matchId.toString() == element.playerId.toString() &&
              element.playsOnHomeTeam == true) {
            filterHomeTeamRow.add(homeTeamRowElement);
          }
        }
      });
      print("idd===>${filterHomeTeamRow.length}");
      homeTeamRow = filterHomeTeamRow;
      // homeTeamRow = homeTeamRow.getRange(0, 12).toList();

      awayTeamRow.addAll(homeController.matchDetailsModel?.value.root?.externalLineup
              ?.where((element) => element.id == widget.arg?.team2Id)
              .toList() ??
          []);
      List<ExternalLineUpModel?> filterAwayTeamRow = [];
      homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?.forEach((element) {
        for (var homeTeamRowElement in awayTeamRow) {
          if (homeTeamRowElement?.matchId.toString() == element.playerId.toString() &&
              element.playsOnHomeTeam == false) {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: homeTeamRow.isEmpty || awayTeamRow.isEmpty ? AppColors.white : AppColors.lineupGreen,
        body: RefreshIndicator(
          color: Colors.black,
          backgroundColor: Colors.white,
          onRefresh: () async {
            await homeController.matchDetailsApiCall(matchID: widget.arg?.team1Id);
          },
          child: SingleChildScrollView(
            child: homeTeamRow.isEmpty || awayTeamRow.isEmpty
                ? Container(
                    height: SizeUtils.screenHeight / 1.5,
                    child: const Center(
                      child: AppText(
                        text: StringsUtils.notAvailable,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Container(
                        height: SizeUtils.verticalBlockSize * 8,
                        color: AppColors.lineupTopGreen,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeUtils.verticalBlockSize * 3,
                            right: SizeUtils.verticalBlockSize * 3,
                          ),
                          child: Row(
                            children: [
                              // Container(
                              //   height: SizeUtils.verticalBlockSize * 2.5,
                              //   width: SizeUtils.horizontalBlockSize * 9,
                              //   decoration: BoxDecoration(
                              //       color: AppColors.orange,
                              //       borderRadius: BorderRadius.circular(
                              //           SizeUtils.verticalBlockSize * 2)),
                              //   child: Center(
                              //     child: AppText(
                              //       text: '6.6',
                              //       fontSize: SizeUtils.fSize_12(),
                              //       color: AppColors.white,
                              //       fontWeight: FontWeight.w500,
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   width: SizeUtils.horizontalBlockSize * 4,
                              // ),
                              AppText(
                                text: widget.arg?.teamNameOne ?? '',
                                fontSize: SizeUtils.fSize_14(),
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              // SizedBox(
                              //   width: SizeUtils.horizontalBlockSize * 3,
                              // ),
                              // AppText(
                              //   text: '4-2-3-1',
                              //   fontSize: SizeUtils.fSize_14(),
                              //   color: AppColors.textGreen,
                              //   fontWeight: FontWeight.w500,
                              // ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: SizeUtils.horizontalBlockSize * 38,
                        ),
                        child: _horizontalList(1, homeTeamRow),
                      ),
                      _horizontalList2(3, homeTeamRow),
                      _horizontalList3(3, 4, homeTeamRow),
                      _horizontalList4(3 + 4 + 1, 3, homeTeamRow),
                      Divider(
                        color: AppColors.dividerColor,
                        height: SizeUtils.horizontalBlockSize * 15,
                        thickness: 4,
                      ),
                      _horizontalList4(3 + 4 + 1, 3, awayTeamRow),
                      _horizontalList3(3, 4, awayTeamRow),
                      _horizontalList2(3, awayTeamRow),
                      Padding(
                        padding: EdgeInsets.only(
                          left: SizeUtils.horizontalBlockSize * 38,
                        ),
                        child: _horizontalList(1, awayTeamRow),
                      ),
                      Container(
                        height: SizeUtils.verticalBlockSize * 8,
                        color: AppColors.lineupTopGreen,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: SizeUtils.verticalBlockSize * 3),
                          child: Row(
                            children: [
                              // Container(
                              //   height: SizeUtils.verticalBlockSize * 2.5,
                              //   width: SizeUtils.horizontalBlockSize * 9,
                              //   decoration: BoxDecoration(
                              //       color: AppColors.orange,
                              //       borderRadius: BorderRadius.circular(
                              //           SizeUtils.verticalBlockSize * 2)),
                              //   child: Center(
                              //     child: AppText(
                              //       text: '6.6',
                              //       fontSize: SizeUtils.fSize_12(),
                              //       color: AppColors.white,
                              //       fontWeight: FontWeight.w500,
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   width: SizeUtils.horizontalBlockSize * 4,
                              // ),
                              AppText(
                                text: widget.arg?.teamNameTwo ?? '',
                                fontSize: SizeUtils.fSize_14(),
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              // SizedBox(
                              //   width: SizeUtils.horizontalBlockSize * 3,
                              // ),
                              // AppText(
                              //   text: '4-2-3-1',
                              //   fontSize: SizeUtils.fSize_14(),
                              //   color: AppColors.textGreen,
                              //   fontWeight: FontWeight.w500,
                              // ),
                            ],
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

  Widget box({String? image, Color? color, String? name, Color? numberColor, String? point, double? rating}) {
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
              transform: Matrix4.translationValues(32, -4, 0),
              child: Container(
                height: SizeUtils.horizontalBlockSize * 4.5,
                width: SizeUtils.horizontalBlockSize * 8.5,
                decoration: BoxDecoration(
                    color: AppColors.orange, borderRadius: BorderRadius.circular(SizeUtils.verticalBlockSize * 2)),
                child: Center(
                  child: AppText(
                    text: "$rating",
                    fontSize: SizeUtils.fSize_10(),
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
            AppText(
              text: "$point",
              maxLines: 1,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
              // overflow: TextOverflow.ellipsis,
              fontSize: SizeUtils.fSize_13(),
              // color: AppColors.black,
            ),
            SizedBox(
              width: SizeUtils.horizontalBlockSize * 1,
            ),
            AppText(
              text: "$name",
              maxLines: 1,
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              // overflow: TextOverflow.ellipsis,
              fontSize: SizeUtils.fSize_11(),
              // color: AppColors.black,
            ),
          ],
        )
      ],
    );
  }

  Widget homeBox({
    String? image1,
    String? image2,
    String? image3,
    String? image4,
    String? image5,
    String? image6,
    String? image7,
    String? image8,
    String? image9,
    String? image10,
    String? image11,
    String? point1,
    String? point2,
    String? point3,
    String? point4,
    String? point5,
    String? point6,
    String? point7,
    String? point8,
    String? point9,
    String? point10,
    String? point11,
    double? rating1,
    double? rating2,
    double? rating3,
    double? rating4,
    double? rating5,
    double? rating6,
    double? rating7,
    double? rating8,
    double? rating9,
    double? rating10,
    double? rating11,
    String? playerone,
    String? playertwo,
    String? playerthree,
    String? playerfour,
    String? playerfive,
    String? playersix,
    String? playerseven,
    String? playereight,
    String? playernight,
    String? playerten,
    String? playereleven,
  }) {
    return Column(
      children: [
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 5,
        ),
        SizedBox(
          width: SizeUtils.horizontalBlockSize * 15,
          child: box(image: image1, name: playerone, point: point1, rating: rating1),
        ),
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 4.5,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.horizontalBlockSize * 9,
            vertical: SizeUtils.verticalBlockSize * 4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 13,
                child: box(image: image2, name: playertwo, point: point2, rating: rating2),
              ),
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 13,
                child: box(image: image3, name: playerthree, point: point3, rating: rating3),
              ),
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 13,
                child: box(image: image4, name: playerfour, point: point4, rating: rating4),
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.horizontalBlockSize * 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 13,
                child: box(image: image5, name: playerfive, point: point5, rating: rating5),
              ),
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 13,
                child: box(image: image6, name: playersix, point: point6, rating: rating6),
              ),
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 13,
                child: box(image: image7, name: playerseven, point: point7, rating: rating7),
              ),
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 13,
                child: box(image: image8, name: playereight, point: point8, rating: rating8),
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 9,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.horizontalBlockSize * 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 13,
                child: box(image: image9, name: playernight, point: point9, rating: rating9),
              ),
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 15,
                child: box(image: image10, name: playerten, point: point10, rating: rating10),
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // width: SizeUtils.horizontalBlockSize * 15,
              child: box(image: image11, name: playereleven, point: point11, rating: rating11),
            ),
          ],
        ),
      ],
    );
  }

  Widget awayBox({
    String? image1,
    String? image2,
    String? image3,
    String? image4,
    String? image5,
    String? image6,
    String? image7,
    String? image8,
    String? image9,
    String? image10,
    String? image11,
    String? point1,
    String? point2,
    String? point3,
    String? point4,
    String? point5,
    String? point6,
    String? point7,
    String? point8,
    String? point9,
    String? point10,
    String? point11,
    double? rating1,
    double? rating2,
    double? rating3,
    double? rating4,
    double? rating5,
    double? rating6,
    double? rating7,
    double? rating8,
    double? rating9,
    double? rating10,
    double? rating11,
    String? playerone,
    String? playertwo,
    String? playerthree,
    String? playerfour,
    String? playerfive,
    String? playersix,
    String? playerseven,
    String? playereight,
    String? playernight,
    String? playerten,
    String? playereleven,
  }) {
    return Column(
      children: [
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.horizontalBlockSize * 9,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 13,
                child: box(image: image1, name: playerone, point: point1, rating: rating1),
              ),
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 13,
                child: box(image: image2, name: playertwo, point: point2, rating: rating2),
              ),
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 13,
                child: box(image: image3, name: playerthree, point: point3, rating: rating3),
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 8,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.horizontalBlockSize * 6,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 13,
                child: box(image: image4, name: playerfour, point: point4, rating: rating4),
              ),
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 13,
                child: box(image: image5, name: playerfive, point: point5, rating: rating5),
              ),
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 13,
                child: box(image: image6, name: playersix, point: point6, rating: rating6),
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 9,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.horizontalBlockSize * 3,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 13,
                child: box(image: image7, name: playerseven, point: point7, rating: rating7),
              ),
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 13,
                child: box(image: image8, name: playereight, point: point8, rating: rating8),
              ),
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 13,
                child: box(image: image9, name: playernight, point: point9, rating: rating9),
              ),
              SizedBox(
                // width: SizeUtils.horizontalBlockSize * 15,
                child: box(image: image10, name: playerten, point: point10, rating: rating10),
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            box(image: image11, name: playereleven, point: point11, rating: rating11),
          ],
        ),
      ],
    );
  }

  Widget _horizontalList(int n, List<ExternalLineUpModel?> homeTeamRow) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeUtils.verticalBlockSize * 2,
        horizontal: SizeUtils.verticalBlockSize * 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(n, (i) {
          return box(
            image: homeTeamRow[i]?.name?.split(' ').last.substring(0, 1),
            point: homeTeamRow[i]?.point,
            rating: homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?[i].playerRating,
            name: homeTeamRow[i]?.name?.split(' ').last,
          );
        }),
      ),
    );
  }

  Widget _horizontalList2(int n, List<ExternalLineUpModel?> homeTeamRow) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeUtils.verticalBlockSize * 2,
        horizontal: SizeUtils.verticalBlockSize * 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(n, (i) {
          return box(
            image: homeTeamRow[i + 1]?.name?.split(' ').last.substring(0, 1),
            point: homeTeamRow[i + 1]?.point,
            rating: homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?.firstWhere((element) {
              return element.playerId.toString() == homeTeamRow[i + 1]?.matchId;
            }, orElse: () => PlayerStats()).playerRating,
            name: homeTeamRow[i + 1]?.name?.split(' ').last,
          );
        }),
      ),
    );
  }

  Widget _horizontalList3(int beforN, int totalShowN, List<ExternalLineUpModel?> homeTeamRow) {
    // int thirdLine = preLength - 1;
    // int a = thirdLine - 1;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeUtils.verticalBlockSize * 2,
        horizontal: SizeUtils.verticalBlockSize * 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(totalShowN, (i) {
          return box(
            image: homeTeamRow[(beforN + 1) + i]?.name?.split(' ').last.substring(0, 1),
            point: homeTeamRow[(beforN + 1) + i]?.point,
            rating: homeController
                .matchDetailsModel?.value.root?.detailedstats?.playerStats?[(beforN + 1) + i].playerRating,
            name: homeTeamRow[(beforN + 1) + i]?.name?.split(' ').last,
          );
        }),
      ),
    );
  }

  Widget _horizontalList4(int totalAllAboveLenght, int totalShowN, List<ExternalLineUpModel?> homeTeamRow) {
    // int thirdLine = preLength - 1;
    // int a = thirdLine - 1;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeUtils.verticalBlockSize * 2,
        horizontal: SizeUtils.verticalBlockSize * 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(totalShowN, (i) {
          return box(
            image: homeTeamRow[(totalAllAboveLenght + 1) + i]?.name?.split(' ').last.substring(0, 1),
            point: homeTeamRow[(totalAllAboveLenght + 1) + i]?.point,
            rating: homeController
                .matchDetailsModel?.value.root?.detailedstats?.playerStats?[(totalAllAboveLenght + 1) + i].playerRating,
            name: homeTeamRow[(totalAllAboveLenght + 1) + i]?.name?.split(' ').last,
          );
        }),
      ),
    );
  }
}
