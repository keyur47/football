import 'package:football/modules/dashbord/more/model/more_model.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/strings_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreController extends GetxController {
  List<MoreModel> moreList = <MoreModel>[
    MoreModel(
        icon: const Icon(Icons.compare_arrows_sharp, color: AppColors.white),
        title: StringsUtils.transferCenter,
        subtitle: "",
        color: AppColors.transferColor),
    MoreModel(
      icon: const Icon(Icons.tv, color: AppColors.white),
      title: StringsUtils.tvSchedule,
      subtitle: "India",
      color: AppColors.tvColor,
    ),
    MoreModel(
      icon: const Icon(Icons.sports_football, color: AppColors.white),
      title: StringsUtils.fotMobSupportersClub,
      subtitle: StringsUtils.removeAds,
      color: AppColors.fotMobColor,
    ),
    MoreModel(
      icon: const Icon(Icons.settings, color: AppColors.white),
      title: StringsUtils.settings,
      subtitle: "",
      color: AppColors.settingColor,
    ),
  ];
}
