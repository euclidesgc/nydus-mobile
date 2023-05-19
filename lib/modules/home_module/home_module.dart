import 'package:nydus_mobile/modules/paycheck_module/paycheck_module.dart';
import 'package:package_manager/package_manager.dart';

import '../clocking_module/clocking_module.dart';
import '../dashboard_module/dashboard_module.dart';
import '../profile_module/profile_module.dart';
import '../vacation_module/vacation_module.dart';
import 'home/home_controller.dart';
import 'home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          transition: TransitionType.fadeIn,
          duration: const Duration(milliseconds: 500),
          child: (context, args) => HomePage(
            controller: Modular.get<HomeController>(),
          ),
          children: [
            ModuleRoute(
              '/paychek_module',
              module: PaycheckModule(),
              transition: TransitionType.fadeIn,
              duration: const Duration(milliseconds: 500),
            ),
            ModuleRoute(
              '/clocking_module',
              module: ClockingModule(),
              transition: TransitionType.fadeIn,
              duration: const Duration(milliseconds: 500),
            ),
            ModuleRoute(
              '/dashboard_module',
              module: DashboardModule(),
              transition: TransitionType.fadeIn,
              duration: const Duration(milliseconds: 500),
            ),
            ModuleRoute(
              '/vacation_module',
              module: VacationModule(),
              transition: TransitionType.fadeIn,
              duration: const Duration(milliseconds: 500),
            ),
            ModuleRoute(
              '/profile_module',
              module: ProfileModule(),
              transition: TransitionType.fadeIn,
              duration: const Duration(milliseconds: 500),
            ),
          ],
        ),
      ];
}
