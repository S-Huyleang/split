import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split/components/card_task.dart';
import 'package:split/components/heading_section.dart';
import 'package:split/components/show_number_of_tasks.dart';
import 'package:split/controllers/views/view_controller.dart';
import 'package:split/routes/global.dart';
import 'package:split/utils/themes/app_themes.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final viewController = Get.put(ViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewController.navigation(AppRouter.edit),
        backgroundColor: AppTheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Image.asset('assets/icons/docs.png'),
      ),
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
              children: [
                const SizedBox(height: 32),

                /// Top section with logo & name with actions
                HeadingSection(),
                const SizedBox(height: 29),
                ShowNumberOfTasks(
                  low: viewController.low.value,
                  medium: viewController.medium.value,
                  high: viewController.high.value,
                ),
                const SizedBox(height: 24),
                ...List.generate(
                  viewController.tasks.length,
                  (index) => CardTask(
                    task: viewController.tasks[index],
                    onTap: () => viewController.navigation(AppRouter.edit),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
