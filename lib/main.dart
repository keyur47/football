import 'dart:async';


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football/drawer/RegisterClassses.dart';
import 'package:football/firebase_options.dart';
import 'package:football/helper/shared_preferences.dart';
import 'package:football/utils/app_colors.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'fifa.dart';
import 'helper/firebase_analyticsUtils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ClassBuilder.registerClasses();
  await AppPreference.initSharedPreferences();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAnalyticsUtils.init();
  await MobileAds.instance.initialize();
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     systemNavigationBarColor: Colors.transparent,
  //     statusBarColor: AppColors.primaryColor,
  //   ),
  // );
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const FiFa());
}
