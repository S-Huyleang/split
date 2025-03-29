import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split/routes/global.dart';
import 'package:split/stores/local_storage.dart';
import 'package:split/utils/themes/app_themes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 1500), () async {
      if (await LocalStorages.getCurrentUser() == null ||
          await LocalStorages.getCurrentUser() == '') {
        Get.offAllNamed(AppRouter.start);
      } else {
        Get.offAllNamed(AppRouter.home);
      }
    });
  }
}

class SplashView extends StatelessWidget {
  SplashView({super.key});

  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/blur-background_2.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo and Name
            Image.asset(
              'assets/icons/logo.png',
              width: 54,
              height: 54,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 26),
            Text(
              'Split',
              style: AppTheme.textStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
