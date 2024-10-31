import 'package:flutter/widgets.dart';

class AppSizes {
  static late Size _size;
  static late double screenWidth;
  static late double screenHeight;

  void init(BuildContext context) {
    _size = MediaQuery.of(context).size;
    screenWidth = _size.width;
    screenHeight = _size.height;
  }

  static double heightSize(BuildContext context, double value) {
    value /= 100;
    return MediaQuery.of(context).size.height * value;
  }

  static double widthSize(BuildContext context, double value) {
    value /= 100;
    return MediaQuery.of(context).size.width * value;
  }
}