import 'package:asroo_store/core/helper/extensions/assets_extension.dart';
import 'package:asroo_store/core/helper/extensions/color_extension.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/core/style/colors/light_colors.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:flutter/material.dart';



ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: DarkColors.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.dark, MyAssets.dark],
    useMaterial3: true,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: DarkColors.white,
       fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      ),
    ),
  );
}

ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: LightColors.mainColor,
    extensions:const  <ThemeExtension<dynamic>>[MyColors.light,MyAssets.light],
    useMaterial3: true,
    textTheme:  TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: LightColors.black,
        fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      ),
    ),
  );
}
