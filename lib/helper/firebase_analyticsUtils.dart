import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsUtils {
  static late FirebaseAnalytics analytics;
  static late FirebaseAnalyticsObserver observer;

  static const String dashboardScreen = 'dashboardScreen';
  static const String homeScreen = 'homeScreen';
  static const String previewScreen = 'previewScreen';
  static const String newsScreen = 'newsScreen';
  static const String rankingScreen = 'rankingScreen';

  static void init() {
    analytics = FirebaseAnalytics.instance;
    observer = FirebaseAnalyticsObserver(analytics: analytics);
  }

  static void sendCurrentScreen(String screenName) async {
    await analytics.setCurrentScreen(
      screenName: screenName,
      screenClassOverride: screenName,
    );
  }

  static void sendAnalyticsEvent(String buttonClick) async {
    await analytics.logEvent(
      name: buttonClick,
    );
  }
}
