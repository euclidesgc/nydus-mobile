import 'package:package_manager/package_manager.dart';

import 'vacation/vacation_page.dart';

class VacationModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const VacationPage(),
        ),
      ];
}
