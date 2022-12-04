import 'package:flutter/material.dart';

class StringsUtils {
  StringsUtils._();

  static const String emptyQuote = '';
  static ValueNotifier<int> bottomIndex = ValueNotifier(0);

  static const String appName = 'Football Live Scores 2022';
  static const String ranking = 'Ranking';
  static const String home = 'Home';
  static const String score = 'Score';
  static const String news = 'News';
  static const String live = 'Live';
  static const String setting = 'Setting';
  static const String more = 'More';
  static const String worldCup = 'World Cup 2022';
  static const String international = 'International';
  static const String account = 'Account';
  static const String about = 'About';
  static const String help = 'Help';
  static const String privacy = 'Privacy';
  static const String search = 'Search';
  static const String ok = 'ok';
  static const String notAvailable = 'No Data Available';
  static const String somethingWentWrong = 'Something went wrong';
  static const String sessionExpire = 'Session Expire';
  static const String yourSessionHasExpirePleaseLoginAgain = 'Your Session has expire please login again!!';

  /// List Name
  static const String table = "Table";
  static const String preview = "Preview";
  static const String injuries = "Injuries";
  static const String h2h = "H2H";
  static const String facts = "Facts";
  static const String ticker = "Ticker";
  static const String lineup = "Lineup";
  static const String stats = "Stats";
  static const String buzz = "Buzz";

  ///Date format
  static const String ddMmYy = 'dd-MM–yyyy';
  static const String ddMmYyy = 'yyyy-MM-d';
  static const String ddMmHhMmA = 'dd/MM – hh:mm a';
  static const String dMMMyHA = "d - MMM- y | h a";
  static const String yMMMdForMate = 'yMMMd';
  static const String EEE = 'EEE';
  static const String dd = 'dd';

  /// Ranking format
  static const String team = 'Team';
  static const String Pt = 'Pt';
  static const String P = 'P';
  static const String W = "W";
  static const String D = 'D';
  static const String L = 'L';
  static const String sub = '+/-';

  ///auth
  static const String signUp = 'Sign Up';
  static const String signIn = 'Sign In';
  static const String logIn = 'Log In';
  static const String emailAddress = 'Email address';
  static const String enterEmail = 'Enter your email';
  static const String newPassword = 'New Password';
  static const String enterPWD = 'Enter password';
  static const String enterNewPWD = 'Enter New password';
  static const String password = 'Password';
  static const String otp = 'Otp';
  static const String enterOtp = 'Enter Otp';
  static const String confirmPwd = 'Confirm Password';
  static const String reEnterPwd = 'Re - enter password';
  static const String forgotPassword = 'Forgot Password';
  static const String verifyEmail = 'Verify Your Email';
  static const String confirm = 'Confirm';
  static const String confirmPassword = 'Confirm Password';
  static const String donHaveAccount = "Don't have an account?";
  static const String alreadyAccount = "Already have an account?";
  static const pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  ///Past Loads
  static const String noDataFound = "No Data Found!";
  static const String noPastLoadMessage = 'No Past Loads !!';

  ///validation
  static const String plzEnterEmail = 'Please enter email';
  static const String plzEnterAllDetails = 'Please fill all details';
  static const String plzEnterAmount = 'Amount';
  static const String plzEnterText = 'Text';
  static const String emailRegExp = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String aZRegExp = r'[a-zA-Z]';
  static const String numberRegExp = r'[0-9]';

  // static const String emailRegExp = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String enterValidEmail = 'Please enter valid email';
  static const String enterValidOtp = 'Please enter valid OTP';
  static const String enterValidAmount = 'amount';
  static const String enterValidText = 'Text';
  static const String plzEnterPWD = 'Please enter Password';
  static const String pWDRegExp = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  static const String amountValid = r'^([0-9])';
  static const String textValid = '[a-zA-Z]';
  static const String pWDMustBeUpperLower = 'Password must be Uppercase,Lowercase,digit and specialCharacters';

  // static const String pWDMustBeUpperLower = 'Password must be Uppercase,Lowercase,digit and specialCharacters';
  static const String plzEnterConfirmPwd = 'Please enter confirm password';
  static const String plzEnterOtp = 'Please enter OTP';
  static const String confirmPwdWithSameAbove = 'Confirm Password must be same as above';
  static const String typeHere = 'Please type here';
  static const String pleaseSelectValidRange = 'Please select valid date range';
  static const String pleaseSelectMaxRange7 = 'Please select maximum range 7 days';

  ///exit app
  static const String wanToExitApp = 'Do you want to exit an App?';
  static const String exitApp = 'Exit App';

  ///more
  static const String profileText =
      'We can keep your settings safe so \nyou can sync them across devices \nor retrieve them when you get a new \ndevice.';
  static const String signInCapital = 'SIGN IN';
  static const String transferCenter = 'Transfer Center';
  static const String tvSchedule = 'TV Schedule';
  static const String fotMobSupportersClub = 'FotMob Supporters Club';
  static const String settings = 'Settings';
  static const String india = 'India';
  static const String removeAds = 'RemoveAds';

  ///
  static const String qualificationNextStage = 'Qualification next stage';


  /// settings
  static const documentTitle = 'Rate Us';
  static const documentSubTile = 'Share with your friends and family';
  static const notification = 'Notification';
  static const autoReply = 'Message Response Stats';
  static const upgrade = 'Upgrade App';
  static const advance = 'Advance Settings';
  static const Appearance = 'Appearance';
  static const Notification = 'Notification';
  static const Privacy = 'Privacy';
  static const Help = 'Help';
  static const InviteFriends = 'Invite your friends';
}
