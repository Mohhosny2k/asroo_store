import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/common/widgets/custom_text_field.dart';
import 'package:asroo_store/core/extensions/context_extensions.dart';
import 'package:asroo_store/core/language/lang_keys.dart';
import 'package:asroo_store/core/utils/app_regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTextForm extends StatefulWidget {
  const LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // email
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              validator: (value) {
                if (!AppRegex.isEmailValid('')) {
                  return context.translate(LangKeys.validEmail);
                }
                return value;
              },
              keyboardType: TextInputType.emailAddress,
              controller: TextEditingController(),
              hintText: context.translate(LangKeys.email),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          // password

          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return context.translate(LangKeys.validPasswrod);
                }
                return value;
              },
              keyboardType: TextInputType.visiblePassword,
              controller: TextEditingController(),
              hintText: context.translate(LangKeys.password),
              obscureText: isShowPassword,
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  icon:  Icon(
                   isShowPassword ? Icons.visibility_off : Icons.visibility,
                    color: context.color.textColor,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
