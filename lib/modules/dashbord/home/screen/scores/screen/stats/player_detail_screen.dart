import 'package:football/model/arguments_match_detail_model.dart';
import 'package:football/modules/dashbord/home/controller/home_controller.dart';
import 'package:football/modules/dashbord/home/model/detailes_stats_model.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/widgets/app_text.dart';
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

  List<String> statsType = ['ALL', 'BY TEAM'];
  RxInt isSelectedType = 0.obs;

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
          "Key players",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.white,
              height: SizeUtils.horizontalBlockSize * 4,
            ),
            Container(
              color: AppColors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Qatar",
                  ),
                  SizedBox(
                    width: SizeUtils.horizontalBlockSize * 2,
                  ),
                  Container(
                    height: 24,
                    width: 24,
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
                  ),
                  SizedBox(
                    width: SizeUtils.horizontalBlockSize * 2,
                  ),
                  (widget.arg?.scores1?.isEmpty ?? true)
                      ? const SizedBox()
                      : AppText(
                          text: "${widget.arg?.scores1}",
                          // color: AppColors.white,
                          fontSize: SizeUtils.fSize_14(),
                          fontWeight: FontWeight.w500,
                        ),
                  SizedBox(
                    width: SizeUtils.horizontalBlockSize * 2,
                  ),
                  Container(
                    height: 24,
                    width: 24,
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
                    width: SizeUtils.horizontalBlockSize * 2,
                  ),
                  const Text(
                    "Qatar",
                  ),
                ],
              ),
            ),
            Container(
              color: AppColors.white,
              height: SizeUtils.horizontalBlockSize * 4,
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  SizeUtils.horizontalBlockSize * 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      statsType.length,
                      (index) => GestureDetector(
                        onTap: () {
                          isSelectedType.value = index;
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            width: SizeUtils.horizontalBlockSize * 20,
                            decoration: BoxDecoration(
                              color: isSelectedType.value == index ? Colors.grey[300] : AppColors.white[10],
                              boxShadow: [
                                BoxShadow(
                                  color: isSelectedType.value == index ? Colors.transparent : AppColors.grey[90]!,
                                  blurRadius: 1,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                              child: Center(
                                child: AppText(
                                  text: statsType[index],
                                  fontSize: SizeUtils.fSize_12(),
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
              ),
            ),
            const SizedBox(height: 6),
            Obx(
              () => isSelectedType.value == 0 ? allTeamPlayer() : byTeamPlayer(),
            )
          ],
        ),
      ),
    );
  }

  Widget byTeamPlayer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeUtils.horizontalBlockSize * 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
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
                  ),
                  SizedBox(
                    width: SizeUtils.horizontalBlockSize * 4,
                  ),
                  Text(
                    widget.arg?.teamNameOne.toString() ?? "",
                    style: TextStyle(
                      fontSize: SizeUtils.fSize_13(),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _homeController.homeTeamRow.length,
                  itemBuilder: (BuildContext context, int index) {
                    var plusIndex = index + 1;
                    PlayerStats stats = _homeController.homeTeamRow[index] ?? PlayerStats();
                    return stats.playerRating != 0
                        ? Column(
                            children: [
                              Row(
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
                                              fontSize: SizeUtils.fSize_13(),
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        )
                                      ],
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
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 14,
                              )
                            ],
                          )
                        : const SizedBox();
                  },
                  // separatorBuilder: (BuildContext context, int index) {
                  //   return const SizedBox(
                  //     height: 14,
                  //   );
                  // },
                ),
              ),
              Row(
                children: [
                  Container(
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
                  SizedBox(
                    width: SizeUtils.horizontalBlockSize * 4,
                  ),
                  Text(
                    widget.arg?.teamNameTwo.toString() ?? "",
                    style: TextStyle(
                      fontSize: SizeUtils.fSize_13(),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _homeController.awayTeamRow.length,
                  itemBuilder: (BuildContext context, int index) {
                    var plusIndex = index + 1;
                    PlayerStats stats = _homeController.awayTeamRow[index] ?? PlayerStats();
                    return stats.playerRating != 0
                        ? Column(
                            children: [
                              Row(
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
                                              fontSize: SizeUtils.fSize_13(),
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        )
                                      ],
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
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 14,
                              )
                            ],
                          )
                        : const SizedBox();
                  },
                  // separatorBuilder: (BuildContext context, int index) {
                  //   return const SizedBox(
                  //     height: 14,
                  //   );
                  // },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget allTeamPlayer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                SizeUtils.horizontalBlockSize * 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  print(
                      "=====>${_homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?[index].playerRating}");
                  var plusIndex = index + 1;
                  PlayerStats stats =
                      _homeController.matchDetailsModel?.value.root?.detailedstats?.playerStats?[index] ?? PlayerStats();
                  return stats.playerRating != 0
                      ? Column(
                          children: [
                            Row(
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
                                        ),
                                        child: Center(
                                          child: Text(
                                            stats.playerName?.substring(0, 1) ?? "",
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
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: SizeUtils.fSize_13(),
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
                                    ),
                                  ],
                                ),
                              ],

                              // : SizedBox();
                            ),
                            const SizedBox(
                              height: 14,
                            )
                          ],
                        )
                      : const SizedBox();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
