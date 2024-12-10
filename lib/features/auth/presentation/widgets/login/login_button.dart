import 'package:asroo_store/asroo_store_app.dart';
import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/common/widgets/custom_linear_button.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/config/size_config.dart';
import 'package:asroo_store/core/helper/extensions/context_extension.dart';
import 'package:asroo_store/core/language/lang_keys.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: CustomLinearButton(
        width: SizeConfig.screenWidth,
        height: 50.h,
        onPressed: () {},
        child: TextApp(
          text: context.translate(LangKeys.login),
          theme: context.textStyle
              .copyWith(fontSize: 18.sp, fontWeight: FontWeightHelper.bold),
        ),
      ),
    );
  }
}
