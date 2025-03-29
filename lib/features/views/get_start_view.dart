import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split/components/button.dart';
import 'package:split/routes/global.dart';
import 'package:split/utils/constants/constant.dart';
import 'package:split/utils/themes/app_themes.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Top section with image and dot
            const SizedBox(height: 80),
            Expanded(
              flex: 3,
              child: Image.asset('assets/images/get-start.png'),
            ),
            const SizedBox(height: 31),

            // Text "Split"
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    Text(
                      'Split',
                      style: AppTheme.textStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Description text
                    Text(
                      'This productive tool is designed to help\nyou better manage your task\nproject-wise conveniently!',
                      textAlign: TextAlign.center,
                      style: AppTheme.textStyle(fontSize: Sizes.md),
                    ),
                    const SizedBox(height: 57),
                    // Start button
                    Button(
                      onTap: () => Get.offAllNamed(AppRouter.authenticate),
                      width: 260,
                      fontSize: Sizes.lg,
                      fontWeight: FontWeight.w600,
                      text: 'Start',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
