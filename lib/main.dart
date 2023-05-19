import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

import 'app_module.dart';
import 'app_widget.dart';
import 'splash/splash_page.dart';

void main() async {
  runApp(const SplashPage());

  // Carregar configurações iniciais
  await Future.wait([
    //Conecta firebase
    Future.delayed(const Duration(seconds: 1)),
    //Conecta analitics
    Future.delayed(const Duration(seconds: 1)),
    //Conecta crashlytics
    Future.delayed(const Duration(seconds: 1)),
  ]);

  Modular.setInitialRoute('/on_boarding_module/');

  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
