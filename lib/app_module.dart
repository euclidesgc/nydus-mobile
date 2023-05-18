import 'dart:developer';

import 'package:package_manager/package_manager.dart';

import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

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
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
      ];

  @override
  void dispose() {
    super.dispose();
    log('🚌 EventBus finished!');
    Modular.get<EventBus>().destroy();
  }
}
