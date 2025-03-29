import 'package:flutter/material.dart';
import 'package:split/utils/constants/constant.dart';

class AppTheme {
  AppTheme._();

  static final AppTheme instance = AppTheme._();

  // Color Themes
  static const Color primary = Color(0xFF61B87F);
  static const Color warning = Color(0xFFFFBA08);
  static const Color error = Color(0xFFC92929);
  static const Color darkGray = Color(0xFF444444);
  static const Color dotGray = Color(0xFFFAF5FF);
  static const Color gray = Color(0xFF9D9D9D);

  // Text Themes
  static const String fontInter = 'inter';
  static const String fontSiemreap = 'siemreap';

  // Text Styles
  static TextStyle textStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    TextOverflow? overflow,
  }) => TextStyle(
    fontFamily: fontInter,
    fontFamilyFallback: [fontSiemreap],
    color: color ?? darkGray,
    fontSize: fontSize ?? Sizes.md,
    fontWeight: fontWeight,
    overflow: overflow,
  );
}
