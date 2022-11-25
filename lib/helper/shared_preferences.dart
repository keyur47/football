import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static late SharedPreferences prefsData;

  static Future initSharedPreferences() async {
    prefsData = await SharedPreferences.getInstance();
  }

  static Future setString(String key, String value) async {
    await prefsData.setString(key, value);
  }

  static String getString(String key) {
    print('getString: ${prefsData.getString(key)}');
    return prefsData.getString(key) ?? "";
  }

  static void clearData() async {
    await prefsData.clear();
  }
}
