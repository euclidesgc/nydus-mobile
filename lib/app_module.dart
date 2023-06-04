import 'package:package_manager/package_manager.dart';

import 'modules/home_module/home_module.dart';
import 'modules/on_boarding_module/on_boarding_module.dart';
import 'modules/shared/user_session/user_session.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<UserSession>((i) => UserSession()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/on_boarding_module', module: OnBoardingModule()),
        ModuleRoute('/home_module', module: HomeModule()),
      ];
}
