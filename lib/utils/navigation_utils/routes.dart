import 'package:football/drawer/Drawer_Screen.dart';
import 'package:football/modules/dashbord/dashbord_screen.dart';
import 'package:football/modules/dashbord/home/screen/home_screen.dart';
import 'package:football/modules/dashbord/home/screen/scores/screen/lineup/lineup_screen.dart';
import 'package:football/modules/dashbord/home/screen/scores/screen/scores_tabbar_screen.dart';
import 'package:football/modules/dashbord/home/screen/scores/screen/stats/player_detail_screen.dart';
import 'package:football/modules/dashbord/more/screen/more_screen.dart';
import 'package:football/modules/dashbord/news/screen/detailed_news_screen.dart';
import 'package:football/modules/dashbord/news/screen/news_screen.dart';
import 'package:football/modules/dashbord/ranking/screen/ranking_screen.dart';
import 'package:football/modules/splash/screen/splash_screen.dart';
import 'package:get/get.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;

  // get started
  static const String splash = '/splash';
  static const String dashBordScreen = '/dashBordScreen';
  static const String drawerScreen = '/drawerScreen';
  static const String homeScreen = '/homeScreen';
  static const String scoresScreen = '/scoresScreen';
  static const String newsScreen = '/newsScreen';
  static const String rankingScreen = '/rankingScreen';
  static const String moreScreen = '/moreScreen';
  static const String detailedNews = '/detailedNews';
  static const String lineUpScreen = '/lineUpScreen';
  static const String playerDetailScreen = '/playerDetailScreen';

  static List<GetPage<dynamic>> routes = [
    GetPage<dynamic>(
      name: splash,
      page: () => const SplashScreen(),
      transition: defaultTransition,
    ),
    // GetPage<dynamic>(
    //   name: dashBordScreen,
    //   page: () => const DashBordScreen(),
    //   transition: defaultTransition,
    // ),
    GetPage<dynamic>(
      name: homeScreen,
      page: () => HomeScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: scoresScreen,
      page: () => ScoresScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: drawerScreen,
      page: () => DrawerScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: newsScreen,
      page: () => NewsScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: rankingScreen,
      page: () => RankingScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: moreScreen,
      page: () => MoreScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: detailedNews,
      page: () => DetailedNews(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: lineUpScreen,
      page: () => LineUpScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: playerDetailScreen,
      page: () => PlayerDetailScreen(),
      transition: defaultTransition,
    ),
  ];
}
