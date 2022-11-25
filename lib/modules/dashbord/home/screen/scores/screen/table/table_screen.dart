import 'package:football/helper/loading_helper.dart';
import 'package:football/model/arguments_match_detail_model.dart';
import 'package:football/modules/dashbord/home/controller/home_controller.dart';
import 'package:football/modules/dashbord/ranking/controller/ranking_controller.dart';
import 'package:football/modules/dashbord/ranking/model/form_model.dart';
import 'package:football/modules/dashbord/ranking/model/form_model.dart' as formModel;
import 'package:football/modules/dashbord/ranking/model/ranking_model.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/utils/strings_utils.dart';
import 'package:football/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableScreen extends StatefulWidget {
  TableScreen({Key? key}) : super(key: key);

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final RankingController rankingController = Get.find();

  final HomeController homeController = Get.find();
  late ArgumentsMatchDetailModel arg;

  @override
  void initState() {
    super.initState();
    arg = Get.arguments;
    // Future.delayed(Duration.zero, () {
    //   api();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SingleChildScrollView(
          child: Obx(
            () => rankingController.isLoading.value || rankingController.isFormLoading.value
                ? const Loading()
                : arg.teamNameOne?.split(' ').first.toLowerCase() == 'winner' ||
                        arg.teamNameOne?.split(' ').first.toLowerCase() == 'loser'
                    ? Padding(
                        padding: EdgeInsets.symmetric(vertical: SizeUtils.verticalBlockSize * 30),
                        child: const Center(
                          child: AppText(
                            text: "No Data Available",
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      )
                    : arg.teamNameOne.toString().length > 2 &&
                            arg.teamNameTwo.toString().length > 2 &&
                            arg.teamNameOne != ''
                        ? Column(
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
                                                  padding:
                                                      const EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
                                                  child: AppText(
                                                    text: rankingController.tableType[index],
                                                    fontSize: SizeUtils.fSize_14(),
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
                                height: SizeUtils.horizontalBlockSize * 5,
                              ),
                              arg.teamNameOne != ''
                                  ? Container(
                                      constraints: const BoxConstraints(maxHeight: double.maxFinite),
                                      child: Obx(() {
                                        // print(arg.teamNameOn);
                                        // rankingController.rankingTableModel.value.root?.table?.subt?[teamIndex].t?.length ?? 0,

                                        return rankingController.isLoading.value
                                            ? const Center(
                                                child: Loading(),
                                              )
                                            : rankingController.isSelectedType.value == 0
                                                ? fullView() ?? const SizedBox()
                                                : rankingController.isSelectedType.value == 1
                                                    ? shortView() ?? const SizedBox()
                                                    : formView() ?? const SizedBox();
                                      }),
                                    )
                                  : const Center(
                                      child: AppText(text: 'No Data Found', fontSize: 14),
                                    ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 7),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration:
                                          BoxDecoration(borderRadius: BorderRadius.circular(2), color: AppColors.green),
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
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(vertical: SizeUtils.verticalBlockSize * 30),
                            child: const Center(
                              child: AppText(
                                text: "No Data Available",
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
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
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, teamIndex) {
            Subt? subt = rankingController.rankingTableModel.value.root?.table?.subt?[teamIndex];
            int? index = rankingController.rankingTableModel.value.root?.table?.subt
                ?.indexWhere((element) => element.t?.map((e) => e.name).toString().contains(arg.teamNameOne!) ?? false);

            return index == teamIndex
                ? Padding(
                    padding: EdgeInsets.only(
                      bottom: SizeUtils.verticalBlockSize * 1.8,
                    ),
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColors.white, boxShadow: [
                        BoxShadow(color: AppColors.grey[90]!, blurRadius: 2),
                      ]),
                      child: Column(
                        children: [
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
                                      '#',
                                      style:
                                          TextStyle(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 14),
                                    )),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Pl',
                                    style:
                                        TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'GD',
                                    style:
                                        TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Pts',
                                    style:
                                        TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w500, fontSize: 14),
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
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    index1 == 0 || index1 == 1
                                        ? Container(
                                            width: 2.5,
                                            height: SizeUtils.verticalBlockSize * 6,
                                            decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.only(
                                                    topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
                                                color: AppColors.green[200]),
                                          )
                                        : const SizedBox(width: 2.5),
                                    Expanded(
                                      child: Container(
                                        height: SizeUtils.verticalBlockSize * 6,
                                        color: arg.teamNameOne ==
                                                    rankingController.rankingTableModel.value.root?.table
                                                        ?.subt?[teamIndex].t?[index1].name ||
                                                arg.teamNameTwo ==
                                                    rankingController.rankingTableModel.value.root?.table
                                                        ?.subt?[teamIndex].t?[index1].name
                                            ? AppColors.black.withOpacity(0.1)
                                            : AppColors.white,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 8,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: SizeUtils.horizontalBlockSize * 3,
                                                  ),
                                                  Text(
                                                    '${index1 + 1}',
                                                    style: const TextStyle(
                                                        color: AppColors.black,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14),
                                                  ),
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
                                                    rankingController.rankingTableModel.value.root?.table
                                                            ?.subt?[teamIndex].t?[index1].name ??
                                                        '',
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
                                                ' ${(int.parse(subt?.t?[index1].w ?? '0')) + (int.parse(subt?.t?[index1].d ?? '0')) + (int.parse(subt?.t?[index1].l ?? '0'))}',
                                                style: const TextStyle(
                                                    color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 13),
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
                                                    color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 13),
                                              ),
                                            ),
                                            SizedBox(width: SizeUtils.horizontalBlockSize * 1),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                rankingController.rankingTableModel.value.root?.table?.subt?[teamIndex]
                                                        .t?[index1].p ??
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
                  )
                : const SizedBox();
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
        physics: const AlwaysScrollableScrollPhysics(),
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
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColors.white, boxShadow: [
                      BoxShadow(color: AppColors.grey[90]!, blurRadius: 2),
                    ]),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: SizeUtils.verticalBlockSize * 2.3,
                            left: SizeUtils.horizontalBlockSize * 4,
                          ),
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 6,
                                child: Text(
                                  '#',
                                  style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Pl',
                                  // textAlign: TextAlign.center,
                                  style:
                                      TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'W',
                                  // textAlign: TextAlign.center,
                                  style:
                                      TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'D',
                                  // textAlign: TextAlign.center,
                                  style:
                                      TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'L',
                                  // textAlign: TextAlign.center,
                                  style:
                                      TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  '+/-',
                                  // textAlign: TextAlign.center,
                                  style:
                                      TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                              ),
                              SizedBox(width: SizeUtils.horizontalBlockSize * 2),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'GD',
                                  // textAlign: TextAlign.center,
                                  style:
                                      TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Pts',
                                  // textAlign: TextAlign.center,
                                  style:
                                      TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w500, fontSize: 14),
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
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: [
                                  index1 == 0 || index1 == 1
                                      ? Container(
                                          width: 2.5,
                                          height: SizeUtils.verticalBlockSize * 6,
                                          decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.only(
                                                  topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
                                              color: AppColors.green[200]),
                                        )
                                      : const SizedBox(width: 2.5),
                                  Expanded(
                                    child: Container(
                                      height: SizeUtils.verticalBlockSize * 6,
                                      color: arg.teamNameOne ==
                                                  rankingController.rankingTableModel.value.root?.table
                                                      ?.subt?[teamIndex].t?[index1].name ||
                                              arg.teamNameTwo ==
                                                  rankingController.rankingTableModel.value.root?.table
                                                      ?.subt?[teamIndex].t?[index1].name
                                          ? AppColors.black.withOpacity(0.1)
                                          : AppColors.white,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 7,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: SizeUtils.horizontalBlockSize * 3,
                                                ),
                                                Text(
                                                  '${index1 + 1}',
                                                  style: const TextStyle(
                                                      color: AppColors.black,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14),
                                                ),
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
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              '${subt?.t?[index1].g}-${subt?.t?[index1].hc}',
                                              // textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 13),
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
                )
              : const SizedBox();
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
          int? index = rankingController.rankingTableModel.value.root?.table?.subt
              ?.indexWhere((element) => element.t?.map((e) => e.name).toString().contains(arg.teamNameOne!) ?? false);

          return index == teamIndex
              ? Padding(
                  padding: EdgeInsets.only(
                    bottom: SizeUtils.verticalBlockSize * 1.8,
                  ),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColors.white, boxShadow: [
                      BoxShadow(color: AppColors.grey[90]!, blurRadius: 2),
                    ]),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: SizeUtils.verticalBlockSize * 2.3,
                            left: SizeUtils.horizontalBlockSize * 4,
                          ),
                          child: Row(
                            children: [
                              const Expanded(
                                  flex: 7,
                                  child: Text(
                                    // subt?.name.toString() ?? '',
                                    '#',
                                    style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 14),
                                  )),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'Last 5 matches',
                                  // textAlign: TextAlign.center,
                                  style:
                                      TextStyle(color: AppColors.grey[70], fontWeight: FontWeight.w500, fontSize: 14),
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
                                    print("teamForm===>${teamForm}");
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
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    children: [
                                      index1 == 0 || index1 == 1
                                          ? Container(
                                              width: 2.5,
                                              height: SizeUtils.verticalBlockSize * 6,
                                              decoration: BoxDecoration(
                                                  borderRadius: const BorderRadius.only(
                                                      topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
                                                  color: AppColors.green[200]),
                                            )
                                          : const SizedBox(width: 2.5),
                                      Expanded(
                                        child: Container(
                                          height: SizeUtils.verticalBlockSize * 6,
                                          color: arg.teamNameOne ==
                                                      rankingController.rankingTableModel.value.root?.table
                                                          ?.subt?[teamIndex].t?[index1].name ||
                                                  arg.teamNameTwo ==
                                                      rankingController.rankingTableModel.value.root?.table
                                                          ?.subt?[teamIndex].t?[index1].name
                                              ? AppColors.black.withOpacity(0.1)
                                              : AppColors.white,
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
                                                    Text(
                                                      '${index1 + 1}',
                                                      style: const TextStyle(
                                                          color: AppColors.black,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14),
                                                    ),
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
                                                    Transform(
                                                      transform: Matrix4.translationValues(0, 16, 0),
                                                      child: Column(
                                                        children: [
                                                          if (form?.wdlIndicators != null)
                                                            form?.wdlIndicators == ''
                                                                ? const SizedBox()
                                                                : Container(
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(4),
                                                                      color: form?.wdlIndicators?.toLowerCase() == 'd'
                                                                          ? AppColors.grey
                                                                          : form?.wdlIndicators?.toLowerCase() == 'w'
                                                                              ? AppColors.green
                                                                              : AppColors.red,
                                                                    ),
                                                                    child: Padding(
                                                                      padding: form?.wdlIndicators?.toLowerCase() == 'd'
                                                                          ? const EdgeInsets.symmetric(
                                                                              horizontal: 4, vertical: 2)
                                                                          : const EdgeInsets.symmetric(
                                                                              horizontal: 3, vertical: 2),
                                                                      child: AppText(
                                                                        text: form?.wdlIndicators?.toLowerCase() == 'l'
                                                                            ? ' L '
                                                                            : form?.wdlIndicators ?? "",
                                                                        color: AppColors.white,
                                                                        fontSize: 11,
                                                                      ),
                                                                    ),
                                                                  ),
                                                          const SizedBox(height: 2),
                                                          if (form?.wdlIndicators != null)
                                                            form?.wdlIndicators == ''
                                                                ? const SizedBox()
                                                                : Container(
                                                                    height: 2.5,
                                                                    width: 15.5,
                                                                    decoration: BoxDecoration(
                                                                        color: form?.wdlIndicators?.toLowerCase() == 'd'
                                                                            ? AppColors.grey
                                                                            : form?.wdlIndicators?.toLowerCase() == 'w'
                                                                                ? AppColors.green
                                                                                : AppColors.red,
                                                                        borderRadius: BorderRadius.circular(100)),
                                                                  ),
                                                        ],
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
                )
              : const SizedBox();
        },
      ),
    );
  }
}
