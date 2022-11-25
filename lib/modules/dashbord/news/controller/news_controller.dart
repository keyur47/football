import 'package:football/model/news_model.dart';
import 'package:football/modules/dashbord/news/service/news_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewsController extends GetxController {
  RxBool isNewsLoading = false.obs;
  Rx<NewsModal> newsData = NewsModal().obs;

  Future getNewsData() async {
    try {
      isNewsLoading.value = true;
      newsData.value = await NewsService.newsMethod();
      print('newsData--->${newsData.value.toJson()}');
      return newsData.value;
    } catch (e, st) {
      print("newsData-->$e--->$st");
      isNewsLoading.value = false;
    } finally {
      isNewsLoading.value = false;
    }
  }

  String timeAgo(String str) {
    try {
      DateTime d = DateTime.parse(str);
      Duration diff = DateTime.now().difference(d);

      if (diff.inDays >= 365) {
        return (diff.inDays / 365).floor() == 1 ? "1 year ago " : DateFormat('MMMM,dd,yyyy').format(d);
      }
      if (diff.inDays > 30) {
        return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
      }
      if (diff.inDays > 0) {
        return (diff.inDays / 7).floor() == 1
            ? "yesterday ${DateFormat('hh:mm').format(d)}"
            : "${(diff.inDays / 7).floor()} days ago";
      }

      if (diff.inDays > 7) {
        return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
      }

      if (diff.inHours > 0) {
        return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
      }
      if (diff.inMinutes > 0) {
        return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
      }

      return "just now";
    } catch (e) {
      return e.toString();
    }
  }

  String dateFormat(DateTime date) {
    String? amPm;
    var formatter = DateFormat('dd. MMM hh:mm');
    int hours = date.hour;

    if (hours > 12) {
      amPm = "PM";
    } else {
      amPm = "AM";
    }
    String formattedDate = "${formatter.format(date)} $amPm";
    return formattedDate;
  }

  @override
  onInit() {
    getNewsData();
    super.onInit();
  }
}
