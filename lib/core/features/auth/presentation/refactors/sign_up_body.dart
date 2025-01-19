import '../../../../common/animations/animate_do.dart';
import '../../../../common/widgets/text_app.dart';
import '../../../../extensions/context_extensions.dart';
import '../widgets/auth_title_info.dart';
import '../widgets/dark_and_lang_button.dart';
import '../widgets/sign_up/sign_up_button.dart';
import '../widgets/sign_up/sign_up_text_form.dart';
import '../widgets/sign_up/user_avatar_image.dart';
import '../../../../language/lang_keys.dart';
import '../../../../routes/app_routes.dart';
import '../../../../style/fonts/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Dark mode and language

            const DarkAndLangButtons(),
            SizedBox(
              height: 30.h,
            ),
            // welcome info

            AuthTitleInfo(
              title: context.translate(LangKeys.signUp),
              descrption: context.translate(LangKeys.signUpWelcome),
            ),
            SizedBox(
              height: 8.h,
            ),
            // user Avatar image
            const UserAvatarImage(),
            SizedBox(
              height: 20.h,
            ),

            //  signup textform
            const SignUpTextForm(),
            SizedBox(
              height: 20.h,
            ),

            // signup button
            const SignUpButton(),
            SizedBox(
              height: 20.h,
            ),
            // Go to login page

            CustomFadeInDown(
              duration: 400,
              child: TextButton(
                onPressed: () {
                  context.pushReplacementNamed(AppRoutes.login);
                },
                child: TextApp(
                  text: context.translate(LangKeys.youHaveAccount),
                  theme: context.textStyle.copyWith(
                      fontSize: 16.sp,
                      color: context.color.bluePinkLight,
                      fontWeight: FontWeightHelper.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
