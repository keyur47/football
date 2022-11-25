import 'package:football/model/arguments_match_detail_model.dart';
import 'package:football/modules/dashbord/home/controller/home_controller.dart';
import 'package:football/modules/dashbord/home/model/detailes_stats_model.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerDetailScreen extends StatefulWidget {
  PlayerDetailScreen({this.arg});

  ArgumentsMatchDetailModel? arg;

  @override
  State<PlayerDetailScreen> createState() => _PlayerDetailScreenState();
}

class _PlayerDetailScreenState extends State<PlayerDetailScreen> {
  final HomeController _homeController = Get.find();

  // late ArgumentsMatchDetailModel arg;
  @override
  void initState() {
    // arg = Get.arguments;
    print("widgetwidgetwidget${widget.arg?.teamImageOne}");
    sortByPlayerRating();
    super.initState();
  }

  sortByPlayerRating() {
    _homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?.sort((a, b) {
      print("Player detail =====>${a.playerRating}");
      return (b.playerRating ?? 0.0).compareTo(a.playerRating ?? 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backGroundColor: AppColors.white,
        centerTitle: true,
        title: const Text(
          "Key Players",
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: _homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              print("=====>${_homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?[index].playerRating}");
              var plusIndex = index + 1;
              PlayerStats stats =
                  _homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?[index] ?? PlayerStats();

              // PlayerStats? playerStats = _homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?.firstWhere(
              //     (element) =>
              //         element.playerId.toString() ==
              //         _homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?[index].playerId);
              // bool isHomeTeam = playerStats?.playsOnHomeTeam ?? false;
              // print("Home team---> ${isHomeTeam}");
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 26,
                          child: Text(
                            plusIndex.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeUtils.horizontalBlockSize * 3,
                        ),
                        Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white[80],
                            // image: const DecorationImage(
                            //   image: AssetImage(AssetsPath.afcTeam),
                            // ),
                          ),
                          child: Center(
                            child: Text(
                              stats.playerName?.substring(0, 1) ?? "",
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeUtils.horizontalBlockSize * 3,
                        ),
                        Expanded(
                          child: Text(
                            stats.playerName.toString(),
                            maxLines: 1,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: SizeUtils.fSize_14(),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      stats.playsOnHomeTeam == true
                          ? Container(
                              height: 22,
                              width: 22,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // color: AppColors.white[80],
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    widget.arg?.teamImageOne ?? '',
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: 22,
                              width: 22,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // color: AppColors.white[80],
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    widget.arg?.teamImageTwo ?? '',
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        width: SizeUtils.horizontalBlockSize * 4.5,
                      ),
                      SizedBox(
                        width: 38,
                        child: Text(
                          stats.playerRating.toString(),
                          style: TextStyle(
                            fontSize: SizeUtils.fSize_13(),
                            fontWeight: FontWeight.w500,
                            // color: AppColors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 14,
              );
            },
          ),
        ),
      ),
    );
  }
}
