import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const MaterialColor white = MaterialColor(0xFFFFFFFF, <int, Color>{
    10: Color(0xFFFFFFFF),
    20: Color(0xFFEBEBEB),
    30: Color(0xFFFCFCFC),
    40: Color(0xFFF7F7F7),
    50: Color(0xFFE9EEF3),
    60: Color(0xFFE6E7ED),
    70: Color(0xFFB9BBCB),
    80: Color(0xFFE6E6E6),
    90: Color(0xFFC8C8C8),
    100: Color(0xFFD6D6D6),
  });
  static const Color borderColor = Color.fromRGBO(255, 255, 255, 0.2);
  static const Color indicatorBorderColor = Color.fromRGBO(0, 0, 0, 0.1);

  static const MaterialColor black = MaterialColor(0xFF000000, <int, Color>{
    100: Color(0xFF000000),
    200: Color(0xFF1C1C1E),
    300: Color(0xFF919095),
  });

  static const MaterialColor red = MaterialColor(0xFFA90202, <int, Color>{
    100: Color(0xFFA90202),
    200: Color(0xFFDE4343),
  });

  static const MaterialColor green = MaterialColor(0xFF44964E, <int, Color>{
    100: Color(0xFF44964E),
    200: Color(0xFF44964E),
    // 100: Color(0xFF1B8F39),
    // 200: Color(0xFF6EC844),
  });
  static const MaterialColor orange = MaterialColor(0xFFfe8b02, <int, Color>{
    100: Color(0xFFfe8b02),
  });
  static const MaterialColor primaryColor = MaterialColor(0xFF44964E, <int, Color>{
    100: Color(0xFF44964E),
  });
  static const MaterialColor grey = MaterialColor(0xFF5F5F5F, <int, Color>{
    10: Color(0xFF414141),
    20: Color(0xFF3F3F3F),
    30: Color(0xFF595959),
    40: Color(0xFF5F5F5F),
    50: Color(0xFF636363),
    60: Color(0xFF666666),
    70: Color(0xFF959595),
    80: Color(0xFFAFAFAF),
    90: Color(0xFFCCD0CC),
    100: Color(0xFF656565),
    200: Color(0xFFC4C4C4),
    300: Color(0xFFA7A7A7),
  });
  static const lightGrey = Color(0xff999999);
  static const transferColor = Color(0xff41bfa7);
  static const tvColor = Color(0xff91a4af);
  static const fotMobColor = Color(0xff30985f);
  static const settingColor = Color(0xff5a5a5a);
  static const profileColor = Color(0xff545e66);
  static const lineupGreen = Color(0xff2e915c);
  static const lineupTopGreen = Color(0xff339d6c);
  static const textGreen = Color(0xff72D9B2);
  static const dividerColor = Color(0xff34A06E);
  static const progressBackgroundColor = Color(0xff1B2153);
}
