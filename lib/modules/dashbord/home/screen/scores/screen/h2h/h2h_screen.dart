import 'package:football/utils/app_colors.dart';
import 'package:football/utils/assets_path.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/widgets/app_text.dart';
import 'package:flutter/material.dart';

class HTWOHScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.horizontalBlockSize * 2,
          vertical: SizeUtils.horizontalBlockSize * 0.5,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeUtils.horizontalBlockSize * 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeUtils.horizontalBlockSize * 3,
                  horizontal: SizeUtils.horizontalBlockSize * 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AssetsPath.evenInjured,
                      width: SizeUtils.horizontalBlockSize * 5,
                    ),
                    AppText(
                      text: 'Season So Far',
                      color: AppColors.black,
                      fontSize: SizeUtils.fSize_13(),
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w500,
                    ),
                    Image.asset(
                      AssetsPath.evenInjured,
                      width: SizeUtils.horizontalBlockSize * 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 3),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.horizontalBlockSize * 4,
                ),
                child: const Divider(thickness: 1),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.horizontalBlockSize * 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(500)),
                            border: Border.all(color: AppColors.grey.withOpacity(0.2), style: BorderStyle.solid),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeUtils.horizontalBlockSize * 1,
                              vertical: SizeUtils.horizontalBlockSize * 1,
                            ),
                            child: Image.asset(
                              AssetsPath.evenInjured,
                              width: SizeUtils.horizontalBlockSize * 3,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: 'National North & South',
                              color: AppColors.black,
                              fontSize: SizeUtils.fSize_11(),
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                            ),
                            AppText(
                              text: '2022/2023',
                              color: AppColors.grey.withOpacity(0.5),
                              fontSize: SizeUtils.fSize_10(),
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: 'National North ',
                              color: AppColors.black,
                              fontSize: SizeUtils.fSize_11(),
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                            ),
                            AppText(
                              text: '2022/2023',
                              color: AppColors.grey.withOpacity(0.5),
                              fontSize: SizeUtils.fSize_10(),
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                        const SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(500)),
                            border: Border.all(color: AppColors.grey.withOpacity(0.2), style: BorderStyle.solid),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeUtils.horizontalBlockSize * 1,
                              vertical: SizeUtils.horizontalBlockSize * 1,
                            ),
                            child: Image.asset(
                              AssetsPath.evenInjured,
                              width: SizeUtils.horizontalBlockSize * 3,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.horizontalBlockSize * 4,
                ),
                child: const Divider(thickness: 1),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.horizontalBlockSize * 5,
                ),
                child: Container(
                  constraints: const BoxConstraints(maxHeight: double.maxFinite),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 2), color: AppColors.black.withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                              child: AppText(
                                text: '3',
                                color: AppColors.black,
                                fontSize: SizeUtils.fSize_12(),
                              ),
                            ),
                          ),
                          AppText(
                            text: 'shots on target',
                            color: AppColors.grey,
                            fontSize: SizeUtils.fSize_12(),
                          ),
                          AppText(
                            text: '3',
                            color: AppColors.black,
                            fontSize: SizeUtils.fSize_12(),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.horizontalBlockSize * 2.5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // color: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.only(right: SizeUtils.horizontalBlockSize * 4),
                        child: Row(
                          children: [
                            Image.asset(
                              AssetsPath.evenInjured,
                              width: SizeUtils.horizontalBlockSize * 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AppText(
                                text: '3 - 0',
                                color: AppColors.black,
                                fontSize: SizeUtils.fSize_12(),
                              ),
                            ),
                            Image.asset(
                              AssetsPath.evenInjured,
                              width: SizeUtils.horizontalBlockSize * 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                        left: SizeUtils.horizontalBlockSize * 0,
                        right: SizeUtils.horizontalBlockSize * 0,
                      ),
                      child: Container(
                        // color: Colors.pink,
                        child: AppText(
                          text: 'Biggest Win',
                          color: AppColors.grey,
                          fontSize: SizeUtils.fSize_12(),
                        ),
                      ),
                    ),
                    // const Spacer(),
                    Container(
                      // color: Colors.blue,
                      child: Row(
                        children: [
                          Image.asset(
                            AssetsPath.evenInjured,
                            width: SizeUtils.horizontalBlockSize * 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AppText(
                              text: '3 - 0',
                              color: AppColors.black,
                              fontSize: SizeUtils.fSize_12(),
                            ),
                          ),
                          Image.asset(
                            AssetsPath.evenInjured,
                            width: SizeUtils.horizontalBlockSize * 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
