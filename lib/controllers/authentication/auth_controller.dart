import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split/models/user.dart';
import 'package:split/repositories/firebase_auth.dart';
import 'package:split/routes/global.dart';
import 'package:split/stores/local_storage.dart';
import 'package:split/utils/exceptions/firebase_auth_exception.dart';

class AuthController extends GetxController {
  /// this is a boolean variable that will be used to toggle between login and register view
  final isLogin = true.obs;
  final errorText = "".obs;

  /// this is a controller for the username text field
  final emailTextController = TextEditingController();

  /// this is a controller for the password text field
  final passwordTextController = TextEditingController();

  /// this is a controller for the confirm password text field
  final confirmPasswordTextController = TextEditingController();

  /// this function will clear the text fields
  void clearTextFields() {
    emailTextController.text = '';
    passwordTextController.text = '';
    confirmPasswordTextController.text = '';
  }

  /// this function will toggle the view between login and register
  void togleAuthenticationView() async {
    isLogin.value = !isLogin.value;
    errorText.value = '';
    clearTextFields();
    update();
  }

  /// this function will be used to login the user
  Future<void> loginOrSignUp() async {
    if (!fieldsNotNull) {
      errorText.value = "Please enter your account";
      return;
    }

    final user = Users(
      email: emailTextController.text,
      password: passwordTextController.text,
    );

    try {
      final uid =
          isLogin.value
              ? await BasicAuth.login(user)
              : await BasicAuth.register(user);
      log('user : $uid');
      if (uid != null) {
        LocalStorages.setCurrentUser(uid);
        Get.offAllNamed(AppRouter.home);
        clearTextFields();
      }
    } on FirebaseAuthException catch (e) {
      errorText.value = AppFirebaseAuthExceptions(e.code).message;
    }
  }

  bool get fieldsNotNull =>
      (isLogin.value)
          ? (emailTextController.text.isNotEmpty &&
              passwordTextController.text.isNotEmpty)
          : (emailTextController.text.isNotEmpty &&
              passwordTextController.text.isNotEmpty &&
              confirmPasswordTextController.text.isNotEmpty);

  bool get isMatchPassword =>
      passwordTextController.text == confirmPasswordTextController.text;
}
