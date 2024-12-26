import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/common/widgets/custom_text_field.dart';
import 'package:asroo_store/core/extensions/context_extensions.dart';
import 'package:asroo_store/core/language/lang_keys.dart';
import 'package:asroo_store/core/utils/app_regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpTextForm extends StatefulWidget {
  const SignUpTextForm({super.key});

  @override
  State<SignUpTextForm> createState() => _SignUpTextFormState();
}

class _SignUpTextFormState extends State<SignUpTextForm> {
    bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
   return Form(
      child: Column(
        children: [
          // name
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 4) {
                  return context.translate(LangKeys.validName);
                }
                return value;
              },
              keyboardType: TextInputType.name,
              controller: TextEditingController(),
              hintText: context.translate(LangKeys.fullName),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
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