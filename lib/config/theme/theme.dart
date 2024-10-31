import 'package:flutter/material.dart';
import 'package:laundromat_flutter/helper/app_color.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 15, color: Colors.black),
    ),
  );
}
