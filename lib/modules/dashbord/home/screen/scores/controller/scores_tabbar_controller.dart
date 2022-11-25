import 'package:football/utils/strings_utils.dart';
import 'package:get/get.dart';

class ScoresTabbarController extends GetxController {
  final tab = [
    StringsUtils.facts,
    // StringsUtils.ticker,
    StringsUtils.table,
    // StringsUtils.h2h,
    StringsUtils.lineup,
    StringsUtils.stats,
    // StringsUtils.buzz,
  ];
  final tabUpcoming = [
    StringsUtils.preview,
    StringsUtils.table,
    StringsUtils.lineup,
  ];
}
