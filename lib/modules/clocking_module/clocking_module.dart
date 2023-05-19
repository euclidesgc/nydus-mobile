import 'package:package_manager/package_manager.dart';

import 'clocking/clocking_page.dart';

class ClockingModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const ClockingPage(),
        ),
      ];
}
