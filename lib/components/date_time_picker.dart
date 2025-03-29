import 'package:flutter/material.dart';
import 'package:split/components/input.dart';
import 'package:split/utils/constants/constant.dart';
import 'package:split/utils/popup/date_time_picker_utils.dart';
import 'package:split/utils/themes/app_themes.dart';

class DateTimePicker extends StatelessWidget {
  const DateTimePicker({
    super.key,
    required this.onPicked,
    required this.header,
    required this.controller,
    this.error = false, this.errorText,
  });

  final void Function(DateTime?) onPicked;
  final TextEditingController controller;
  final String header;
  final bool error;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: AppTheme.textStyle(
            fontSize: Sizes.lg,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 13),
        Input(
          controller: controller,
          error: error,
          errorText: errorText,
          onTap:
              () async =>
                  onPicked(await DateTimePickerUtils.selectDateTime(context)),
          hint: Hints.dateTime,
          readOnly: true,
          width: double.infinity,
          suffixIcon: Image.asset('assets/icons/calender.png'),
        ),
      ],
    );
  }
}
