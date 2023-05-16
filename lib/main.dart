import 'package:nydus_mobile/modules/core/lib/core.dart';
import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

import 'splash_page.dart';

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
