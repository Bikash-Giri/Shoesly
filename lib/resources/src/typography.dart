part of 'theme.dart';

// 100: Thin
// 200: ExtraLight
// 300: Light
// 400: Regular
// 500: Medium
// 600: SemiBold
// 700: Bold
// 800: ExtraBold
// 900: Black

enum TypographySize {
  /// For mobile phones
  normal,

  /// For bigger screens like tablet, computer screens and beyond
  big,
}

TextTheme _getShoeslyTextTheme(TypographySize size) {
  final double _scale = switch (size) {
    TypographySize.normal => 1,
    // TypographySize.big => 1.4,
    TypographySize.big => 1,
  };

  return TextTheme(
    displayLarge: GoogleFonts.inter(
      fontSize: 96 * _scale,
    ),
    displayMedium: GoogleFonts.inter(
      fontSize: 60 * _scale,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: 48 * _scale,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.normal,
      fontSize: 34 * _scale,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 24 * _scale,
    ),
    titleLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 20 * _scale,
    ),
    titleMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      fontSize: 16 * _scale,
    ),
    titleSmall: GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      fontSize: 14 * _scale,
    ),
    bodyLarge: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      fontSize: 14 * _scale,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14 * _scale,
      fontWeight: FontWeight.normal,
    ),
    labelLarge: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      fontSize: 14 * _scale,
    ),
    bodySmall: GoogleFonts.inter(
      fontWeight: FontWeight.normal,
      fontSize: 12 * _scale,
    ),
    labelSmall: GoogleFonts.inter(
      fontWeight: FontWeight.normal,
      fontSize: 10 * _scale,
    ),
  );
}

extension ShoeslyTextThemeExtension on TextTheme {
  TextStyle get headline900 => GoogleFonts.inter(
        fontWeight: FontWeight.w900,
        fontSize: 48,
      );

  TextStyle get headline800 => GoogleFonts.inter(
        fontWeight: FontWeight.w800,
        fontSize: 36,
      );

  TextStyle get headline700 => GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 24,
      );

  TextStyle get headline600 => GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );

  TextStyle get headline500 => GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );

  TextStyle get headline400 => GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );

  TextStyle get headline300 => GoogleFonts.inter(
        fontWeight: FontWeight.w300,
        fontSize: 12,
      );

  TextStyle get headline200 => GoogleFonts.inter(
        fontWeight: FontWeight.w200,
        fontSize: 12,
      );

  TextStyle get headline100 => GoogleFonts.inter(
        fontWeight: FontWeight.w100,
        fontSize: 10,
      );

  TextStyle get bodyText300 => GoogleFonts.inter(
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        fontSize: 14,
      );

  TextStyle get bodyText200 => GoogleFonts.inter(
        fontWeight: FontWeight.w200,
        fontStyle: FontStyle.normal,
        fontSize: 14,
      );
  TextStyle get bodyText100 => GoogleFonts.inter(
        fontWeight: FontWeight.w100,
        fontStyle: FontStyle.normal,
        fontSize: 14,
      );

  TextStyle get button12 => GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      );

  TextStyle get button16 => GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );

  TextStyle get button16M => GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );

  TextStyle get captionM => GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      );

  TextStyle get overlineM => GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 10,
      );

  TextStyle get overlineS => GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 8,
      );

  TextStyle get urbanistB => GoogleFonts.urbanist(
        fontSize: 13,
        fontWeight: FontWeight.bold,
      );

  TextStyle get urbanist24B => GoogleFonts.urbanist(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

  TextStyle get agHeadline300 => GoogleFonts.agbalumo(
      fontSize: 13, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal);

  TextStyle get agHeadline600 => GoogleFonts.agbalumo(
      fontSize: 30, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal);
}
