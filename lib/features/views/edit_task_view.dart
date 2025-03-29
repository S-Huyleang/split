import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split/components/date_time_picker.dart';
import 'package:split/components/input.dart';
import 'package:split/components/priority_selector.dart';
import 'package:split/components/status_popup_button.dart';
import 'package:split/controllers/views/view_controller.dart';
import 'package:split/routes/global.dart';
import 'package:split/utils/constants/constant.dart';
import 'package:split/utils/enums/global.dart';
import 'package:split/utils/extensions/global.dart';
import 'package:split/utils/themes/app_themes.dart';

class EditTaskView extends StatelessWidget {
  EditTaskView({super.key});

  final viewController = Get.put(ViewController());

  @override
  Widget build(BuildContext context) {
    var isClickedFAB = 0.obs;
    var isClickedStatus = false;
    return Obx(
      () => Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/blur-background_2.png'),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left section with back arrow and title
                      Row(
                        children: [
                          GestureDetector(
                            onTap:
                                () => viewController.navigation(AppRouter.home),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AppTheme.darkGray,
                              size: 16,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Create a new task',
                            style: AppTheme.textStyle(
                              fontSize: Sizes.xl,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      // Right section with save text and menu icon
                      Row(
                        children: [
                          StatusPopupButton(
                            icon: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/dropdown.png',
                                  width: 18,
                                  height: 18,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  !isClickedStatus
                                      ? 'Status'
                                      : viewController.status.value.toString(),
                                  style: AppTheme.textStyle(
                                    color: AppTheme.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            onSelected: (status) {
                              isClickedStatus = true;
                              viewController.status.value = status;
                            },
                          ),
                          if (viewController.task.value.id != null)
                            const SizedBox(width: 15),
                          if (viewController.task.value.id != null)
                            GestureDetector(
                              onTap:
                                  () => viewController.validateAndSave(
                                    CurrentAction.delete,
                                  ),
                              child: Image.asset(
                                'assets/icons/delete.png',
                                width: 20,
                                height: 20,
                                fit: BoxFit.cover,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 39),
                  // Form fields
                  // Name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Task Name',
                        style: AppTheme.textStyle(
                          fontSize: Sizes.lg,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 13),
                      Input(
                        hint: 'What do you need to do?',
                        controller: viewController.nameController,
                        error:
                            isClickedFAB.value > 0 &&
                            viewController.nameController.text.isEmpty,
                        errorText: 'Task Name is required.',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Start Date & Start time
                  DateTimePicker(
                    controller: viewController.startDateTimeController,
                    error:
                        isClickedFAB.value > 0 &&
                        viewController.startDateTimeController.text.isEmpty,
                    errorText: "Start date is required.",
                    header: 'Start Date',
                    onPicked: (date) {
                      if (date == null) return;
                      viewController.startDateTimeController.text =
                          date.formatDateTime();
                    },
                  ),
                  const SizedBox(height: 24),
                  // End Date & End time
                  DateTimePicker(
                    controller: viewController.endDateTimeController,
                    error:
                        isClickedFAB.value > 0 &&
                        viewController.endDateTimeController.text.isEmpty,
                    errorText: "End date is required.",
                    header: 'To Date',
                    onPicked: (date) {
                      if (date == null) return;
                      viewController.endDateTimeController.text =
                          date.formatDateTime();
                    },
                  ),
                  // Priority
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Priority',
                        style: AppTheme.textStyle(
                          fontSize: Sizes.lg,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 13),
                      PrioritySelector(
                        initialValue: Priorities.low,
                        onPriorityChanged: (priority) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Description
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: AppTheme.textStyle(
                          fontSize: Sizes.lg,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 13),
                      Input(
                        controller: viewController.descriptionController,
                        error:
                            isClickedFAB.value > 0 &&
                            viewController.descriptionController.text.isEmpty,
                        errorText: "Description is required.",
                        height: 300,
                        keyboardType: TextInputType.multiline,
                        maxLine: null,
                        maxLength: 400,
                        hint: 'Write your description...',
                      ),
                      if (isClickedFAB.value > 0 &&
                          viewController.descriptionController.text.isEmpty)
                        const SizedBox(height: 13),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            isClickedFAB.value++;
            viewController.validateAndSave();
          },
          backgroundColor: AppTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Image.asset(
            'assets/icons/add.png',
            width: 26,
            height: 26,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
