import 'package:football/utils/strings_utils.dart';

class AppValidator {
  static String? emailValidator(String? value) {
    const Pattern pattern = StringsUtils.emailRegExp;
    final RegExp regex = RegExp(pattern.toString());
    if (value!.isEmpty) {
      return StringsUtils.plzEnterEmail;
    } else if (!regex.hasMatch(value)) {
      return StringsUtils.enterValidEmail;
    } else {
      StringsUtils.emptyQuote;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return StringsUtils.plzEnterPWD;
    } else if (!(RegExp(StringsUtils.pWDRegExp).hasMatch(value.trim()))) {
      return StringsUtils.pWDMustBeUpperLower;
    } else {
      return null;
    }
  }

  String? confirmPasswordValidator(String? value, {required String password}) {
    if (value!.isEmpty) {
      return StringsUtils.plzEnterPWD;
    } else if (!(RegExp(StringsUtils.pWDRegExp).hasMatch(value.trim()))) {
      return StringsUtils.pWDMustBeUpperLower;
    } else {
      return null;
    }
  }

  static String? otpValidation(String? value) {
    if (value!.isEmpty) {
      return "Please fill 6 digit code";
    } else if (value.length <= 5) {
      return "Please fill 6 digit code";
    } else {
      return null;
    }
  }
}
