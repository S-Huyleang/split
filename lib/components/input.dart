import 'package:flutter/material.dart';
import 'package:split/utils/constants/constant.dart';
import 'package:split/utils/themes/app_themes.dart';

class Input extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final bool isHalf;
  final bool readOnly;
  final Widget? suffixIcon;
  final double? width;
  final double? height;
  final int? maxLine;
  final int? maxLength;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final bool error;
  final String? errorText;
  final bool isPasswordField;

  const Input({
    super.key,
    this.controller,
    this.hint,
    this.isHalf = false,
    this.readOnly = false,
    this.suffixIcon,
    this.onTap,
    this.width,
    this.height,
    this.keyboardType,
    this.maxLine = 1,
    this.maxLength,
    this.error = false,
    this.errorText,
    this.isPasswordField = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width:
                  width ??
                  (!isHalf && width == null
                      ? double.infinity
                      : MediaQuery.of(context).size.width / 2 - 24),
              height: height ?? 45.00,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color:
                      error
                          ? AppTheme.error
                          : AppTheme.gray.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: TextFormField(
                onTap: onTap,
                readOnly: readOnly,
                controller: controller,
                keyboardType: keyboardType,
                maxLines: maxLine,
                maxLength: maxLength,
                obscureText: isPasswordField,
                style: AppTheme.textStyle(fontSize: 14),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: AppTheme.textStyle(
                    fontSize: 14,
                    color: AppTheme.gray,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 13,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  fillColor: Colors.transparent,
                  filled: true,
                  suffixIcon: suffixIcon,
                  counterText: "", // Hide default counter text
                ),
              ),
            ),
            if (error) SizedBox(height: 10),
            if (error)
              Text(
                errorText ?? "",
                style: AppTheme.textStyle(
                  fontSize: Sizes.sm,
                  color: AppTheme.error,
                ),
              ),
          ],
        ),
        if (maxLength != null && controller != null)
          Positioned(
            top: 4,
            right: 8,
            child: ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller!,
              builder: (context, value, child) {
                return Text(
                  "${value.text.length}/$maxLength",
                  style: AppTheme.textStyle(fontSize: 12, color: AppTheme.gray),
                );
              },
            ),
          ),
      ],
    );
  }
}
