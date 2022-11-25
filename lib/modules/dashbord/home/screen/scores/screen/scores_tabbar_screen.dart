import 'package:football/model/arguments_match_detail_model.dart';
import 'package:football/modules/dashbord/home/controller/home_controller.dart';
import 'package:football/modules/dashbord/home/screen/scores/controller/scores_tabbar_controller.dart';
import 'package:football/modules/dashbord/home/screen/scores/screen/lineup/lineup_screen.dart';
import 'package:football/modules/dashbord/home/screen/scores/screen/preview/preview_screen.dart';
import 'package:football/modules/dashbord/home/screen/scores/screen/stats/stats_screen.dart';
import 'package:football/modules/dashbord/home/screen/scores/screen/table/table_screen.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/custom_tab_indicator.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/widgets/app_text.dart';
import 'package:football/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoresScreen extends StatefulWidget {
  const ScoresScreen({Key? key}) : super(key: key);

  @override
  State<ScoresScreen> createState() => _ScoresScreenState();
}

class _ScoresScreenState extends State<ScoresScreen> {
  HomeController homeController = Get.find();
  ScoresTabbarController scoresTabbarController = Get.find();
  late ArgumentsMatchDetailModel arg;

  @override
  void initState() {
    super.initState();
    arg = Get.arguments;
    api();
    super.initState();
  }

  api() async {
    await homeController.matchDetailsApiCall(matchID: arg.matchId);
  }

  @override
  Widget build(BuildContext context) {
    // String todayYear = DateTime.now().toString().substring(0, 4);
    // String todayMonth = DateTime.now().toString().substring(5, 7);
    // String todayDay = DateTime.now().toString().substring(8, 10);
    // String todayHour = DateTime.now().toString().substring(11, 13);
    // String todayMinute = DateTime.now().toString().substring(14, 16);
    // String todaySecond = DateTime.now().toString().substring(17, 19);
    //
    // String apiYear = arg.fullTime.toString().substring(0, 4);
    // String apiMonth = arg.fullTime.toString().substring(4, 6);
    // String apiDay = arg.fullTime.toString().substring(6, 8);
    // String apiHour = arg.fullTime.toString().substring(8, 10);
    // String apiMinute = arg.fullTime.toString().substring(10, 12);
    // DateTime parsedDate = DateFormat("yyyy-MM-dd hh:mm").parse("$apiYear-$apiMonth-$apiDay $todayHour:$todayHour:00.000000");
    // String parsedDate2 = displayDayAndDateTimes(arg.fullTime.toString(), "yyyy-MM-dd hh:mm");
    // DateTime parsedDate3 = DateTime.parse(parsedDate2);
    // DateTime nowDate = DateFormat("yyyy-MM-dd hh:mm").parse("$todayYear-$todayMonth-$todayDay 00:00:00.000000");
    // bool isMatchFinished = parsedDate.isBefore(nowDate);
    // int diff = parsedDate3.difference(nowDate).inDays;
    // int hr = int.parse(arg.time.toString().split(':').first) - (int.parse(todayHour) - 12);
    // int mi = int.parse(arg.time.toString().split(':').last.substring(0, 2)) - int.parse(todayMinute);
    // int totalMin = (hr * 60) + mi;
    // int sec = (totalMin * 60) + int.parse(todaySecond);
    //
    // ///time
    // int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * sec;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        backGroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        // action: [
        //   IconButton(
        //     icon: const Icon(
        //       Icons.star_border_purple500,
        //       color: AppColors.black,
        //     ),
        //     onPressed: () async {
        //       await homeController.matchDetailsApiCall(matchID: arg.matchId);
        //     },
        //   ),
        //   IconButton(
        //     icon: const Icon(
        //       Icons.more_vert_sharp,
        //       color: AppColors.black,
        //     ),
        //     onPressed: () {},
        //   ),
        //   SizedBox(
        //     width: SizeUtils.horizontalBlockSize * 1,
        //   )
        // ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 8, vertical: SizeUtils.horizontalBlockSize * 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    // Image.asset(
                    //   arg.teamImageOne ?? '',
                    //   width: SizeUtils.horizontalBlockSize * 12,
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
                          arg.teamImageOne ?? '',
                          fit: BoxFit.cover,
                          height: SizeUtils.horizontalBlockSize * 12,
                          width: SizeUtils.horizontalBlockSize * 12,
                          // scale: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeUtils.horizontalBlockSize * 3,
                    ),
                    SizedBox(
                      width: SizeUtils.horizontalBlockSize * 22,
                      child: AppText(
                        text: arg.teamNameOne ?? '',
                        textAlign: TextAlign.center,
                        fontSize: SizeUtils.fSize_14(),
                        // color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    (arg.scores1?.isEmpty ?? true)
                        ? const SizedBox()
                        : AppText(
                            text: "${arg.scores1}",
                            // color: AppColors.white,
                            fontSize: SizeUtils.horizontalBlockSize * 8,
                            fontWeight: FontWeight.w500,
                          ),
                    SizedBox(
                      height: SizeUtils.horizontalBlockSize * 1,
                    ),
                    // isMatchFinished == true && diff == 0
                    //     ? Transform(
                    //         transform: Matrix4.translationValues(0.0, SizeUtils.horizontalBlockSize * 4, 0.0),
                    //         child: AppText(
                    //           text: 'Full Time',
                    //           fontSize: SizeUtils.fSize_14(),
                    //           fontWeight: FontWeight.w400,
                    //         ),
                    //       )
                    //     : isMatchFinished == false && diff == 0
                    //         ? Transform(
                    //             transform: Matrix4.translationValues(0.0, SizeUtils.horizontalBlockSize * 4, 0.0),
                    //             child: CountdownTimer(
                    //               controller: homeController.countdownTimerController,
                    //               endTime: endTime,
                    //               onEnd: ,
                    //             ),
                    //           )
                    //         :
                    // Transform(
                    //             transform: Matrix4.translationValues(0.0, SizeUtils.horizontalBlockSize * 4, 0.0),
                    //             child: AppText(
                    //               text: parsedDate3.isAfter(nowDate) && diff == 1
                    //                   ? 'Tomorrow'
                    //                   : displayDayAndDateTimes(arg.fullTime ?? "", "EEE, dd MMM"),
                    //               // color: AppColors.white,
                    //               fontSize: SizeUtils.fSize_14(),
                    //               fontWeight: FontWeight.w400,
                    //             ),
                    //           ),
                  ],
                ),
                Column(
                  children: [
                    // Card(
                    //   elevation: 4,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(
                    //       SizeUtils.horizontalBlockSize * 20,
                    //     ),
                    //   ),
                    //   child: CircleAvatar(
                    //     backgroundColor: Colors.transparent,
                    //     radius: SizeUtils.horizontalBlockSize * 6,
                    //     backgroundImage: AssetImage(
                    //       arg.teamImageTwo ?? '',
                    //     ),
                    //   ),
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
                          arg.teamImageTwo ?? '',
                          fit: BoxFit.cover,
                          height: SizeUtils.horizontalBlockSize * 12,
                          width: SizeUtils.horizontalBlockSize * 12,
                          // scale: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeUtils.horizontalBlockSize * 3,
                    ),
                    SizedBox(
                      width: SizeUtils.horizontalBlockSize * 22,
                      child: AppText(
                        text: arg.teamNameTwo ?? '',
                        textAlign: TextAlign.center,
                        fontSize: SizeUtils.fSize_14(),
                        // color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeUtils.horizontalBlockSize * 2,
          ),
          Expanded(
            child: Container(
              // height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SizeUtils.horizontalBlockSize * 6),
                  topRight: Radius.circular(SizeUtils.horizontalBlockSize * 6),
                ),
                color: AppColors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 0, vertical: SizeUtils.horizontalBlockSize * 3),
                child: DefaultTabController(
                  length: (arg.isCompleted ?? false) ? 4 : 3,
                  child: Column(
                    children: [
                      createTabBar(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget createTabBar() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                // color: AppColors.primaryColor,
                border: Border(
              bottom: BorderSide(width: 0.3, color: Colors.black.withOpacity(0.3)),
            )),
            child: TabBar(
              splashFactory: NoSplash.splashFactory,
              padding: EdgeInsets.zero,
              isScrollable: true,
              indicatorColor: AppColors.green,
              labelColor: AppColors.black,
              indicatorWeight: 3,
              indicator: CustomTabIndicator(color: AppColors.green, indicatorHeight: 3),
              labelStyle: TextStyle(fontSize: SizeUtils.fSize_14(), fontWeight: FontWeight.w500),
              unselectedLabelColor: AppColors.grey[70],
              // indicatorSize: TabBarIndicatorSize.label,
              overlayColor: MaterialStateColor.resolveWith(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.transparent;
                  }
                  if (states.contains(MaterialState.focused)) {
                    return Colors.transparent;
                  } else if (states.contains(MaterialState.hovered)) {
                    return Colors.transparent;
                  }

                  return Colors.transparent;
                },
              ),
              tabs: ((arg.isCompleted ?? false) ? scoresTabbarController.tab : scoresTabbarController.tabUpcoming)
                  .map((tabName) => Tab(child: Text(tabName)))
                  .toList(),
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.grey.withOpacity(0.1),
              child: TabBarView(
                children: [
                  const PreviewScreen(),
                  // TickerScreen(),
                  TableScreen(),
                  // HTWOHScreen(),
                  LineUpScreen(arg: arg),
                  if (arg.isCompleted ?? false) StatsScreen(),
                  // BuzzScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
