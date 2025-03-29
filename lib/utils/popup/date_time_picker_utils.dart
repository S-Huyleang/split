import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:split/utils/themes/app_themes.dart';

class DateTimePickerUtils {
  static Future<DateTime?> selectDateTime(BuildContext context) async {
    DateTime? picked;
    if (Platform.isIOS) {
      await showCupertinoModalPopup<DateTime>(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8),
            child: Container(
              height: 200,
              color: AppTheme.dotGray.withValues(alpha: 0.5),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                use24hFormat: true,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime dateTime) => picked = dateTime,
              ),
            ),
          );
        },
      );
    } else {
      DateTime? date = await selectDate(context);
      if (date != null) {
        if (!context.mounted) return null;
        TimeOfDay? time = await selectTime(context, use24HourFormat: true);
        if (time != null) {
          picked = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        }
      }
    }
    return picked;
  }

  static Future<DateTime?> selectDate(BuildContext context) async {
    DateTime? picked;
    if (Platform.isIOS) {
      showCupertinoModalPopup<DateTime>(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8),
            child: Container(
              height: 200,
              color: AppTheme.dotGray.withValues(alpha: 0.5),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime? dateTime) => picked = dateTime,
              ),
            ),
          );
        },
      );
    } else {
      picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime(2500),
      );
    }
    return picked;
  }

  static Future<TimeOfDay?> selectTime(
    BuildContext context, {
    required bool use24HourFormat,
  }) async {
    TimeOfDay? picked;
    if (Platform.isIOS) {
      return await showCupertinoModalPopup<TimeOfDay>(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8),
            child: Container(
              height: 200,
              color: AppTheme.dotGray.withValues(alpha: 0.5),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                use24hFormat: use24HourFormat,
                initialDateTime: DateTime.now(),
                onDateTimeChanged:
                    (DateTime dateTime) =>
                        picked = TimeOfDay.fromDateTime(dateTime),
              ),
            ),
          );
        },
      );
    } else {
      picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(alwaysUse24HourFormat: use24HourFormat),
            child: child!,
          );
        },
      );
    }
    return picked;
  }
}

class DialogUtils {
  static Future<bool?> showConfirmDialog(
    BuildContext context, {
    required String title,
    required String content,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    Widget? widget,
  }) async {
    if (Platform.isIOS) {
      return await showCupertinoDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Column(children: [if (widget != null) widget, Text(title)]),
            content: Text(content),
            actions: [
              CupertinoDialogAction(
                child: Text(cancelText),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              CupertinoDialogAction(
                child: Text(confirmText),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          );
        },
      );
    } else {
      return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [if (widget != null) widget, Text(title)],
            ),
            content: Text(content),
            actions: [
              TextButton(
                child: Text(cancelText),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              TextButton(
                child: Text(confirmText),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          );
        },
      );
    }
  }
}
