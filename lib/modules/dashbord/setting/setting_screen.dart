import 'dart:developer';

import 'package:app_settings/app_settings.dart';
import 'package:football/ads/banner_ad.dart';
import 'package:football/drawer/Drawer_Screen.dart';
import 'package:football/helper/shared_preferences.dart';
import 'package:football/helper/toast_helper.dart';
import 'package:football/modules/dashbord/setting/setting_controller.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/assets_path.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/utils/strings_utils.dart';
import 'package:football/widgets/app_text.dart';
import 'package:football/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends KFDrawerContent {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with WidgetsBindingObserver {
  final InAppReview inAppReview = InAppReview.instance;
  final SettingController settingController = Get.find();

  Permission _permission = Permission.notification;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        log("app is 0 ${AppLifecycleState.resumed}");
        await grantedPermission();
        break;
      case AppLifecycleState.inactive:
        await grantedPermission();
        log("app in inactive"); //app in background
        break;
      case AppLifecycleState.paused:
        log("app is 0 ${AppLifecycleState.paused}");
        break;
      case AppLifecycleState.detached:
        log("app is 0 ${AppLifecycleState.detached}");
        break;
    }
  }

  Future<void> grantedPermission() async {
    _permission = Permission.notification;
    final status = await _permission.isGranted;
    settingController.isNotificationCheck.value = status;
    print("status0--$status");
    AppPreference.setNotification(notification: settingController.isNotificationCheck.value);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        bottomSheet: const BannerAdView(),
        backgroundColor: AppColors.grey.withOpacity(0.1),
        appBar: CustomAppBar(
          appBarSize: SizeUtils.horizontalBlockSize * 14,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsets.only(
              left: SizeUtils.horizontalBlockSize * 0,
            ),
            child: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu_rounded),
                onPressed: widget.onMenuPressed,
              ),
            ),
          ),
          title: AppText(
            color: AppColors.white,
            text: StringsUtils.setting,
            fontWeight: FontWeight.w600,
            fontSize: SizeUtils.fSize_20(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeUtils.horizontalBlockSize * 2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              itemBox(
                width: SizeUtils.horizontalBlockSize * 6,
                onTap: () async {
                  await _launchUrl();
                },
                title: StringsUtils.privacy,
                icon: AssetsPath.Privacy,
              ),
              itemBox(
                width: SizeUtils.horizontalBlockSize * 6,
                onTap: () {},
                title: StringsUtils.upgrade,
                icon: AssetsPath.upgrade,
              ),
              itemBox(
                width: SizeUtils.horizontalBlockSize * 8,
                onTap: () async {
                  if (await inAppReview.isAvailable()) {
                    inAppReview.requestReview();
                  } else {
                    AppToast.toastMessage("app review not available at time.");
                  }
                },
                title: StringsUtils.documentTitle,
                subTitle: StringsUtils.documentSubTile,
                icon: AssetsPath.star,
              ),
              itemBox(
                width: SizeUtils.horizontalBlockSize * 6,
                onTap: () async {
                  settingController.shareNoteLink(title: StringsUtils.InviteFriends);
                },
                title: StringsUtils.InviteFriends,
                icon: AssetsPath.invite,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onBackPressed() {
    return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return DrawerScreen();
      },
    ), (route) => false).then((value) => value ?? false);
  }

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse('https://pages.flycricket.io/football-live-score-6/privacy.html');

    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  Widget itemBox({
    String? title,
    double? width,
    String? subTitle,
    String? icon,
    GestureTapCallback? onTap,
  }) {
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeUtils.horizontalBlockSize * 1,
          // horizontal: SizeUtils.horizontalBlockSize * 1.7,
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            elevation: 2,
            margin: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: SizeUtils.horizontalBlockSize * 1.6,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "${icon}",
                    color: AppColors.primaryColor,
                    width: width,
                  ),
                ),
                SizedBox(
                  width: SizeUtils.horizontalBlockSize * 1.4,
                ),
                Expanded(
                  child: AppText(
                    text: "$title",
                    fontWeight: FontWeight.w500,
                    fontSize: SizeUtils.fSize_15(),
                  ),
                ),
                SizedBox(
                  width: SizeUtils.horizontalBlockSize * 1.4,
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: AppColors.primaryColor,
                  size: SizeUtils.horizontalBlockSize * 4,
                ),
                SizedBox(
                  width: SizeUtils.horizontalBlockSize * 4.4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// ListTile(
//   horizontalTitleGap: SizeUtils.horizontalBlockSize * -1,
//   visualDensity: const VisualDensity(vertical: -3),
//   leading: Icon(
//     Icons.notifications,
//     color: AppColors.primaryColor,
//     size: SizeUtils.horizontalBlockSize * 8,
//   ),
//   title: Padding(
//     padding: EdgeInsets.symmetric(
//       horizontal: SizeUtils.horizontalBlockSize * 2,
//     ),
//     child: AppText(
//       text:  StringsUtils.notification,
//       fontWeight: FontWeight.w500,
//       fontSize: SizeUtils.fSize_15(),
//     ),
//   ),
//   trailing: Obx(
//         () => Switch(
//       activeColor: AppColors.primaryColor,
//       value: settingController.isNotificationCheck.value,
//       onChanged: (value) {
//         AppSettings.openNotificationSettings();
//       },
//     ),
//   ),
// ),
