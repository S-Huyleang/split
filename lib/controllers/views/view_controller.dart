import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split/models/tasks.dart';
import 'package:split/repositories/firestore.dart';
import 'package:split/routes/global.dart';
import 'package:split/stores/local_storage.dart';
import 'package:split/utils/enums/global.dart';

class ViewController extends GetxController {
  final low = 0.obs, medium = 0.obs, high = 0.obs;
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  final nameController = TextEditingController();
  final startDateTimeController = TextEditingController();
  final endDateTimeController = TextEditingController();
  final priorityController = Priorities.low.obs;
  final descriptionController = TextEditingController();

  // Stored selected task
  final task = Task().obs;
  final action = CurrentAction.save.obs;
  final status = Status.pending.obs;

  final tasks = [].obs;

  @override
  void onInit() {
    for (var task in tasks) {
      switch (task.priority) {
        case Priorities.low:
          low.value++;
          break;
        case Priorities.medium:
          medium.value++;
          break;
        case Priorities.high:
          high.value++;
          break;
        default:
          log("⚠️ Undefined Priorities");
          break;
      }
    }
    super.onInit();
  }

  void navigation(String route, [String? taskId]) {
    Get.toNamed(route);
    if (route == AppRouter.home) clearAllField();
    if (taskId != null && taskId.isNotEmpty) {
      task.value = Task();
    }
  }

  void validateAndSave([CurrentAction actions = CurrentAction.save]) async {
    if (allControlIsEmptyOrBlank()) return;
    switch (actions) {
      case CurrentAction.save:
        {
          await bindControlToObject().whenComplete(() async {
            log("task: $task -- [In Controll]");
            log("name: ${task.value.name}");
            log("start: ${task.value.startDateTime}");
            log("end: ${task.value.endDateTime}");
            log("priority: ${task.value.priority}");
            log("status: ${task.value.status}");
            final rs = await FirestoreRepo.save(task: task.value);
            Get.snackbar('title', rs ? "Success" : "Failed");
          });
        }
        break;
      case CurrentAction.edit:
        break;
      case CurrentAction.delete:
        break;
    }
  }

  bool allControlIsEmptyOrBlank() {
    return nameController.text.trim().isEmpty &&
        startDateTimeController.text.trim().isEmpty &&
        endDateTimeController.text.trim().isEmpty &&
        descriptionController.text.trim().isEmpty;
  }

  void clearAllField() {
    nameController.clear();
    startDateTimeController.clear();
    endDateTimeController.clear();
    descriptionController.clear();
    priorityController.value = Priorities.low;
  }

  Future<void> bindControlToObject([isEdit = false]) async {
    task.value =
        !isEdit
            ? Task(
              name: nameController.text,
              startDateTime: DateTime.parse(startDateTimeController.text),
              endDateTime: DateTime.parse(endDateTimeController.text),
              priority: priorityController.value,
              description: descriptionController.text,
              status: status.value,
              createBy: await LocalStorages.getCurrentUser(),
              createAt: DateTime.now(),
              modifiedAt: DateTime.now(),
            )
            : Task(
              name: nameController.text,
              startDateTime: DateTime.parse(startDateTimeController.text),
              endDateTime: DateTime.parse(endDateTimeController.text),
              priority: priorityController.value,
              description: descriptionController.text,
              modifiedAt: DateTime.now(),
            );
    update();
  }
}
