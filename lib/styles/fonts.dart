part of styles;

class AppFont {
  static TextStyle getAppFont({
    required FontWeight fontWeight,
    required double fontSize,
    required Color color,
  }) {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ));
  }
}

class HeaderFonts {
  static final primaryHeader = AppFont.getAppFont(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: TextColors.secondary
  );
}


class TextFonts {
  static final primaryText = AppFont.getAppFont(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: TextColors.primary
  );
}
