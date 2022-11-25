import 'dart:core';

import 'package:football/modules/dashbord/home/controller/home_controller.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopPlayerList extends StatelessWidget {
  final String lLetter;
  final String lRating;
  final String lImage;
  final String lName;
  final String rLetter;
  final String rRating;
  final String rImage;
  final Color lColor;
  final Color rColor;
  final String rName;

  TopPlayerList({
    Key? key,
    required this.lLetter,
    required this.lRating,
    required this.lColor,
    required this.rColor,
    required this.lImage,
    required this.rLetter,
    required this.rRating,
    required this.rImage,
    required this.lName,
    required this.rName,
  }) : super(key: key);

  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: SizeUtils.horizontalBlockSize * 10,
                      width: SizeUtils.horizontalBlockSize * 10,
                      decoration: BoxDecoration(
                        color: AppColors.white[80],
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          lLetter.split(" ").last.substring(0, 1),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: SizeUtils.fSize_12(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 2,
                    right: 7,
                    child: Container(
                      height: SizeUtils.horizontalBlockSize * 4,
                      width: SizeUtils.horizontalBlockSize * 6.7,
                      decoration: BoxDecoration(
                        color: lColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          lRating,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: SizeUtils.fSize_8(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 7,
                    left: 6,
                    child: Container(
                      height: SizeUtils.horizontalBlockSize * 4,
                      width: SizeUtils.horizontalBlockSize * 4,
                      decoration: BoxDecoration(
                        color: AppColors.green[200],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            lImage,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: SizeUtils.horizontalBlockSize * 2,
              ),
              SizedBox(
                width: SizeUtils.horizontalBlockSize * 20,
                child: Text(
                  lName.split(" ").last,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: SizeUtils.fSize_13(),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: SizeUtils.horizontalBlockSize * 20,
              child: Text(
                rName.split(" ").last,
                maxLines: 2,
                style: TextStyle(
                  fontSize: SizeUtils.fSize_13(),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              width: SizeUtils.horizontalBlockSize * 2,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: SizeUtils.horizontalBlockSize * 10,
                    width: SizeUtils.horizontalBlockSize * 10,
                    decoration: BoxDecoration(
                      color: AppColors.white[80],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        rLetter.split(" ").last.substring(0, 1),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: SizeUtils.fSize_12(),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 2,
                  right: 7,
                  child: Container(
                    height: SizeUtils.horizontalBlockSize * 4,
                    width: SizeUtils.horizontalBlockSize * 6.7,
                    decoration: BoxDecoration(
                      color: rColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        rRating,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: SizeUtils.fSize_10(),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 7,
                  right: 7,
                  child: Container(
                    height: SizeUtils.horizontalBlockSize * 4,
                    width: SizeUtils.horizontalBlockSize * 4,
                    decoration: BoxDecoration(
                      // color: color,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          rImage,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // colorTeamOneType(int? type) {
  //   switch (type) {
  //     case 7:
  //       return Colors.green;
  //       break;
  //     case 8:
  //       return Colors.green;
  //       break;
  //     case 9:
  //       return Colors.blue;
  //       break;
  //     default:
  //       return Colors.orange;
  //   }
  // }
}
