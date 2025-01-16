import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/common/toast/show_toast.dart';
import 'package:asroo_store/core/common/widgets/custom_linear_button.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extensions.dart';
import 'package:asroo_store/core/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:asroo_store/core/language/lang_keys.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(success: (userRole) {
            ShowToast.showToastSuccessTop(
              context: context,
              message: context.translate(LangKeys.loggedSuccessfully),
              // seconds: 3,
            );
            if (userRole == 'admin') {
              context.pushNamedAndRemoveUntil(
                AppRoutes.homeAdmin,
              );
            } else {
              context.pushNamedAndRemoveUntil(
                AppRoutes.homeCustomer,
              );
            }
          }, error: (error) {
            ShowToast.showToastErrorTop(
              context: context,
              message: context.translate(error),
              // seconds: 3,
            );
          });
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return CustomLinearButton(
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                onPressed: () {},
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            },
            orElse: () {
              return CustomLinearButton(
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                onPressed: () {
                  _validateThenDoLogin(context);
                },
                child: TextApp(
                  text: context.translate(LangKeys.login),
                  theme: context.textStyle.copyWith(
                      fontSize: 18.sp, fontWeight: FontWeightHelper.bold),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _validateThenDoLogin(BuildContext context) {
    if (context.read<AuthBloc>().formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(const AuthEvent.login());
    }
  }
}
