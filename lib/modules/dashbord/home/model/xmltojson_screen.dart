// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:fifa_app/modules/dashbord/home/model/Fixture_model.dart';
// import 'package:fifa_app/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:xml2json/xml2json.dart';
//
// class XmlToJsonscreen extends StatefulWidget {
//   XmlToJsonscreen({Key? key}) : super(key: key);
//
//   @override
//   State<XmlToJsonscreen> createState() => _XmlToJsonscreenState();
// }
//
// class _XmlToJsonscreenState extends State<XmlToJsonscreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       appBar: AppBar(title: const Text("FixtureApi")),
//       body: Center(
//         child: Column(
//           children: [
//             Center(
//               child: ElevatedButton(onPressed: () async {}, child: const Text("Convert")),
//             ),
//             Expanded(
//               child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: combileTemes.length,
//                   itemBuilder: (context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Text("--------$index--------"),
//                           Text("Team 1:- ${combileTemes[index].team1?.teamName}"),
//                           Text("Team 2:- ${combileTemes[index].team2?.teamName}"),
//                           Text("Time 2:- ${combileTemes[index].time}"),
//                         ],
//                       ),
//                     );
//                   }),
//             )
//           ],
//         ),
//       ),
//     ));
//   }
// }
