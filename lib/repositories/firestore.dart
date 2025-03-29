import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:split/models/tasks.dart';
import 'package:split/utils/constants/constant.dart';

class FirestoreRepo {
  // save task
  static Future<bool> save({String? taskId, required Task task}) async {
    try {
      final firestore = FirebaseFirestore.instance.collection(
        KeyTask.collectionkey,
      );
      bool i = false;
      if (taskId == null || taskId.isEmpty) {
        log("task: $task -- [In Repo]");
        log("name: ${task.name}");
        log("start: ${task.startDateTime}");
        log("end: ${task.endDateTime}");
        log("priority: ${task.priority}");
        log("status: ${task.status}");
        final rs = await firestore.add(task.toJson());
        i = rs.id != '';
        log('i: $i | rs: ${rs.id}');
      } else {
        await firestore
            .doc(taskId)
            .set(task.toJson())
            .catchError((error) => log("Error: $error"))
            .whenComplete(() => i = true);
      }
      return i;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  //delete task
  static Future<bool> remove(String taskId) async {
    try {
      bool rs = false;
      await FirebaseFirestore.instance
          .collection(KeyTask.collectionkey)
          .doc(taskId)
          .delete()
          .catchError((error) => log('Error : $error'))
          .whenComplete(() => rs = true);
      return rs;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }
}
