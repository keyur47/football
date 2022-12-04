// import 'package:football/ads/open_ad.dart';
// import 'package:football/helper/firebase_analyticsUtils.dart';
// import 'package:football/modules/dashbord/home/screen/home_screen.dart';
// import 'package:football/modules/dashbord/news/screen/news_screen.dart';
// import 'package:football/modules/dashbord/ranking/screen/ranking_screen.dart';
// import 'package:football/utils/app_colors.dart';
// import 'package:football/utils/size_utils.dart';
// import 'package:football/utils/strings_utils.dart';
// import 'package:flutter/material.dart';
//
// class DashBordScreen extends StatefulWidget {
//   const DashBordScreen({Key? key}) : super(key: key);
//
//   @override
//   State<DashBordScreen> createState() => _DashBordScreenState();
// }
//
// class _DashBordScreenState extends State<DashBordScreen> with WidgetsBindingObserver {
//   bool isPaused = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     FirebaseAnalyticsUtils.sendCurrentScreen(FirebaseAnalyticsUtils.dashboardScreen);
//     WidgetsBinding.instance.addObserver(this);
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     WidgetsBinding.instance.removeObserver(this);
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     // TODO: implement didChangeAppLifecycleState
//
//     super.didChangeAppLifecycleState(state);
//     if (state == AppLifecycleState.paused) {
//       isPaused = true;
//       print("------AppLifecycleState---1-->$state");
//     }
//     if (state == AppLifecycleState.inactive && isPaused) {
//       print("------AppLifecycleState---2->$state");
//       AppOpenAdManager.showOpenAdIfAvailable();
//       isPaused = false;
//     }
//   }
//
//   final widgetOptions = [
//     HomeScreen(),
//     NewsScreen(),
//     RankingScreen(),
//     // MoreScreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Container(
//         color: AppColors.white[40],
//         child: Padding(
//           padding: EdgeInsets.only(
//             right: SizeUtils.horizontalBlockSize * 2,
//             left: SizeUtils.horizontalBlockSize * 0,
//           ),
//           child: BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             showUnselectedLabels: true,
//             backgroundColor: AppColors.white[40],
//             elevation: 0,
//             selectedFontSize: SizeUtils.fSize_12(),
//             unselectedFontSize: SizeUtils.fSize_12(),
//             unselectedItemColor: AppColors.grey.withOpacity(0.8),
//             unselectedLabelStyle: TextStyle(
//               fontSize: SizeUtils.fSize_14(),
//               fontWeight: FontWeight.w400,
//               color: AppColors.white,
//             ),
//             selectedLabelStyle: TextStyle(
//               fontSize: SizeUtils.fSize_14(),
//               fontWeight: FontWeight.w500,
//               color: AppColors.white,
//             ),
//             currentIndex: StringsUtils.bottomIndex.value,
//             fixedColor: AppColors.primaryColor,
//             onTap: onItemTapped,
//             items: <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.only(
//                     bottom: SizeUtils.horizontalBlockSize * 1,
//                     top: SizeUtils.horizontalBlockSize * 0,
//                   ),
//                   child: Icon(
//                     Icons.home,
//                     size: SizeUtils.verticalBlockSize * 3.3,
//                   ),
//                 ),
//                 label: StringsUtils.home,
//               ),
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.only(
//                     bottom: SizeUtils.horizontalBlockSize * 1,
//                     top: SizeUtils.horizontalBlockSize * 0,
//                   ),
//                   child: Icon(
//                     Icons.newspaper_rounded,
//                     size: SizeUtils.verticalBlockSize * 3.3,
//                   ),
//                 ),
//                 label: StringsUtils.news,
//               ),
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.only(
//                     bottom: SizeUtils.horizontalBlockSize * 1,
//                     top: SizeUtils.horizontalBlockSize * 0,
//                   ),
//                   child: Icon(
//                     Icons.auto_graph,
//                     size: SizeUtils.verticalBlockSize * 3.3,
//                   ),
//                 ),
//                 label: StringsUtils.ranking,
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: IndexedStack(
//         index: StringsUtils.bottomIndex.value,
//         children: widgetOptions.map((e) => e).toList(),
//       ),
//     );
//   }
//
//   void onItemTapped(int index) {
//     setState(() {
//       StringsUtils.bottomIndex.value = index;
//     });
//   }
// }
