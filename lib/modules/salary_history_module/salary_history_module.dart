import 'package:package_manager/package_manager.dart';

import 'salary_history/salary_history_page.dart';

class SalaryHistoryModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const SalaryHistoryPage(),
        ),
      ];
}
