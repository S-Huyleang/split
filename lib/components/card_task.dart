import 'package:flutter/material.dart';
import 'package:split/models/tasks.dart';
import 'package:split/utils/constants/constant.dart';
import 'package:split/utils/enums/global.dart';
import 'package:split/utils/themes/app_themes.dart';

class CardTask extends StatelessWidget {
  const CardTask({super.key, this.task, this.onDelete, this.onTap});

  final Task? task;
  final void Function()? onDelete, onTap;

  String _truncateString(String? text, int maxLength, [String ellipsis = '']) {
    if (text == null) return '';
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}$ellipsis';
  }

  @override
  Widget build(BuildContext context) {
    final color =
        (task?.priority == Priorities.high)
            ? AppTheme.error
            : (task?.priority == Priorities.medium)
            ? AppTheme.warning
            : AppTheme.primary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: color.withValues(alpha: 0.05),
          border: Border.all(
            color: AppTheme.dotGray.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(radius: 6, backgroundColor: color),
                    const SizedBox(width: 8),
                    Text(
                      _truncateString(task?.name?.toUpperCase(), 36, '..'),
                      style: AppTheme.textStyle(
                        fontSize: Sizes.lg,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onDelete,
                  child: Image.asset(
                    'assets/icons/delete.png',
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              _truncateString(task?.description, 50, '...'),
              style: AppTheme.textStyle(color: AppTheme.gray),
            ),
          ],
        ),
      ),
    );
  }
}
