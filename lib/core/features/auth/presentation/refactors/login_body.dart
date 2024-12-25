import 'package:asroo_store/core/extensions/context_extensions.dart';
import 'package:asroo_store/core/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:asroo_store/core/features/auth/presentation/widgets/dark_and_lang_button.dart';
import 'package:asroo_store/core/language/lang_keys.dart';
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

              SizedBox(
              height: 30.h,
            ),

            
          ],
        ),
      ),
    );
  }
}
