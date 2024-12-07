import 'package:asroo_store/core/helper/extensions/assets_extension.dart';
import 'package:asroo_store/core/helper/extensions/color_extension.dart';
import 'package:asroo_store/core/language/app_localization.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  //Language
  String translate(String langkey) {
    return AppLocalizations.of(this)!.translate(langkey).toString();
  }

//Colors
  MyColors get color => Theme.of(this).extension<MyColors>()!;
//images
  MyAssets get assets => Theme.of(this).extension<MyAssets>()!;
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  void pop() => Navigator.of(this).pop();
}
