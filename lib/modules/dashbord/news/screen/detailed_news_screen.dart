import 'package:football/helper/loading_helper.dart';
import 'package:football/modules/dashbord/news/controller/news_controller.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/assets_path.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:share_plus/share_plus.dart';

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
    print(index[0]["index"]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //index[0]["index"]
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => newsController.isNewsLoading.value
                ? const Loading()
                : Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: SizeUtils.horizontalBlockSize * 60,
                            width: double.infinity,
                            child: FadeInImage.assetNetwork(
                              // placeholderCacheWidth: 400,
                              placeholder: AssetsPath.appLogo,
                              placeholderFit: BoxFit.none,
                              fit: BoxFit.fitWidth,
                              image:
                                  newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.imageUrl ?? '',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeUtils.horizontalBlockSize * 3,
                                vertical: SizeUtils.horizontalBlockSize * 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.shareUri !=
                                        null) {
                                      Share.share(newsController
                                              .newsData.value.hits?.hits?[index[0]["index"]].source?.shareUri ??
                                          "");
                                    }
                                  },
                                  child: const Icon(
                                    Icons.share,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeUtils.horizontalBlockSize * 5, vertical: SizeUtils.horizontalBlockSize * 3),
                        child: Column(
                          children: [
                            AppText(
                              text: newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.title ?? '',
                              color: AppColors.black,
                              fontSize: SizeUtils.fSize_20(),
                              fontWeight: FontWeight.w800,
                              height: 1.3,
                              letterSpacing: 0.5,
                            ),
                            const SizedBox(height: 15),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AssetsPath.blackCircle,
                                  width: SizeUtils.horizontalBlockSize * 5,
                                ),
                                // const SizedBox(width: 5),
                                // AppText(
                                //   text: 'FotMob',
                                //   color: AppColors.black,
                                //   fontSize: SizeUtils.fSize_10(),
                                //   height: 1.5,
                                //   letterSpacing: 0.5,
                                //   fontWeight: FontWeight.w600,
                                // ),
                                const SizedBox(width: 5),
                                // AppText(
                                //   text: '-',
                                //   color: AppColors.black,
                                //   fontSize: SizeUtils.fSize_10(),
                                //   height: 1.5,
                                //   letterSpacing: 0.5,
                                //   fontWeight: FontWeight.w600,
                                // ),
                                const SizedBox(width: 5),
                                AppText(
                                  text: newsController.dateFormat(newsController
                                          .newsData.value.hits?.hits?[index[0]["index"]].source?.dateUpdated ??
                                      DateTime.now()),
                                  color: AppColors.black,
                                  fontSize: SizeUtils.fSize_10(),
                                  height: 1.5,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.content != null
                                ? AppText(
                                    text:
                                        newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.content ??
                                            '',
                                    color: AppColors.black,
                                    fontSize: SizeUtils.fSize_14(),
                                    height: 1.5,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w600,
                                  )
                                : const SizedBox(),
                            newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.content != null
                                ? const SizedBox(height: 15)
                                : const SizedBox(),
                            AppText(
                              text: parse(
                                      newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.summary ??
                                          newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.title)
                                  .documentElement!
                                  .text,
                              color: AppColors.black,
                              fontSize: SizeUtils.fSize_14(),
                              height: 1.5,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}