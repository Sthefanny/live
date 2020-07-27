import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_config.dart';

final ThemeData defaultThemeData = ThemeData(
  textTheme: TextTheme(
    headline1: GoogleFonts.montserrat(fontWeight: FontWeight.w300, fontSize: 96, letterSpacing: -1.5, color: ColorsConfig.onSurfaceHighEmphasis),
    headline2: GoogleFonts.montserrat(fontWeight: FontWeight.w300, fontSize: 60, letterSpacing: -0.5, color: ColorsConfig.onSurfaceHighEmphasis),
    headline3: GoogleFonts.montserrat(fontWeight: FontWeight.normal, fontSize: 48, color: ColorsConfig.onSurfaceHighEmphasis),
    headline4: GoogleFonts.montserrat(fontWeight: FontWeight.normal, fontSize: 34, color: ColorsConfig.onSurfaceHighEmphasis),
    headline5: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 24, color: ColorsConfig.onSurfaceHighEmphasis),
    headline6: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 20, letterSpacing: 0.15, color: ColorsConfig.onSurfaceHighEmphasis),
    subtitle1: GoogleFonts.montserrat(fontWeight: FontWeight.normal, fontSize: 16, letterSpacing: 0.15, color: ColorsConfig.onSurfaceHighEmphasis),
    subtitle2: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 14, letterSpacing: 0.1, color: ColorsConfig.onSurfaceHighEmphasis),
    bodyText1: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 16, letterSpacing: 0.5, color: ColorsConfig.onSurfaceHighEmphasis),
    bodyText2: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 14, letterSpacing: 0.25, color: ColorsConfig.onSurfaceHighEmphasis),
    button: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 14, letterSpacing: 1.25, color: ColorsConfig.onSurfaceHighEmphasis),
    caption: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 12, letterSpacing: 0.4, color: ColorsConfig.onSurfaceHighEmphasis),
    overline: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 10, letterSpacing: 1.5, color: ColorsConfig.onSurfaceHighEmphasis),
  ),
);
