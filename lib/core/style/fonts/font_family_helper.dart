import 'package:asroo_store/core/service/shared_pref/pref_keys.dart';
import 'package:asroo_store/core/service/shared_pref/shared_pref.dart';

class FontFamilyHelper {
  const FontFamilyHelper._();

  // static final FontFamilyHelper _instance = FontFamilyHelper._();
  // static FontFamilyHelper get instance => _instance;

  static const String cairoArabic = 'Cairo';
  static const String poppinsEnglish = 'Poppins';

  static String getLocalozedFontFamily() {


    final currentLanguage = SharedPref().getString(PrefKeys.language);

    if (currentLanguage == 'ar') {
      return cairoArabic;
    } else {
      return poppinsEnglish;
    }
  }
}
