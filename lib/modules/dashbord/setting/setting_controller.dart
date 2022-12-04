import 'dart:io';

import 'package:flutter_share/flutter_share.dart';
import 'package:football/helper/shared_preferences.dart';
import 'package:football/model/settings_model.dart';
import 'package:football/utils/strings_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  RxBool isNotificationCheck = false.obs;

  List item = [
    SettingsData(
      icon: Icons.account_circle_outlined,
      name: StringsUtils.account,
    ),
    SettingsData(
      icon: Icons.privacy_tip_outlined,
      name: StringsUtils.privacy,
    ),
    SettingsData(
      icon: Icons.help,
      name: StringsUtils.help,
    ),
    SettingsData(
      icon: Icons.info,
      name: StringsUtils.about,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    isNotificationCheck.value = AppPreference.notification;
  }

  Future<void> shareNoteLink({required String title}) async {
    try {
      await FlutterShare.share(
        title: StringsUtils.InviteFriends,
        text: "FootBall Live Score 2022",
        linkUrl: Platform.isAndroid ? '' : "",
        chooserTitle: 'WhatsApp Tool',
      );
    } finally {}
  }
}
