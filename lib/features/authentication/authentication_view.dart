import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split/components/button.dart';
import 'package:split/components/input.dart';
import 'package:split/controllers/authentication/auth_controller.dart';
import 'package:split/utils/constants/constant.dart';
import 'package:split/utils/themes/app_themes.dart';

class AuthenticationView extends StatelessWidget {
  AuthenticationView({super.key});

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => SafeArea(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/blur-background_2.png'),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(flex: 2),
                  // Logo and Name
                  Image.asset('assets/icons/logo.png', width: 56),
                  const SizedBox(height: 56),
                  Text(
                    'Welcome to Split',
                    style: AppTheme.textStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Please enter your username & password to ${authController.isLogin.value ? 'login' : 'create'} your account.',
                    style: AppTheme.textStyle(color: AppTheme.gray),
                  ),
                  const SizedBox(height: 50),
                  Input(
                    hint: 'Enter your email',
                    controller: authController.emailTextController,
                  ),
                  const SizedBox(height: 24),
                  Input(
                    hint: 'Enter your password',
                    isPasswordField: true,
                    controller: authController.passwordTextController,
                  ),
                  SizedBox(height: authController.isLogin.value ? 0 : 24),
                  if (!authController.isLogin.value)
                    Input(
                      hint: 'Enter your confirm password',
                      isPasswordField: true,
                      controller: authController.confirmPasswordTextController,
                    ),
                  if (authController.errorText.isNotEmpty) SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      authController.errorText.value,
                      style: AppTheme.textStyle(
                        color: AppTheme.error,
                        fontSize: Sizes.sm,
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Button(
                    onTap: () async => authController.loginOrSignUp(),
                    fontSize: Sizes.lg,
                    fontWeight: FontWeight.w600,
                    text:
                        authController.isLogin.value
                            ? 'Login'
                            : 'Create Account',
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => authController.togleAuthenticationView(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          authController.isLogin.value
                              ? "Don't have an account? "
                              : "Already have account yet? ",
                          style: AppTheme.textStyle(),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          authController.isLogin.value ? 'Sign Up' : 'Login',
                          style: AppTheme.textStyle(color: Colors.blue[800]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 51),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
