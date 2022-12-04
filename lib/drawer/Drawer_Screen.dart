import 'package:flutter/material.dart';
import 'package:football/modules/dashbord/home/screen/home_screen.dart';
import 'package:football/modules/dashbord/news/screen/news_screen.dart';
import 'package:football/modules/dashbord/ranking/screen/ranking_screen.dart';
import 'package:football/modules/dashbord/setting/setting_screen.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/assets_path.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/utils/strings_utils.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'RegisterClassses.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> with SingleTickerProviderStateMixin {
  late KFDrawerController _drawerController;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('HomeScreen'),
      items: [
        KFDrawerItem.initWithPage(
          text: const Text(
            StringsUtils.score,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18,
            ),
          ),
          icon: const Icon(
            Icons.scoreboard_rounded,
            color: AppColors.white,
            size: 28,
          ),
          page: HomeScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            StringsUtils.news,
            style: TextStyle(
              color: AppColors.white,
              // fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          icon: const Icon(
            Icons.newspaper,
            size: 28,
            color: AppColors.white,
          ),
          page: NewsScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            StringsUtils.ranking,
            style: TextStyle(
              color: AppColors.white,
              // fontWeight: FontWeight.w600,

              fontSize: 18,
            ),
          ),
          icon: const Icon(
            Icons.bar_chart,
            color: AppColors.white,
            size: 28,
          ),
          page: RankingScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            StringsUtils.setting,
            style: TextStyle(
              color: AppColors.white,
              // fontWeight: FontWeight.w600,

              fontSize: 18,
            ),
          ),
          icon: const Icon(
            Icons.settings,
            color: AppColors.white,
            size: 28,
          ),
          page: SettingScreen(),
        ),
      ],
    );
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    )..repeat();
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        // menuPadding: EdgeInsets.all(50),
        // scrollable: true,
        controller: _drawerController,
        header: Padding(
          padding: const EdgeInsets.only(right: 250),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              width: MediaQuery.of(context).size.width * 0.6,
              child: Padding(
                padding: EdgeInsets.only(right: 50.0),
                child: Column(
                  children: <Widget>[
                    RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                      child: Image.asset(
                        AssetsPath.football,
                      ),
                    ),
                    SizedBox(
                      height: SizeUtils.horizontalBlockSize * 5,
                    ),
                    // Container(
                    //     color: Colors.white,
                    //     child: Lottie.asset("assets/lottie/lottie_fifa.json")),
                  ],
                ),
              ),
            ),
          ),
        ),
        // footer: KFDrawerItem(
        //   text: Text(
        //     'Logout',
        //     style: TextStyle(
        //       color: Colors.white54,
        //       fontSize: 18,
        //     ),
        //   ),
        //   icon: Icon(Icons.logout, color: Colors.white54),
        //   onPressed: () {},
        // ),
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [
        //       Color.fromRGBO(255, 255, 255, 1.0),
        //       Color.fromRGBO(121, 20, 53, 1.0),
        //     ],
        //     tileMode: TileMode.repeated,
        //   ),
        // ),
        decoration: const BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(0, 1),
          //     blurRadius: 5,
          //     color: Colors.black.withOpacity(0.3),
          //   ),
          // ],
          // FCF6F5FF
          // borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 3),
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
