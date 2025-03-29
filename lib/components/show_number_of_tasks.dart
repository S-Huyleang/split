import 'package:flutter/material.dart';
import 'package:split/utils/constants/constant.dart';
import 'package:split/utils/themes/app_themes.dart';

class ShowNumberOfTasks extends StatelessWidget {
  const ShowNumberOfTasks({
    super.key,
    this.low = 0,
    this.medium = 0,
    this.high = 0,
  });

  final int low;
  final int medium;
  final int high;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Priorities',
          style: AppTheme.textStyle(fontSize: Sizes.md, color: AppTheme.gray),
        ),
        Row(
          children: [
            Text(
              '$low Low',
              style: AppTheme.textStyle(
                fontSize: Sizes.md,
                color: AppTheme.primary,
              ),
            ),
            const SizedBox(width: 14),
            Text(
              '$medium Medium',
              style: AppTheme.textStyle(
                fontSize: Sizes.md,
                color: AppTheme.warning,
              ),
            ),
            const SizedBox(width: 14),
            Text(
              '$high High',
              style: AppTheme.textStyle(
                fontSize: Sizes.md,
                color: AppTheme.error,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
