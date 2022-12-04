import 'package:football/model/arguments_match_detail_model.dart';
import 'package:football/modules/dashbord/home/controller/home_controller.dart';
import 'package:football/modules/dashbord/home/model/detailes_stats_model.dart';
import 'package:football/modules/dashbord/home/screen/scores/screen/stats/player_detail_screen.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/assets_path.dart';
import 'package:football/utils/navigation_utils/routes.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Players extends StatefulWidget {
  ArgumentsMatchDetailModel? arg;

  Players({this.arg});

  @override
  State<Players> createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  HomeController homeController = Get.find();
  // late ArgumentsMatchDetailModel arg;

  List<PlayerStats> topRating = <PlayerStats>[];
  List<PlayerStats> expectedGoals = <PlayerStats>[];
  List<PlayerStats> bigChangesCreated = <PlayerStats>[];
  List<PlayerStats> totalShots = <PlayerStats>[];
  List<PlayerStats> passSuccess = <PlayerStats>[];
  List<PlayerStats> successfulDribbles = <PlayerStats>[];
  List<PlayerStats> tacklesWon = <PlayerStats>[];

  @override
  void initState() {
    widget.arg;

    homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats
        ?.sort((a, b) => b.playerRating!.compareTo(a.playerRating ?? 0.0));
    homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats
        ?.sort((a, b) => b.expectedGoals?.compareTo(a.expectedGoals ?? 0) ?? 0);
    topRating.addAll(homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats ?? []);
    expectedGoals.addAll(homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats ?? []);
    bigChangesCreated.addAll(homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats ?? []);
    totalShots.addAll(homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats ?? []);
    passSuccess.addAll(homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats ?? []);
    successfulDribbles.addAll(homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats ?? []);
    tacklesWon.addAll(homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats ?? []);

    ///

    topRating.sort((a, b) => (b.playerRating ?? 0.0).compareTo(a.playerRating ?? 0.0));
    expectedGoals.sort((a, b) => (b.expectedGoals ?? 0.0).compareTo(a.expectedGoals ?? 0.0));
    bigChangesCreated.sort((a, b) => (b.bigChance ?? 0).compareTo(a.bigChance ?? 0));
    totalShots.sort((a, b) => (b.shotsInsideBox ?? 0).compareTo(a.shotsInsideBox ?? 0));
    passSuccess.sort((a, b) => (b.passSuccess ?? 0).compareTo(a.passSuccess ?? 0));
    successfulDribbles.sort((a, b) => (b.dribblesWon ?? 0).compareTo(a.dribblesWon ?? 0));
    tacklesWon.sort((a, b) => (b.tacklesSuccess ?? 0).compareTo(a.tacklesSuccess ?? 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        playerView(0, playerStatName: 'Top Rating', playerStats: topRating.sublist(0, 3)),
        playerView(1, playerStatName: 'Top goals (xG)', playerStats: expectedGoals.sublist(0, 3)),
        playerView(2, playerStatName: 'Big changes created', playerStats: bigChangesCreated.sublist(0, 3)),
        playerView(3, playerStatName: 'Total shots', playerStats: totalShots.sublist(0, 3)),
        playerView(4, playerStatName: 'Pass success', playerStats: passSuccess.sublist(0, 3)),
        playerView(5, playerStatName: 'Successful dribbles', playerStats: successfulDribbles.sublist(0, 3)),
        playerView(6, playerStatName: 'Tackles won', playerStats: tacklesWon.sublist(0, 3)),
      ],
    );
  }

  Widget playerView(
    int rowIndex, {
    String? playerStatName,
    List<PlayerStats>? playerStats,
  }) {
    return Card(
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
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: playerStatName ?? '',
                  color: AppColors.black,
                  fontSize: SizeUtils.fSize_14(),
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(PlayerDetailScreen(
                      arg: widget.arg,
                    ));
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.black,
                    size: 15,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: List.generate(playerStats?.length ?? 0, (index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // const CircleAvatar(
                            //     radius: 11,
                            //     backgroundImage: NetworkImage(
                            //       'https://img1.hscicdn.com/image/upload/f_auto/lsci/db/PICTURES/CMS/289000/289002.1.jpg',
                            //       // scale: 9,
                            //     )),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white[80],
                                // image: const DecorationImage(
                                //   image: AssetImage(AssetsPath.afcTeam),
                                // ),
                              ),
                              child: Center(
                                child: Text(
                                  playerStats?[index].playerName?.substring(0, 1) ?? "",
                                  style: TextStyle(fontSize: SizeUtils.fSize_13()),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            AppText(
                              text: '${playerStats?[index].playerName}',
                              color: AppColors.black,
                              fontSize: SizeUtils.fSize_13(),
                              // letterSpacing: 0.5,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            // CircleAvatar(
                            //     backgroundColor: Colors.transparent,
                            //     radius: 11,
                            //     backgroundImage: AssetImage(
                            //       AssetsPath.arg,
                            //       // scale: 9,
                            //     )),
                            playerStats?[index].playsOnHomeTeam == true
                                ? Container(
                                    height: 20,
                                    width: 20,
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
                                    height: 20,
                                    width: 20,
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
                            const SizedBox(
                              width: 8,
                            ),
                            SizedBox(
                              width: SizeUtils.horizontalBlockSize * 13,
                              // decoration: BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 2, bottom: 2),
                                child: Center(
                                  child: AppText(
                                    text: playerStatsData(rowIndex, playerStats![index]).toString(),
                                    color: AppColors.black,
                                    fontSize: SizeUtils.fSize_13(),
                                    // letterSpacing: 0.5,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    )
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  playerStatsData(int index, PlayerStats stats) {
    switch (index) {
      case 0:
        // do something
        return stats.playerRating;
      case 1:
        // do something else
        return stats.expectedGoals;
      case 2:
        // do something else
        return stats.bigChance;
      case 3:
        // do something else
        return stats.shotsInsideBox;
      case 4:
        // do something else
        return stats.passSuccess;
      case 5:
        // do something else
        return stats.dribblesWon;
      case 6:
        // do something else
        return stats.tacklesSuccess;
    }
  }
}
