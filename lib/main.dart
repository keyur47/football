import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football/drawer/RegisterClassses.dart';

import 'fifa.dart';
import 'helper/shared_preferences.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ClassBuilder.registerClasses();
  await AppPreference.initSharedPreferences();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const FiFa());
}














// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     const title = 'GeeksforGeeks';
//
//     return MaterialApp(
//       home: Scaffold(
//           body: CustomScrollView(
//         slivers: <Widget>[
//           SliverAppBar(
//             snap: false,
//             pinned: true,
//             floating: false,
//             flexibleSpace: const FlexibleSpaceBar(
//               centerTitle: true,
//               title: Text(title,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.0,
//                   ) //TextStyle
//                   ), //Text
//             ),
//             expandedHeight: 230,
//             backgroundColor: Colors.greenAccent[400],
//             leading: IconButton(
//               icon: const Icon(Icons.menu),
//               tooltip: 'Menu',
//               onPressed: () {},
//             ),
//             //IconButton
//           ), //SliverAppBar
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) => ListTile(
//                 tileColor: (index % 2 == 0) ? Colors.white : Colors.green[50],
//                 title: Center(
//                   child: Text('$index',
//                       style: TextStyle(
//                           fontWeight: FontWeight.normal, fontSize: 50, color: Colors.greenAccent[400]) //TextStyle
//                       ), //Text
//                 ), //Center
//               ), //ListTile
//               childCount: 51,
//             ), //SliverChildBuildDelegate
//           ) //SliverList
//         ], //<Widget>[]
//       )), //Scaffold
//       debugShowCheckedModeBanner: false,
//     ); //MaterialApp
//   }
// }
