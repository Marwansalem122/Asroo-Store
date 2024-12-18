import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/config/size_config.dart';
import 'package:asroo_store/core/helper/extensions/context_extension.dart';
import 'package:asroo_store/core/language/lang_keys.dart';
import 'package:asroo_store/core/routes/routes.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:asroo_store/features/auth/presentation/widgets/dark_and_light_and_language.dart';
import 'package:asroo_store/features/auth/presentation/widgets/login/login_button.dart';
import 'package:asroo_store/features/auth/presentation/widgets/login/login_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    print(SizeConfig.screenHeight);
    print(SizeConfig.screenWidth);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Dark Mode & Language
            const DarkAndLightAndLangButtons(),
            SizedBox(height: 50.h),
            AuthTitleInfo(
              title: context.translate(LangKeys.login),
              description: context.translate(LangKeys.welcome),
            ),
            SizedBox(height: 30.h),
            const LoginTextForm(),
            SizedBox(height: 30.h),
            const LoginButton(),
            SizedBox(height: 30.h),

            //Go to signup screen
            CustomFadeInDown(
              duration: 400,
              child: TextButton(
                onPressed: () {
                  context.pushReplacementNamed(Routes.signupScreen);
                },
                child: TextApp(
                  text: context.translate(LangKeys.createAccount),
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.bold,
                    color: context.color.bluePinkLight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
