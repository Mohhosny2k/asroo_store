import '../widgets/text_app.dart';
import '../../extensions/context_extensions.dart';
import '../../style/fonts/font_weight_helper.dart';
import '../../style/images/app_images.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key, this.title = 'No Data'});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Opacity(
        opacity: 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.emptyScreen),
            TextApp(
              text: title!,
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}