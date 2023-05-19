import 'package:nydus_mobile/modules/paycheck_module/paycheck_module.dart';
import 'package:package_manager/package_manager.dart';

import '../clocking_module/clocking_module.dart';
import '../profile/profile_module.dart';
import '../vacation_module/vacation_module.dart';
import 'home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
          children: [
            ModuleRoute(
              '/paychek_module',
              module: PaycheckModule(),
            ),
            ModuleRoute(
              '/clocking_module',
              module: ClockingModule(),
            ),
            ModuleRoute(
              '/vacation_module',
              module: VacationModule(),
            ),
            ModuleRoute(
              '/profile_module',
              module: ProfileModule(),
            ),
          ],
        ),
      ];
}
