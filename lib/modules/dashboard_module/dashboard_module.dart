import 'package:package_manager/package_manager.dart';

import 'dashboard/dashboard_page.dart';

class DashboardModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const DashboardPage(),
        ),
      ];
}
