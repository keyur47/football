import 'package:football/modules/dashbord/home/screen/home_screen.dart';
import 'package:football/modules/dashbord/news/screen/news_screen.dart';
import 'package:football/modules/dashbord/ranking/screen/ranking_screen.dart';
import 'package:football/modules/dashbord/setting/setting_screen.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<HomeScreen>(() => HomeScreen());
    register<NewsScreen>(() => NewsScreen());
    register<RankingScreen>(() => RankingScreen());
    register<SettingScreen>(() => SettingScreen());
  }

  static dynamic fromString(String type) {
    return _constructors[type]!();
  }
}
