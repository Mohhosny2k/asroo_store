class FontFamilyHelper {
  const FontFamilyHelper._();

  // static final FontFamilyHelper _instance = FontFamilyHelper._();
  // static FontFamilyHelper get instance => _instance;

  static const String cairoArabic = 'Cairo';
  static const String poppinsEnglish = 'Poppins';

  static String getLocalozedFontFamily() {
    //TODO: SharedPrefrences

    final currentLanguage = 'ar';

    if (currentLanguage == 'ar') {
      return cairoArabic;
    } else {
      return poppinsEnglish;
    }
  }
}
