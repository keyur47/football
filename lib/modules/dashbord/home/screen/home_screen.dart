import 'package:football/ads/interstitial_ad.dart';
import 'package:football/helper/date_helper.dart';
import 'package:football/helper/firebase_analyticsUtils.dart';
import 'package:football/helper/loading_helper.dart';
import 'package:football/model/arguments_match_detail_model.dart';
import 'package:football/modules/dashbord/home/controller/home_controller.dart';
import 'package:football/modules/dashbord/home/model/Fixture_model.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/assets_path.dart';
import 'package:football/utils/navigation_utils/routes.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/utils/strings_utils.dart';
import 'package:football/widgets/app_text.dart';
import 'package:football/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends KFDrawerContent {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.find();

  @override
  void initState() {
    FirebaseAnalyticsUtils.sendCurrentScreen(FirebaseAnalyticsUtils.homeScreen);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.grey.withOpacity(0.1),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              snap: true,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                titlePadding: EdgeInsets.only(
                  left: SizeUtils.horizontalBlockSize * 11,
                  bottom: SizeUtils.horizontalBlockSize * 3,
                ),
                // centerTitle: true,
                title: AppText(
                  text: StringsUtils.score,
                  fontWeight: FontWeight.w500,
                  fontSize: SizeUtils.fSize_18(),
                  color: AppColors.white,
                ),
                background: Image.asset(
                  AssetsPath.scoreBackground,
                  fit: BoxFit.cover,
                  height: SizeUtils.horizontalBlockSize * 10,
                ),
              ),
              expandedHeight: 230,
              backgroundColor: AppColors.green,
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: SizeUtils.horizontalBlockSize * 5.5,
                    ),
                    onPressed: widget.onMenuPressed,
                  );
                },
              ),
              //IconButton
            ),
            Obx(
              () => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    String todayYear = DateTime.now().toString().substring(0, 4);
                    String todayMonth = DateTime.now().toString().substring(5, 7);
                    String todayDay = DateTime.now().toString().substring(8, 10);

                    String apiYear = homeController.tempModel?[index].time.toString().substring(0, 4) ?? '0000';
                    String apiMonth = homeController.tempModel?[index].time.toString().substring(4, 6) ?? '00';
                    String apiDay = homeController.tempModel?[index].time.toString().substring(6, 8) ?? '00';
                    DateTime parsedDate =
                        DateFormat("yyyy-MM-dd hh:mm").parse("$apiYear-$apiMonth-$apiDay 00:00:00.000000");
                    DateTime nowDate =
                        DateFormat("yyyy-MM-dd hh:mm").parse("$todayYear-$todayMonth-$todayDay 00:00:00.000000");
                    int diff = parsedDate.difference(nowDate).inDays;
                    return Column(
                      children: [
                        SizedBox(
                          height: SizeUtils.horizontalBlockSize * 1,
                        ),
                        homeBox(
                          date: diff == 0
                              ? 'Today'
                              : parsedDate.isAfter(DateTime.now()) && diff == 1
                                  ? 'Tomorrow'
                                  : displayDayAndDateTimes(homeController.tempModel?[index].time ?? "", "EEE, dd MMM"),
                          teamList: homeController.tempModel?[index].data,
                        ),
                      ],
                    );
                  },
                  semanticIndexOffset: homeController.todayIndex.value,
                  childCount: homeController.tempModel?.length ?? 0,
                ),
              ),
            ),
          ], //<Widget>[]
        ),
    );
  }

  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: AppColors.grey.withOpacity(0.1),
  //     appBar: CustomAppBar(
  //       automaticallyImplyLeading: false,
  //       leadingWidth: SizeUtils.horizontalBlockSize * 8,
  //       leading: Builder(
  //         builder: (context) {
  //           return IconButton(
  //             icon: Padding(
  //               padding: EdgeInsets.only(
  //                 top: SizeUtils.horizontalBlockSize * 0.4,
  //                 left: SizeUtils.horizontalBlockSize * 3,
  //               ),
  //               child: Icon(
  //                 Icons.menu,
  //                 size: SizeUtils.horizontalBlockSize * 5.5,
  //               ),
  //             ),
  //             onPressed: widget.onMenuPressed,
  //           );
  //         },
  //       ),
  //       title: AppText(
  //         text: StringsUtils.score,
  //         color: AppColors.white,
  //         fontWeight: FontWeight.w500,
  //         fontSize: SizeUtils.fSize_18(),
  //       ),
  //     ),
  //
  //     body: Column(
  //       children: [
  //         Expanded(
  //           child: Obx(
  //             () => homeController.isLoading.value
  //                 ? const Loading(
  //                     colors: AppColors.primaryColor,
  //                   )
  //                 : ScrollablePositionedList.builder(
  //                     initialScrollIndex: homeController.todayIndex.value, //you can pass the desired index here//
  //
  //                     // controller: homeController.dateScrollController,
  //                     padding: EdgeInsets.symmetric(
  //                       vertical: SizeUtils.horizontalBlockSize * 1.5,
  //                     ),
  //                     itemCount: homeController.tempModel?.length ?? 0,
  //                     // separatorBuilder: (context, index) {
  //                     //   return const SizedBox();
  //                     // },
  //                     itemBuilder: (context, index) {
  //                       String todayYear = DateTime.now().toString().substring(0, 4);
  //                       String todayMonth = DateTime.now().toString().substring(5, 7);
  //                       String todayDay = DateTime.now().toString().substring(8, 10);
  //
  //                       String apiYear = homeController.tempModel?[index].time.toString().substring(0, 4) ?? '0000';
  //                       String apiMonth = homeController.tempModel?[index].time.toString().substring(4, 6) ?? '00';
  //                       String apiDay = homeController.tempModel?[index].time.toString().substring(6, 8) ?? '00';
  //                       DateTime parsedDate =
  //                           DateFormat("yyyy-MM-dd hh:mm").parse("$apiYear-$apiMonth-$apiDay 00:00:00.000000");
  //                       DateTime nowDate =
  //                           DateFormat("yyyy-MM-dd hh:mm").parse("$todayYear-$todayMonth-$todayDay 00:00:00.000000");
  //                       int diff = parsedDate.difference(nowDate).inDays;
  //
  //                       return Padding(
  //                         padding: EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 0.3),
  //                         child: AutoScrollTag(
  //                           key: ValueKey(index),
  //                           controller: homeController.controller ?? AutoScrollController(),
  //                           index: index,
  //                           child: homeBox(
  //                             date: diff == 0
  //                                 ? 'Today'
  //                                 : parsedDate.isAfter(DateTime.now()) && diff == 1
  //                                     ? 'Tomorrow'
  //                                     : displayDayAndDateTimes(
  //                                         homeController.tempModel?[index].time ?? "", "EEE, dd MMM"),
  //                             teamList: homeController.tempModel?[index].data,
  //                           ),
  //                         ),
  //                       );
  //                     },
  //                   ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget homeBox({
    String? date,
    List<CombineTeamsModel>? teamList,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.horizontalBlockSize * 2,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeUtils.horizontalBlockSize * 2,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: SizeUtils.horizontalBlockSize * 0,
            top: SizeUtils.horizontalBlockSize * 2,
            bottom: SizeUtils.horizontalBlockSize * 2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeUtils.horizontalBlockSize * 2,
                  horizontal: SizeUtils.horizontalBlockSize * 3,
                ),
                child: AppText(
                  text: "$date",
                  fontSize: SizeUtils.fSize_15(),
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: teamList?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        homeController.teamOne.clear();
                        homeController.teamTwo.clear();
                        InterstitalAd.showInterstitialAd();
                        ArgumentsMatchDetailModel model = ArgumentsMatchDetailModel(
                            time: homeController.dateFormat(teamList?[index].time?.substring(8, 12) ?? ""),
                            teamNameOne: teamList?[index].team1?.teamName,
                            teamNameTwo: teamList?[index].team2?.teamName,
                            teamImageOne: homeController.imageTeamOneType(teamList?[index].team1?.teamName),
                            teamImageTwo: homeController.imageTeamOneType(teamList?[index].team2?.teamName),
                            scores1:
                                "${teamList?[index].score2 ?? (int.parse(teamList?[index].time?.substring(8, 12) ?? "0000") + 0430 < 2400 ? "${int.parse(teamList?[index].time?.substring(8, 10) ?? "00") + 04}"
                                    ":${int.parse(teamList?[index].time?.substring(10, 12) ?? "00") + 30}" : "00:${int.parse(teamList?[index].time?.substring(10, 12) ?? "00") + 30}")}"
                                "${(teamList?[index].score1?.isEmpty ?? true) ? "" : " - ${teamList?[index].score1}"}",
                            isCompleted: (teamList?[index].score1?.isNotEmpty ?? false) ||
                                (teamList?[index].score2?.isNotEmpty ?? false),
                            matchId: teamList?[index].matchId,
                            team1Id: teamList?[index].team1?.teamId,
                            team2Id: teamList?[index].team2?.teamId,
                            fullTime: displayDayAndDateTimes(teamList?[index].time.toString() ?? "", "yyyyMMddhhmm")
                            //'${int.parse(teamList?[index].time ?? '000000000000') + 000000000430 - 000000001200}',
                            );
                        Get.toNamed(
                          Routes.scoresScreen,
                          arguments: model,
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeUtils.horizontalBlockSize * 3,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: SizeUtils.horizontalBlockSize * 25,
                              child: AppText(
                                maxLines: 1,
                                text: "${teamList?[index].team1?.teamName}",
                                textAlign: TextAlign.end,
                                fontSize: SizeUtils.fSize_13(),
                              ),
                            ),
                            SizedBox(
                              width: SizeUtils.horizontalBlockSize * 2.3,
                            ),

                            Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  SizeUtils.horizontalBlockSize * 20,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: Image.asset(
                                  homeController.imageTeamOneType(teamList?[index].team1?.teamName),
                                  fit: BoxFit.cover,
                                  height: SizeUtils.horizontalBlockSize * 7.5,
                                  width: SizeUtils.horizontalBlockSize * 7.5,
                                  // scale: 40,
                                ),
                              ),
                            ),

                            SizedBox(
                              width: SizeUtils.horizontalBlockSize * 2.7,
                            ),
                            SizedBox(
                              width: SizeUtils.horizontalBlockSize * 12,
                              child: AppText(
                                text:
                                    "${teamList?[index].score2 ?? (int.parse(teamList?[index].time?.substring(8, 12) ?? "0000") + 0430 < 2400 ? "${int.parse(teamList?[index].time?.substring(8, 10) ?? "00") + 04}"
                                        ":${int.parse(teamList?[index].time?.substring(10, 12) ?? "00") + 30}" : "00:${int.parse(teamList?[index].time?.substring(10, 12) ?? "00") + 30}")}"
                                    "${(teamList?[index].score1?.isEmpty ?? true) ? "" : " - ${teamList?[index].score1}"}",
                                color: AppColors.black,
                                height: 1.1,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                                fontSize: SizeUtils.fSize_14(),
                              ),
                            ),
                            SizedBox(
                              width: SizeUtils.horizontalBlockSize * 2.7,
                            ),
                            // const CircleAvatar(
                            //   radius: 13.0,
                            //   backgroundImage: AssetImage(AssetsPath.evenOffSide),
                            //   backgroundColor: Colors.transparent,
                            // ),
                            Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  SizeUtils.horizontalBlockSize * 20,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: Image.asset(
                                  homeController.imageTeamOneType(teamList?[index].team2?.teamName),
                                  fit: BoxFit.cover,
                                  height: SizeUtils.horizontalBlockSize * 7.5,
                                  width: SizeUtils.horizontalBlockSize * 7.5,
                                  // scale: 40,
                                ),
                              ),
                            ),

                            SizedBox(
                              width: SizeUtils.horizontalBlockSize * 2.3,
                            ),
                            SizedBox(
                              width: SizeUtils.horizontalBlockSize * 25,
                              child: AppText(
                                maxLines: 1,
                                text: "${teamList?[index].team2?.teamName}",
                                fontSize: SizeUtils.fSize_13(),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
