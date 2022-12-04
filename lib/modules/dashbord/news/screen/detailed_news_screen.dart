import 'package:football/ads/banner_ad.dart';
import 'package:football/helper/loading_helper.dart';
import 'package:football/modules/dashbord/news/controller/news_controller.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/assets_path.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/utils/strings_utils.dart';
import 'package:football/widgets/app_text.dart';
import 'package:football/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

class DetailedNews extends StatefulWidget {
  const DetailedNews({Key? key}) : super(key: key);

  @override
  State<DetailedNews> createState() => _DetailedNewsState();
}

class _DetailedNewsState extends State<DetailedNews> {
  final NewsController newsController = Get.find();
  dynamic index;
  @override
  void initState() {
    index = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //index[0]["index"]
    return Scaffold(
      bottomSheet: const BannerAdView(),
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        leadingWidth: SizeUtils.horizontalBlockSize * 8,
        title: const AppText(
          text: StringsUtils.news,
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
        leading: Padding(
          padding: EdgeInsets.only(
            left: SizeUtils.horizontalBlockSize * 4,
          ),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => newsController.isNewsLoading.value
                ? const Loading()
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 5),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            color: Colors.deepOrange,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                              child: AppText(
                                text: StringsUtils.worldCup,
                                color: AppColors.white,
                                fontSize: SizeUtils.fSize_10(),
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                                letterSpacing: 0.7,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 2),
                          child: Column(
                            children: [
                              AppText(
                                text: newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.title ?? '',
                                color: AppColors.black,
                                fontSize: SizeUtils.fSize_22(),
                                fontWeight: FontWeight.w600,
                                height: 1.2,
                                letterSpacing: 0.7,
                              ),
                              SizedBox(height: SizeUtils.horizontalBlockSize * 5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Image.asset(
                                  //   AssetsPath.blackCircle,
                                  //   width: SizeUtils.horizontalBlockSize * 4,
                                  // ),
                                  // const SizedBox(width: 5),
                                  // AppText(
                                  //   text: 'FotMob',
                                  //   color: AppColors.black,
                                  //   fontSize: SizeUtils.fSize_10(),
                                  //   height: 1.5,
                                  //   letterSpacing: 0.5,
                                  //   fontWeight: FontWeight.w600,
                                  // ),
                                  // const SizedBox(width: 5),
                                  // AppText(
                                  //   text: '-',
                                  //   color: AppColors.black,
                                  //   fontSize: SizeUtils.fSize_10(),
                                  //   height: 1.5,
                                  //   letterSpacing: 0.5,
                                  //   fontWeight: FontWeight.w600,
                                  // ),
                                  // const SizedBox(width: 3),
                                  AppText(
                                    text: newsController.dateFormat(newsController
                                            .newsData.value.hits?.hits?[index[0]["index"]].source?.dateUpdated ??
                                        DateTime.now()),
                                    color: AppColors.black.withOpacity(0.5),
                                    fontSize: SizeUtils.fSize_14(),
                                    height: 1.5,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: SizeUtils.horizontalBlockSize * 1.8),
                        SizedBox(
                          height: SizeUtils.horizontalBlockSize * 60,
                          width: double.infinity,
                          child: FadeInImage.assetNetwork(
                            // placeholderCacheWidth: 400,
                            placeholder: AssetsPath.appLogo,
                            placeholderFit: BoxFit.none,
                            fit: BoxFit.cover,
                            image: newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.imageUrl ?? '',
                          ),
                        ),
                        const SizedBox(height: 18),
                        newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.content != null
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: AppText(
                                  text: newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.content ??
                                      '',
                                  color: AppColors.black.withOpacity(0.5),
                                  fontSize: SizeUtils.fSize_9(),
                                  height: 1.5,
                                  letterSpacing: 0.5,
                                  // fontWeight: FontWeight.w500,
                                ),
                              )
                            : const SizedBox(),
                        Divider(
                          thickness: 0.8,
                          color: AppColors.black.withOpacity(0.3),
                        ),
                        const SizedBox(height: 8),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Image.asset(
                        //       AssetsPath.blackCircle,
                        //       width: SizeUtils.horizontalBlockSize * 4,
                        //     ),
                        //     // const SizedBox(width: 5),
                        //     // AppText(
                        //     //   text: 'FotMob',
                        //     //   color: AppColors.black,
                        //     //   fontSize: SizeUtils.fSize_10(),
                        //     //   height: 1.5,
                        //     //   letterSpacing: 0.5,
                        //     //   fontWeight: FontWeight.w600,
                        //     // ),
                        //     const SizedBox(width: 5),
                        //     // AppText(
                        //     //   text: '-',
                        //     //   color: AppColors.black,
                        //     //   fontSize: SizeUtils.fSize_10(),
                        //     //   height: 1.5,
                        //     //   letterSpacing: 0.5,
                        //     //   fontWeight: FontWeight.w600,
                        //     // ),
                        //     const SizedBox(width: 3),
                        //     AppText(
                        //       text: newsController
                        //           .dateFormat(newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.dateUpdated ?? DateTime.now()),
                        //       color: AppColors.black,
                        //       fontSize: SizeUtils.fSize_10(),
                        //       height: 1.5,
                        //       letterSpacing: 0.5,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(height: 18),
                        // newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.content != null
                        //     ? AppText(
                        //         text: newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.content ?? '',
                        //         color: AppColors.black,
                        //         fontSize: SizeUtils.fSize_14(),
                        //         height: 1.8,
                        //         letterSpacing: 0.5,
                        //         fontWeight: FontWeight.w600,
                        //       )
                        //     : const SizedBox(),
                        // newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.content != null
                        //     ? const SizedBox(height: 18)
                        //     : const SizedBox(),
                        AppText(
                          text: parse(newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.summary ??
                                  newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.title)
                              .documentElement!
                              .text,
                          color: AppColors.black,
                          fontSize: SizeUtils.fSize_14(),
                          height: 1.5,
                          letterSpacing: 0.5,
                          // fontWeight: FontWeight.w400,
                        ),
                        isBannerLoaded.value == true
                            ? const SizedBox(
                                height: 63,
                                width: double.infinity,
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
