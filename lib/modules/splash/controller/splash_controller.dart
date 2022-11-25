import 'package:football/utils/navigation_utils/navigation.dart';
import 'package:football/utils/navigation_utils/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    // AppOpenAdManager.loadAd();
    // InterstitalAd.createInterstitialAd();
    await Future.delayed(
      const Duration(seconds: 1),
    );
    // AppSharedPreference.userToken == null ?
    // Navigation.popAndPushNamed(Routes.signInScreen);:
    Navigation.popAndPushNamed(Routes.drawerScreen);
  }
}
