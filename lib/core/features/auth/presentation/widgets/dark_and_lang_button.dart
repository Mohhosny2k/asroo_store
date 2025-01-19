import '../../../../app/app_cubit/app_cubit.dart';
import '../../../../common/animations/animate_do.dart';
import '../../../../common/widgets/custom_linear_button.dart';
import '../../../../common/widgets/text_app.dart';
import '../../../../extensions/context_extensions.dart';
import '../../../../language/app_localizations.dart';
import '../../../../language/lang_keys.dart';
import '../../../../style/fonts/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DarkAndLangButtons extends StatelessWidget {
  const DarkAndLangButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Dark Mode Button
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return CustomFadeInRight(
                duration: 400,
                child: CustomLinearButton(
                    onPressed: cubit.changeAppThemeMode,
                    child: Icon(
                      cubit.isDark
                          ? Icons.light_mode_rounded
                          : Icons.dark_mode_rounded,
                      color: Colors.white,
                    )));
          },
        ),

        // languages Button
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return CustomFadeInLeft(
                duration: 400,
                child: CustomLinearButton(
                    height: 44.h,
                    width: 100.w,
                    onPressed: () {
                      if (AppLocalizations.of(context)!.isEnLocale) {
                        cubit.toArabic();
                      } else {
                        cubit.toEnglish();
                      }
                    },
                    child: TextApp(
                        text: context.translate(LangKeys.language),
                        theme: context.textStyle.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeightHelper.bold))));
          },
        )
      ],
    );
  }
}
