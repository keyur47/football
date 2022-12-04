import 'package:football/helper/firebase_analyticsUtils.dart';
import 'package:football/helper/loading_helper.dart';
import 'package:football/modules/dashbord/home/controller/home_controller.dart';
import 'package:football/modules/dashbord/news/controller/news_controller.dart';
import 'package:football/modules/dashbord/ranking/controller/ranking_controller.dart';
import 'package:football/modules/dashbord/ranking/model/form_model.dart';
import 'package:football/modules/dashbord/ranking/model/form_model.dart' as formModel;
import 'package:football/modules/dashbord/ranking/model/ranking_model.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/utils/strings_utils.dart';
import 'package:football/widgets/app_text.dart';
import 'package:football/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_drawer/kf_drawer.dart';

class RankingScreen extends KFDrawerContent {
  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  final RankingController rankingController = Get.find();

  final HomeController homeController = Get.find();

  final NewsController newsController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    FirebaseAnalyticsUtils.sendCurrentScreen(FirebaseAnalyticsUtils.rankingScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        leadingWidth: SizeUtils.horizontalBlockSize * 8,
        leading: Builder(
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                top: SizeUtils.horizontalBlockSize * 0.4,
                left: SizeUtils.horizontalBlockSize * 3,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  size: SizeUtils.horizontalBlockSize * 5.5,
                ),
                onPressed: widget.onMenuPressed,
              ),
            );
          },
        ),
        title: AppText(
          text: StringsUtils.ranking,
          color: AppColors.white,
          fontWeight: FontWeight.w500,
          fontSize: SizeUtils.fSize_18(),
        ),
      ),
      body: RefreshIndicator(
        color: Colors.black,
        backgroundColor: Colors.white,

        onRefresh: () async {
          await rankingController.tableApiCall();
          await rankingController.formApiCall();
        },
        // notificationPredicate: (ScrollNotification notification) {
        //   return notification.depth == 1;
        // },
        child: Obx(
          () => rankingController.isLoading.value || rankingController.isFormLoading.value
              ? const Loading()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeUtils.verticalBlockSize * 1.8,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: SizeUtils.verticalBlockSize * 1.8,
                          right: SizeUtils.verticalBlockSize * 1.8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Row(
                                children: List.generate(
                                  rankingController.tableType.length,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      rankingController.isSelectedType.value = index;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: rankingController.isSelectedType.value == index
                                                ? Colors.grey[300]
                                                : AppColors.white[10],
                                            boxShadow: [
                                              BoxShadow(
                                                color: rankingController.isSelectedType.value == index
                                                    ? Colors.transparent
                                                    : AppColors.grey[90]!,
                                                blurRadius: 2,
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                                          child: AppText(
                                            text: rankingController.tableType[index],
                                            fontSize: SizeUtils.fSize_13(),
                                            fontWeight: FontWeight.w500,
                                            color: rankingController.isSelectedType.value == index
                                                ? AppColors.green[100]
                                                : AppColors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Obx(
                              () => rankingController.isSelectedType.value == 2
                                  ? Container(
                                      height: SizeUtils.verticalBlockSize * 3.9,
                                      width: SizeUtils.horizontalBlockSize * 22,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: AppColors.white,
                                        boxShadow: [
                                          BoxShadow(color: AppColors.grey[90]!, blurRadius: 2),
                                        ],
                                      ),
                                      child: DropdownButton(
                                        underline: const SizedBox(),
                                        isExpanded: true,
                                        iconDisabledColor: AppColors.black,
                                        items: rankingController.locationList.map((location) {
                                          return DropdownMenuItem<String>(
                                            value: location,
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  location,
                                                  style: const TextStyle(
                                                      color: AppColors.black,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                        value: rankingController.selectedLocationList.value,
                                        onChanged: (newValue) {
                                          rankingController.selectedLocationList.value = newValue.toString();
                                        },
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeUtils.horizontalBlockSize * 4,
                      ),
                      Container(
                        constraints: const BoxConstraints(maxHeight: double.maxFinite),
                        child: Obx(() => rankingController.isLoading.value
                            ? const Center(
                                child: Loading(),
                              )
                            : rankingController.isSelectedType.value == 0
                                ? fullView() ?? const SizedBox()
                                : rankingController.isSelectedType.value == 1
                                    ? shortView() ?? const SizedBox()
                                    : formView() ?? const SizedBox()),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 7),
                        child: Row(
                          children: [
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: AppColors.green),
                            ),
                            const SizedBox(width: 10),
                            AppText(
                              text: StringsUtils.qualificationNextStage,
                              fontSize: 12,
                              color: AppColors.black.withOpacity(0.7),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget? shortView(
      {String? groupNo, String? imgUrl, String? countryName, String? plPoints, String? gdPoints, String? ptsPoint}) {
    return Container(
      constraints: const BoxConstraints(maxHeight: double.maxFinite),
      child: ListView.builder(
          itemCount: rankingController.rankingTableModel.value.root?.table?.subt?.length ?? 0,
          padding: EdgeInsets.symmetric(horizontal: SizeUtils.verticalBlockSize * 1.8),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Subt? subt = rankingController.rankingTableModel.value.root?.table?.subt?[index];
            return Padding(
              padding: EdgeInsets.only(
                bottom: SizeUtils.verticalBlockSize * 1.8,
              ),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColors.white, boxShadow: [
                  BoxShadow(color: AppColors.grey[90]!, blurRadius: 2),
                ]),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: SizeUtils.verticalBlockSize * 2,
                        left: SizeUtils.horizontalBlockSize * 4,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 8,
                              child: Text(
                                subt?.name.toString() ?? '',
                                // 'Grp. A',
                                style: const TextStyle(
                                    color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 12.9),
                              )),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Pl',
                              style: TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'GD',
                              style: TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Pts',
                              style: TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w400, fontSize: 14),
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
                        rankingController.rankingTableModel.value.root?.table?.subt?[index].t?.length ?? 0,
                        (index1) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            children: [
                              index1 == 0 || index1 == 1
                                  ? Container(
                                      width: 2.5,
                                      height: SizeUtils.verticalBlockSize * 6.5,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
                                          color: AppColors.green[200]),
                                    )
                                  : const SizedBox(width: 2.5),
                              Expanded(
                                child: SizedBox(
                                  height: SizeUtils.verticalBlockSize * 6.5,
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
                                            SizedBox(
                                              width: SizeUtils.horizontalBlockSize * 2.8,
                                            ),
                                            Text(
                                              rankingController.rankingTableModel.value.root?.table?.subt?[index]
                                                      .t?[index1].name ??
                                                  '',
                                              style: const TextStyle(
                                                  color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          ' ${(int.parse(subt?.t?[index1].w ?? '0')) + (int.parse(subt?.t?[index1].d ?? '0')) + (int.parse(subt?.t?[index1].l ?? '0'))}',
                                          style: const TextStyle(
                                              color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12.9),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          (int.parse(subt?.t?[index1].g ?? '0')) -
                                                      (int.parse(subt?.t?[index1].hc ?? '0')) >
                                                  0
                                              ? '+${(int.parse(subt?.t?[index1].g ?? '0')) - (int.parse(subt?.t?[index1].hc ?? '0'))}'
                                              : (int.parse(subt?.t?[index1].g ?? '0')) -
                                                          (int.parse(subt?.t?[index1].hc ?? '0')) ==
                                                      0
                                                  ? '  0'
                                                  : '${(int.parse(subt?.t?[index1].g ?? '0')) - (int.parse(subt?.t?[index1].hc ?? '0'))}',
                                          style: const TextStyle(
                                              color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12.9),
                                        ),
                                      ),
                                      SizedBox(width: SizeUtils.horizontalBlockSize * 1),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          rankingController
                                                  .rankingTableModel.value.root?.table?.subt?[index].t?[index1].p ??
                                              '',
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
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            );
          }),
    );
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
        padding: EdgeInsets.symmetric(horizontal: SizeUtils.verticalBlockSize * 1.8),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        primary: true,
        itemCount: rankingController.rankingTableModel.value.root?.table?.subt?.length ?? 0,
        itemBuilder: (context, teamIndex) {
          Subt? subt = rankingController.rankingTableModel.value.root?.table?.subt?[teamIndex];
          return Padding(
            padding: EdgeInsets.only(
              bottom: SizeUtils.verticalBlockSize * 1.8,
            ),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: AppColors.white, boxShadow: [
                BoxShadow(color: AppColors.grey[90]!, blurRadius: 2),
              ]),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: SizeUtils.verticalBlockSize * 2,
                      left: SizeUtils.horizontalBlockSize * 4,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 6,
                            child: Text(
                              subt?.name.toString() ?? '',
                              style:
                                  const TextStyle(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 12.9),
                            )),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Pl',
                            // textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'W',
                            // textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'D',
                            // textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'L',
                            // textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '+/-',
                            // textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w400, fontSize: 12.5),
                          ),
                        ),
                        SizedBox(width: SizeUtils.horizontalBlockSize * 2),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'GD',
                            // textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Pts',
                            // textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w400, fontSize: 14),
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
                            index1 == 0 || index1 == 1
                                ? Container(
                                    width: 2.5,
                                    height: SizeUtils.verticalBlockSize * 6.5,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
                                        color: AppColors.green[200]),
                                  )
                                : const SizedBox(width: 2.5),
                            Expanded(
                              child: SizedBox(
                                height: SizeUtils.verticalBlockSize * 6.5,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 7,
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
                                                color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 14),
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
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        '${subt?.t?[index1].g}-${subt?.t?[index1].hc}',
                                        // textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 12),
                                      ),
                                    ),

                                    SizedBox(width: SizeUtils.horizontalBlockSize * 2),
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
          );
        },
      ),
    );
  }

  Widget? formView({
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
    return Obx(
      () => Container(
        constraints: const BoxConstraints(maxHeight: double.maxFinite),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: SizeUtils.verticalBlockSize * 1.8),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          primary: true,
          itemCount: rankingController.rankingTableModel.value.root?.table?.subt?.length ?? 0,
          itemBuilder: (context, teamIndex) {
            Subt? subt = rankingController.rankingTableModel.value.root?.table?.subt?[teamIndex];

            return Padding(
              padding: EdgeInsets.only(
                bottom: SizeUtils.verticalBlockSize * 1.8,
              ),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: AppColors.white, boxShadow: [
                  BoxShadow(color: AppColors.grey[90]!, blurRadius: 2),
                ]),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: SizeUtils.verticalBlockSize * 2,
                        left: SizeUtils.horizontalBlockSize * 4,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 7,
                              child: Text(
                                subt?.name.toString() ?? '',
                                style: const TextStyle(
                                    color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 12.9),
                              )),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Last 5 matches',
                              // textAlign: TextAlign.center,
                              style: TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w500, fontSize: 12),
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
                    Obx(
                      () => Column(
                        children: List.generate(
                          subt?.t?.length ?? 0,
                          (index1) {
                            TeamForm? teamForm;
                            formModel.Form? form;
                            try {
                              if (rankingController.formModel.value.teamForm?.length != null) {
                                teamForm = rankingController.formModel.value.teamForm?.firstWhere(
                                    (element) => subt?.t?[index1].id == element.teamId.toString(),
                                    orElse: () => TeamForm());
                                if (teamForm?.form?.length != null) {
                                  form = teamForm?.form?.firstWhere((element) =>
                                      element.formType?.toLowerCase() ==
                                      rankingController.selectedLocationList.toLowerCase());
                                }
                              }
                            } catch (e, st) {
                              print("error==>$e $st");
                            }
                            List tempList = [];
                            for (int i = 0; i < form!.wdlIndicators!.length; i++) {
                              tempList.add(form.wdlIndicators.toString().substring(i, i + 1));
                            }
                            int lastIndex = tempList.length == 0 ? 0 : tempList.length - 1;

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Row(
                                children: [
                                  index1 == 0 || index1 == 1
                                      ? Container(
                                          width: 2.5,
                                          height: SizeUtils.verticalBlockSize * 6.5,
                                          decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.only(
                                                  topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
                                              color: AppColors.green[200]),
                                        )
                                      : const SizedBox(width: 2.5),
                                  Expanded(
                                    child: SizedBox(
                                      height: SizeUtils.verticalBlockSize * 6.5,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 7,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                                const Spacer(),
                                                Row(
                                                  children: List.generate(
                                                    tempList.length,
                                                    (indexTemp) => Transform(
                                                      transform: Matrix4.translationValues(
                                                          SizeUtils.horizontalBlockSize * 1,
                                                          SizeUtils.horizontalBlockSize * 4,
                                                          0),
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                                        child: Column(
                                                          children: [
                                                            if (form?.wdlIndicators != null)
                                                              form?.wdlIndicators == ''
                                                                  ? const SizedBox()
                                                                  : Container(
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(4),
                                                                        color: tempList[indexTemp].toLowerCase() == 'd'
                                                                            ? AppColors.grey
                                                                            : tempList[indexTemp].toLowerCase() == 'w'
                                                                                ? AppColors.green
                                                                                : AppColors.black,
                                                                      ),
                                                                      child: Padding(
                                                                        padding:
                                                                            tempList[indexTemp].toLowerCase() == 'd'
                                                                                ? const EdgeInsets.symmetric(
                                                                                    horizontal: 4, vertical: 2)
                                                                                : const EdgeInsets.symmetric(
                                                                                    horizontal: 3, vertical: 2),
                                                                        child: AppText(
                                                                          // text: form?.wdlIndicators?.toLowerCase() == 'l'
                                                                          //     ? ' L '
                                                                          //     : form?.wdlIndicators ?? "",
                                                                          text: tempList[indexTemp].toLowerCase() == 'l'
                                                                              ? ' L '
                                                                              : tempList[indexTemp],
                                                                          color: AppColors.white,
                                                                          fontSize: 12,
                                                                          fontWeight: FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                    ),
                                                            const SizedBox(height: 2),
                                                            if (form?.wdlIndicators != null)
                                                              form?.wdlIndicators == ''
                                                                  ? const SizedBox()
                                                                  : indexTemp == lastIndex
                                                                      ? Container(
                                                                          height: 2.5,
                                                                          width: 15.5,
                                                                          decoration: BoxDecoration(
                                                                              color: tempList[indexTemp]
                                                                                          .toLowerCase() ==
                                                                                      'd'
                                                                                  ? AppColors.grey
                                                                                  : tempList[indexTemp].toLowerCase() ==
                                                                                          'w'
                                                                                      ? AppColors.green
                                                                                      : AppColors.black,
                                                                              borderRadius: BorderRadius.circular(100)),
                                                                        )
                                                                      : const SizedBox(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: SizeUtils.horizontalBlockSize * 5),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
