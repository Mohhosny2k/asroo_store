import '../../../../../common/animations/animate_do.dart';
import '../../../../../common/widgets/custom_text_field.dart';
import '../../../../../extensions/context_extensions.dart';
import '../../bloc/auth_bloc.dart';
import '../../../../../language/lang_keys.dart';
import '../../../../../utils/app_regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTextForm extends StatefulWidget {
  const LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  bool isShowPassword = true;
  late AuthBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<AuthBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.emailController.dispose();
    _bloc.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
     key: _bloc.formKey,
      child: Column(
        children: [
          // email
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              validator: (value) {
                if (!AppRegex.isEmailValid(_bloc.emailController.text)) {
                  return context.translate(LangKeys.validEmail);
                }
                return value;
              },
              keyboardType: TextInputType.emailAddress,
              controller: _bloc.emailController,
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
              controller: _bloc.passwordController,
              hintText: context.translate(LangKeys.password),
              obscureText: isShowPassword,
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  icon: Icon(
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
