import 'package:flutter/material.dart';
import 'package:split/utils/themes/app_themes.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    this.onTap,
    this.color,
    this.width,
    this.height,
    this.ph = 0.0,
    this.pv = 12.0,
    this.fontSize,
    this.fontWeight,
  });

  final String text;
  final void Function()? onTap;
  final Color? color;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double ph, pv;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: ph, vertical: pv),
        decoration: BoxDecoration(
          color: color ?? AppTheme.primary,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTheme.textStyle(
            color: AppTheme.dotGray,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
