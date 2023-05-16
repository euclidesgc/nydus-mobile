import 'dart:developer';

import 'package:home/home.dart';
import 'package:login/login.dart';
import 'package:package_manager/package_manager.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<EventBus>((i) {
          log('🚌 EventBus initialized!');
          return EventBus(sync: true);
        }),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
      ];

  @override
  void dispose() {
    super.dispose();
    Modular.get<EventBus>().destroy();
  }
}
