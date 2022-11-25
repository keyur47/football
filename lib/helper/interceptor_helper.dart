import 'dart:developer';
import 'package:football/helper/shared_preferences.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/navigation_utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:football/utils/app_colors.dart';
import 'package:football/utils/strings_utils.dart';
import 'package:get/get.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

class LoggerInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    log("****** NetworkAPICall InterceptedClient ********* ${data.statusCode}");
    if (data.statusCode == 401) {
      await showGeneralDialog(
          pageBuilder: (context, animation1, animation2) {
            return const SizedBox();
          },
          barrierColor: AppColors.black.withOpacity(0.8),
          transitionDuration: const Duration(milliseconds: 350),
          barrierDismissible: false,
          context: Get.context!,
          transitionBuilder: (context, a1, a2, widget) => Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: AlertDialog(
                  title: const Text(StringsUtils.sessionExpire),
                  content: SizedBox(
                    height: 80,
                    child: Column(
                      children: const [Text(StringsUtils.yourSessionHasExpirePleaseLoginAgain)],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      child: const Text(StringsUtils.ok),
                      onPressed: () {
                        AppPreference.clearData();
                        Get.offAllNamed(Routes.splash);
                      },
                    )
                  ],
                ),
              )));
    }
    /* else if (data.statusCode == 500) {
      await showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (context) => AlertDialog(
          title: const Text('Internal Server Error'),
          content: SizedBox(
            height: 65,
            child: Column(
              children: const [Text("please login after some time !!")],
            ),
          ),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Get.offAllNamed(Routes.signInScreen);
              },
            )
          ],
        ),
      );
    }*/
    return data;
  }
}
