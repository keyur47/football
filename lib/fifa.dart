import 'package:football/utils/navigation_utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/app_colors.dart';
import 'utils/assets_path.dart';
import 'utils/strings_utils.dart';
import 'widgets/app_binding.dart';
import 'widgets/my_behavior.dart';

class FiFa extends StatelessWidget {
  const FiFa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      title: StringsUtils.appName,
      initialBinding: AppBinding(),
      theme: ThemeData(
        brightness: Brightness.light,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        disabledColor: Colors.transparent,
        fontFamily: AssetsPath.iBMPlexSans,
        backgroundColor: AppColors.white,
      ),
      initialRoute: Routes.splash,
      getPages: Routes.routes,
      builder: (context, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: GestureDetector(
            onTap: () {
              // Utils.hideKeyboard(context);
            },
            child: ScrollConfiguration(behavior: MyBehavior(), child: child!),
          ),
        );
      },
    );
  }
}
