import 'package:football/ads/banner_ad.dart';
import 'package:football/model/arguments_match_detail_model.dart';
import 'package:football/modules/dashbord/home/controller/home_controller.dart';
import 'package:football/modules/dashbord/home/screen/scores/screen/stats/player_detail_screen.dart';
import 'package:football/modules/dashbord/home/screen/scores/screen/stats/players.dart';
import 'package:football/modules/dashbord/home/screen/scores/screen/stats/team_stats.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatsScreen extends StatefulWidget {
  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  List<String> statsType = ['TEAM', 'PLAYER'];
  late ArgumentsMatchDetailModel arg;
  final HomeController homeController = Get.find();

  @override
  void initState() {
    arg = Get.arguments;

    super.initState();
  }

  RxInt isSelectedType = 0.obs;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.black,
      backgroundColor: Colors.white,
      onRefresh: () async {
        await homeController.matchDetailsApiCall(matchID: arg.matchId);
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.horizontalBlockSize * 0,
            vertical: SizeUtils.horizontalBlockSize * 0.5,
          ),
          child: Column(
            children: [
              const SizedBox(height: 6),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    statsType.length,
                    (index) => GestureDetector(
                      onTap: () {
                        isSelectedType.value = index;
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          width: SizeUtils.horizontalBlockSize * 45,
                          decoration: BoxDecoration(
                              color: isSelectedType.value == index ? Colors.grey[300] : AppColors.white[10],
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: isSelectedType.value == index ? Colors.transparent : AppColors.grey[90]!,
                              //     blurRadius: 2,
                              //   ),
                              // ],
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
                            child: Center(
                              child: AppText(
                                text: statsType[index],
                                fontSize: SizeUtils.fSize_14(),
                                fontWeight: FontWeight.w500,
                                color: isSelectedType.value == index ? AppColors.green[100] : AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Obx(() => isSelectedType.value == 0
                  ? TeamStats()
                  : Players(
                      arg: arg,
                    )),
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
        ),
      ),
    );
  }
}
