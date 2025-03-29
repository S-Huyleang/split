import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split/utils/constants/constant.dart';
import 'package:split/utils/enums/global.dart';
import 'package:split/utils/themes/app_themes.dart';

class PriorityController extends GetxController {
  var selectedPriority = Priorities.low.obs;

  void setPriority(Priorities priority) {
    selectedPriority.value = priority;
  }
}

class PrioritySelector extends StatelessWidget {
  final Priorities? initialValue;
  final void Function(Priorities)? onPriorityChanged;

  PrioritySelector({super.key, this.initialValue, this.onPriorityChanged});

  final PriorityController controller = Get.put(PriorityController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
              Priorities.values.map((priority) {
                return PriorityOption(
                  label: priority.name.capitalizeFirst ?? '',
                  isSelected: controller.selectedPriority.value == priority,
                  backgroundColor:
                      controller.selectedPriority.value == priority
                          ? _getPriorityColor(priority)
                          : _getPriorityColor(priority).withValues(alpha: 0.1),
                  textColor:
                      controller.selectedPriority.value == priority
                          ? AppTheme.dotGray
                          : AppTheme.darkGray,
                  onTap: () {
                    controller.setPriority(priority);
                    onPriorityChanged?.call(priority);
                  },
                );
              }).toList(),
        ),
      ),
    );
  }

  Color _getPriorityColor(Priorities priority) {
    switch (priority) {
      case Priorities.low:
        return AppTheme.primary;
      case Priorities.medium:
        return AppTheme.warning;
      case Priorities.high:
        return AppTheme.error;
    }
  }
}

class PriorityOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  const PriorityOption({
    super.key,
    required this.label,
    required this.isSelected,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: AppTheme.textStyle(
            color: textColor,
            fontSize: Sizes.md,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
