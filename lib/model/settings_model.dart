import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowDate {
  String? date;
  RxBool? isSelected;

  ShowDate({this.date, this.isSelected});
}

class SettingsData {
  String? name;
  IconData? icon;

  SettingsData({
    this.name,
    this.icon,
  });
}
