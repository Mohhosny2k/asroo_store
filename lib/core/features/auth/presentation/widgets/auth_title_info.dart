import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extensions.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTitleInfo extends StatelessWidget {
  final String title;
  final String descrption;
  const AuthTitleInfo(
      {super.key, required this.title, required this.descrption});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: Column(
        children: [
          // title
          TextApp(
              text: title,
              theme: context.textStyle.copyWith(
                color: context.color.textColor,
                fontSize: 24.sp,
                fontWeight: FontWeightHelper.bold
              )),
          SizedBox(
            height: 10.h,
          ),
          // description
          TextApp(
              text: descrption,
              theme: context.textStyle.copyWith(
                color: context.color.textColor,
                fontSize: 14.sp,
                 fontWeight: FontWeightHelper.medium
              ),
              textAlign: TextAlign.center,
              ),
        ],
      ),
    );
  }
}
