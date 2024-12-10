import 'package:flutter/material.dart';

class SizeConfig {
  static Size? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  // static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.sizeOf(context);
    screenWidth = _mediaQueryData!.width;
    screenHeight = _mediaQueryData!.height;
    // orientation = _mediaQueryData!.o;
  }

  // Method to get responsive font size based on screen width
  static double getResponsiveFontSize(double inputFontSize) {
    return (inputFontSize / 375.0) * screenWidth!;
  }
}
