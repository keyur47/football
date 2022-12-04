import 'package:cached_network_image/cached_network_image.dart';
import 'package:football/ads/interstitial_ad.dart';
import 'package:football/helper/firebase_analyticsUtils.dart';
import 'package:football/helper/loading_helper.dart';
import 'package:football/modules/dashbord/news/controller/news_controller.dart';
import 'package:football/modules/dashbord/news/screen/news_web_view.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/assets_path.dart';
import 'package:football/utils/navigation_utils/routes.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/utils/strings_utils.dart';
import 'package:football/widgets/app_text.dart';
import 'package:football/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_drawer/kf_drawer.dart';


class NewsScreen extends KFDrawerContent {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final NewsController newsController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    FirebaseAnalyticsUtils.sendCurrentScreen(FirebaseAnalyticsUtils.newsScreen);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey.withOpacity(0.1),
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        leadingWidth: SizeUtils.horizontalBlockSize * 8,
        leading: Builder(
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                top: SizeUtils.horizontalBlockSize * 0.4,
                left: SizeUtils.horizontalBlockSize * 3,

              ),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  size: SizeUtils.horizontalBlockSize * 5.5,
                ),
                onPressed: widget.onMenuPressed,
              ),
            );
          },
        ),
        title: AppText(
          text: StringsUtils.news,
          color: AppColors.white,
          fontWeight: FontWeight.w500,
          fontSize: SizeUtils.fSize_18(),
        ),
      ),
      body: RefreshIndicator(
        color: Colors.black,
        backgroundColor: Colors.white,

        onRefresh: () async {
          await newsController.getNewsData();
        },
        // notificationPredicate: (ScrollNotification notification) {
        //   return notification.depth == 1;
        // },
        child: Obx(
          () => newsController.isNewsLoading.value
              ? const Loading()
              : ListView.separated(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeUtils.horizontalBlockSize * 1.5,
                  ),
                  itemCount: newsController.newsData.value.hits?.hits?.length ?? 0,
                  separatorBuilder: (context, index) {
                    return const SizedBox();
                  },
                  itemBuilder: (context, index) {
                    var data = newsController.newsData.value.hits?.hits?[index].source;
                    return GestureDetector(
                      onTap: () {
                        InterstitalAd.showInterstitialAd();
                        data?.summary != null
                            ? Get.toNamed(Routes.detailedNews, arguments: [
                                {'index': index},
                              ]) //newsWebViewScreen
                            : Get.to(NewsWebView(), arguments: [
                                {'index': index},
                              ]);
                      },
                      child: newsBox(
                        image: data?.imageUrl,
                        headingNews: data?.title,
                        time: newsController.timeAgo(data?.dateUpdated.toString() ?? ''),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  Widget newsBox({String? image, String? headingNews, String? time}) {
    return Padding(
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
            SizedBox(
              height: SizeUtils.horizontalBlockSize * 50,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SizeUtils.horizontalBlockSize * 2),
                  topRight: Radius.circular(SizeUtils.horizontalBlockSize * 2),
                ),
                // child: CachedNetworkImage(
                //   imageUrl: image ?? '',
                //   placeholder: (context, url) => Image.asset(
                //     AssetsPath.appLogo,
                //     width: double.infinity,
                //   ),
                //   errorWidget: (context, url, error) => Image.asset(
                //     AssetsPath.appLogo,
                //     width: double.infinity,
                //   ),
                //   fit: BoxFit.cover,
                //   width: double.infinity,
                // ),
                child: FadeInImage.assetNetwork(
                  // placeholderCacheHeight: 170,
                  placeholderCacheWidth: 400,
                  placeholder: AssetsPath.appLogo,
                  placeholderFit: BoxFit.none,
                  fit: BoxFit.fitWidth,
                  image: image ?? '',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.horizontalBlockSize * 4,
                vertical: SizeUtils.horizontalBlockSize * 3,
              ),
              child: AppText(
                text: headingNews ?? '',
                color: AppColors.black,
                fontSize: SizeUtils.fSize_13_5(),
                height: 1.7,
                letterSpacing: 0.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.horizontalBlockSize * 4,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsPath.blackCircle,
                    width: SizeUtils.horizontalBlockSize * 4,
                  ),
                  // const SizedBox(width: 5),
                  // AppText(
                  //   text: '',
                  //   color: AppColors.grey,
                  //   fontSize: SizeUtils.fSize_12(),
                  //   height: 1.5,
                  //   letterSpacing: 0.5,
                  // ),
                  // const SizedBox(width: 7),
                  // Transform(
                  //   transform: Matrix4.translationValues(0, SizeUtils.horizontalBlockSize * 0.5, 0),
                  //   alignment: Alignment.center,
                  //   child: const CircleAvatar(
                  //     backgroundColor: AppColors.grey,
                  //     radius: 1,
                  //   ),
                  // ),
                  const SizedBox(width: 7),
                  AppText(
                    text: time ?? '',
                    color: AppColors.grey.withOpacity(0.6),
                    fontSize: SizeUtils.fSize_10(),
                    height: 1.5,
                    letterSpacing: 0.5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeUtils.horizontalBlockSize * 3,
            )
          ],
        ),
      ),
    );
  }
}
