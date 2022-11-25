import 'package:football/modules/dashbord/more/controller/more_controller.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/navigation_utils/routes.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/utils/strings_utils.dart';
import 'package:football/widgets/app_text.dart';
import 'package:football/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreScreen extends StatelessWidget {
  final MoreController moreController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        title: const AppText(
          text: StringsUtils.more,
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
        // action: [
        //   IconButton(
        //     icon: const Icon(
        //       Icons.more_vert_sharp,
        //       color: AppColors.white,
        //     ),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Divider(
            height: SizeUtils.verticalBlockSize * 1,
            color: AppColors.grey.withOpacity(0.4),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.horizontalBlockSize * 2, vertical: SizeUtils.horizontalBlockSize * 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.lineUpScreen);
                  },
                  child: CircleAvatar(
                    radius: SizeUtils.verticalBlockSize * 2.8,
                    backgroundColor: AppColors.profileColor,
                    child: const Icon(
                      Icons.person,
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeUtils.horizontalBlockSize * 5,
                ),
                SizedBox(
                  width: SizeUtils.horizontalBlockSize * 77,
                  child: AppText(
                    text: StringsUtils.profileText,
                    fontWeight: FontWeight.w500,
                    // maxLines: 2,
                    color: AppColors.lightGrey,
                    fontSize: SizeUtils.fSize_16(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: SizeUtils.horizontalBlockSize * 18.5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AppText(
                text: StringsUtils.signInCapital,
                fontWeight: FontWeight.w500,
                color: AppColors.green,
                fontSize: SizeUtils.fSize_14(),
              ),
            ),
          ),
          Divider(
            height: SizeUtils.verticalBlockSize * 7,
            color: AppColors.grey.withOpacity(0.4),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: moreController.moreList.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: SizeUtils.verticalBlockSize * 1, horizontal: SizeUtils.horizontalBlockSize * 5),
                  leading: CircleAvatar(
                    backgroundColor: moreController.moreList[index].color,
                    radius: SizeUtils.verticalBlockSize * 2.7,
                    child: moreController.moreList[index].icon,
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(
                      bottom: SizeUtils.verticalBlockSize * 0.5,
                    ),
                    child: AppText(
                      text: "${moreController.moreList[index].title}",
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                      fontSize: SizeUtils.fSize_16(),
                    ),
                  ),
                  subtitle: moreController.moreList[index].subtitle!.isEmpty
                      ? null
                      : AppText(
                          text: "${moreController.moreList[index].subtitle}",
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightGrey,
                          fontSize: SizeUtils.fSize_14(),
                        ),
                );
              })
        ],
      ),
    );
  }
}
