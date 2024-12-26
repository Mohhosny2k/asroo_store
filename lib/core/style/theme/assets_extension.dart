// import 'package:flutter/material.dart';
// import '../images/app_images.dart';

// class MyImages extends ThemeExtension< MyImages> {
// const   MyImages({required this.testImage});

//   final String? testImage;

//   @override
//   ThemeExtension< MyImages> copyWith({String? testImage}) {
//     return  MyImages(testImage: testImage );
//   }

//   @override
//   ThemeExtension< MyImages> lerp(
//       covariant ThemeExtension< MyImages>? other, double t) {
//     if (other is!  MyImages) {
//       return this;
//     }
//     return  MyImages(testImage: testImage);
//   }

// static const  MyImages light = MyImages(testImage: AppImages.testLight);
// static const  MyImages dark =MyImages(testImage: AppImages.testDark);

// }
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:flutter/material.dart';

class MyAssets extends ThemeExtension<MyAssets> {
  const MyAssets({
    required this.bigNavBar,
    required this.homeBg,
  });

  final String? bigNavBar;
  final String? homeBg;

  @override
  ThemeExtension<MyAssets> copyWith({
    String? bigNavBar,
    String? homeBg,
  }) {
    return MyAssets(
      bigNavBar: bigNavBar,
      homeBg: homeBg,
    );
  }

  @override
  ThemeExtension<MyAssets> lerp(
    covariant ThemeExtension<MyAssets>? other,
    double t,
  ) {
    if (other is! MyAssets) {
      return this;
    }
    return MyAssets(
      bigNavBar: bigNavBar,
      homeBg: homeBg,
    );
  }

  static const MyAssets dark = MyAssets(
    bigNavBar: AppImages.bigIconNavBarDark,
    homeBg: AppImages.homeBgDark,
  );
  static const MyAssets light = MyAssets(
    bigNavBar: AppImages.bigIconNavBarLight,
    homeBg: AppImages.homeBgLight,
  );
}
