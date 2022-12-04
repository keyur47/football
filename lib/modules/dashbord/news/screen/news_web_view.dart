import 'package:football/ads/banner_ad.dart';
import 'package:football/helper/loading_helper.dart';
import 'package:football/modules/dashbord/news/controller/news_controller.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/size_utils.dart';
import 'package:football/utils/strings_utils.dart';
import 'package:football/widgets/app_text.dart';
import 'package:football/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
  const NewsWebView({Key? key}) : super(key: key);

  @override
  State<NewsWebView> createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  final NewsController newsController = Get.find();

  final key = UniqueKey();
  dynamic index;
  @override
  void initState() {
    index = Get.arguments;
    print('FINISH------>${newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.webUri}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  WebView(
                      key: key,
                      javascriptMode: JavascriptMode.unrestricted,
                      onPageFinished: (finish) {
                        newsController.isLoading.value = false;
                      },
                      initialUrl: newsController.newsData.value.hits?.hits?[index[0]["index"]].source?.webUri),
                  Obx(
                    () => newsController.isLoading.value
                        ? const Center(
                            child: Loading(),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
            Obx(
              () => isBannerLoaded.value == true
                  ? const SizedBox(
                      height: 63,
                      width: double.infinity,
                    )
                  : SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
