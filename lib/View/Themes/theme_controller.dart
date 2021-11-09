import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reacount_2/View/Themes/theme_datas.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;
  late ThemeData theme = ThemeDatas.blueTheme;
  static ThemeMode themeMode = ThemeMode.light;

  void changeThemeMode() {
    isDarkMode = (!isDarkMode.value) as RxBool;
    themeMode =
        (themeMode != ThemeMode.light) ? ThemeMode.light : ThemeMode.dark;
    update();
  }

  void changeTheme(ThemeData themeData) {
    theme = themeData;
    update();
  }
}
