import 'package:flutter/material.dart';
import 'package:split/repositories/firebase_auth.dart';
import 'package:split/utils/constants/constant.dart';
import 'package:split/utils/themes/app_themes.dart';

class HeadingSection extends StatelessWidget {
  const HeadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/icons/logo.png',
              width: 24,
              height: 24,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            Text(
              'My Tasks',
              style: AppTheme.textStyle(
                fontSize: Sizes.xl,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => BasicAuth.logout(context),
          child: Image.asset(
            'assets/icons/logout.png',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
