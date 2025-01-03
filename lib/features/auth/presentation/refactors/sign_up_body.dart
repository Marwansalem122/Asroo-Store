import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/helper/extensions/context_extension.dart';
import 'package:asroo_store/core/language/lang_keys.dart';
import 'package:asroo_store/core/routes/routes.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:asroo_store/features/auth/presentation/widgets/dark_and_light_and_language.dart';
import 'package:asroo_store/features/auth/presentation/widgets/sign_up/sign_up_button.dart';
import 'package:asroo_store/features/auth/presentation/widgets/sign_up/sign_up_text_form.dart';
import 'package:asroo_store/features/auth/presentation/widgets/sign_up/user_avator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Dark Mode & Language
            const DarkAndLightAndLangButtons(),
            SizedBox(height: 30.h),
            AuthTitleInfo(
              title: context.translate(LangKeys.signUp),
              description: context.translate(LangKeys.signUpWelcome),
            ),
            SizedBox(height: 10.h),
            //user Avatar image
            const UserAvator(),
            SizedBox(height: 25.h),
            const SignUpTextForm(),
            SizedBox(height: 10.h),
            const SignUpButton(),
            SizedBox(height: 5.h),

            //Go to signup screen
            CustomFadeInDown(
              duration: 400,
              child: TextButton(
                onPressed: () {
                  context.pushReplacementNamed(Routes.loginScreen);
                },
                child: TextApp(
                  text: context.translate(LangKeys.youHaveAccount),
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
