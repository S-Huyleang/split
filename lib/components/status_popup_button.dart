import 'package:flutter/material.dart';
import 'package:split/utils/enums/global.dart';
import 'package:split/utils/themes/app_themes.dart';

class StatusPopupButton extends StatelessWidget {
  const StatusPopupButton({super.key, this.onSelected, required this.icon});

  final void Function(Status)? onSelected;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Status>(
      onSelected: onSelected,
      icon: icon,
      elevation: 0,
      borderRadius: BorderRadius.circular(6),
      color: AppTheme.primary.withValues(alpha: 0.9),
      padding: const EdgeInsets.all(0),
      itemBuilder:
          (BuildContext context) => [
            PopupMenuItem(
              value: Status.pending,
              child: Text(
                "Pending",
                style: AppTheme.textStyle(color: AppTheme.dotGray),
              ),
            ),

            PopupMenuItem(
              value: Status.completing,
              child: Text(
                "Completing",
                style: AppTheme.textStyle(color: AppTheme.dotGray),
              ),
            ),

            PopupMenuItem(
              value: Status.completed,
              child: Text(
                "Completed",
                style: AppTheme.textStyle(color: AppTheme.dotGray),
              ),
            ),
          ],
    );
  }
}
