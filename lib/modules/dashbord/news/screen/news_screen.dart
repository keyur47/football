import 'package:football/helper/loading_helper.dart';
import 'package:football/modules/dashbord/news/controller/news_controller.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey.withOpacity(0.1),
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        title: AppText(
          text: StringsUtils.news,
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu_rounded,
              color: AppColors.white,
            ),
            onPressed: widget.onMenuPressed,
          ),
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
                        Get.toNamed(Routes.detailedNews, arguments: [
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
                fontSize: SizeUtils.fSize_14(),
                height: 1.5,
                letterSpacing: 0.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.horizontalBlockSize * 4,
                vertical: SizeUtils.horizontalBlockSize * 1,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsPath.blackCircle,
                    width: SizeUtils.horizontalBlockSize * 5,
                  ),
                  const SizedBox(width: 5),
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
                    color: AppColors.grey,
                    fontSize: SizeUtils.fSize_12(),
                    height: 1.5,
                    letterSpacing: 0.5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeUtils.horizontalBlockSize * 2,
            )
          ],
        ),
      ),
    );
  }
}
