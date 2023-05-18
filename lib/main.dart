import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

import 'app_module.dart';
import 'app_widget.dart';
import 'splash/splash_page.dart';

void main() async {
  runApp(const SplashPage());
  await Future.delayed(const Duration(seconds: 1));

  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
