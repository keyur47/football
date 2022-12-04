import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static late SharedPreferences _prefs;
  static const _notification = 'notification';

  static Future initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  static String getString(String key) {
    print('getString: ${_prefs.getString(key)}');
    return _prefs.getString(key) ?? "";
  }

  static Future<void> setNotification({required bool notification}) async {
    final SharedPreferences prefs = _prefs;
    prefs.setBool(_notification, notification);
  }


  static bool get notification {
    final bool value = _prefs.getBool(_notification) ?? false;
    return value;
  }

  static void clearData() async {
    await _prefs.clear();
  }
}
