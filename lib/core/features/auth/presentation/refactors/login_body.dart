import '../../../../common/animations/animate_do.dart';
import '../../../../common/widgets/text_app.dart';
import '../../../../extensions/context_extensions.dart';
import '../widgets/auth_title_info.dart';
import '../widgets/dark_and_lang_button.dart';
import '../widgets/login/login_button.dart';
import '../widgets/login/login_text_form.dart';
import '../../../../language/lang_keys.dart';
import '../../../../routes/app_routes.dart';
import '../../../../style/fonts/font_weight_helper.dart';
import '../../../../utils/app_regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

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
              height: 50.h,
            ),
            // welcome info

            AuthTitleInfo(
              title: context.translate(LangKeys.login),
              descrption: context.translate(LangKeys.welcome),
            ),
            SizedBox(
              height: 30.h,
            ),

            //  login textform
            const LoginTextForm(),
            SizedBox(
              height: 30.h,
            ),

            // login button
            const LoginButton(),
            SizedBox(
              height: 30.h,
            ),

            // Go to register page

            CustomFadeInDown(
              duration: 400,
              child: TextButton(
                onPressed: () {
                  context.pushReplacementNamed(AppRoutes.signUp);
                },
                child: TextApp(
                  text: context.translate(LangKeys.createAccount),
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
