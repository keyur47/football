import 'package:football/modules/dashbord/home/controller/home_controller.dart';
import 'package:football/modules/dashbord/home/screen/scores/controller/scores_tabbar_controller.dart';
import 'package:football/modules/dashbord/news/controller/news_controller.dart';
import 'package:football/modules/dashbord/ranking/controller/ranking_controller.dart';
import 'package:football/modules/dashbord/setting/setting_controller.dart';
import 'package:football/modules/splash/controller/splash_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
    Get.put<HomeController>(HomeController());
    Get.put<ScoresTabbarController>(ScoresTabbarController());
    Get.put<NewsController>(NewsController());
    Get.put<RankingController>(RankingController());
    Get.put<SettingController>(SettingController());
  }
}
