import 'package:flutter/material.dart';
import 'package:split/features/authentication/authentication_view.dart';
import 'package:split/features/views/edit_task_view.dart';
import 'package:split/features/views/get_start_view.dart';
import 'package:split/features/views/home_view.dart';
import 'package:split/features/views/splash_view.dart';

class AppRouter {
  // initial route name
  static const String splash = "/";
  static const String home = "/home";
  static const String edit = "/edit";
  static const String authenticate = "/auth";
  static const String start = "/start";

  // add to route map
  static final routes = <String, Widget Function(BuildContext)>{
    splash: (_) => SplashView(),
    authenticate: (_) => AuthenticationView(),
    home: (_) => HomeView(),
    edit: (_) => EditTaskView(),
    start: (_)=> GetStartView(),
  };
}
