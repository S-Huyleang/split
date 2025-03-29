import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split/routes/global.dart';
import 'package:split/stores/local_storage.dart';
import 'package:split/utils/popup/date_time_picker_utils.dart';

import '../models/user.dart';

class BasicAuth {
  static Future<String?> register(Users user) async {
    try {
      final users = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      return users.user?.uid;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  static Future<String?> login(Users user) async {
    late UserCredential users;
    try {
      // disable reCAPTCHA in development mode
      await FirebaseAuth.instance
          .setSettings(appVerificationDisabledForTesting: true)
          .whenComplete(() async {
            users = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: user.email!,
              password: user.password!,
            );
          });

      return users.user?.uid;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  static Future<void> logout(BuildContext context) async {
    final yes = await DialogUtils.showConfirmDialog(
      context,
      title: "Are you sure!",
      content: "You want to Sign out.",
      widget: Image.asset(
        'assets/icons/alert.png',
        width: 54,
        height: 54,
        fit: BoxFit.cover,
      ),
    );
    if (yes == null || !yes) return;

    try {
      await FirebaseAuth.instance.signOut().whenComplete(() {
        LocalStorages.dispatchUser();
        return Get.offAllNamed(AppRouter.authenticate);
      });
    } on FirebaseAuthException catch (e) {
      log("[FirebaseAuthException]: Error while signing out! by $e");
      Get.snackbar("Error", e.message ?? '');
    }
  }
}
