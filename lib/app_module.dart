import 'dart:developer';

import 'package:package_manager/package_manager.dart';

import 'modules/home_module/home_module.dart';
import 'modules/on_boarding_module/on_boarding_module.dart';

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
        ModuleRoute('/on_boarding_module', module: OnBoardingModule()),
        ModuleRoute('/home_module', module: HomeModule()),
        // ModuleRoute('/paycheck_module', module: PaycheckModule()),
        // ModuleRoute('/clocking_module', module: ClockingModule()),
        // ModuleRoute('/vacation_module', module: VacationModule()),
        // ModuleRoute('/profile_module', module: ProfileModule()),
      ];

  @override
  void dispose() {
    super.dispose();
    log('🚌 EventBus finished!');
    Modular.get<EventBus>().destroy();
  }
}
