import 'package:package_manager/package_manager.dart';

import 'paycheck/paycheck_page.dart';

class PaycheckModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const PaycheckPage(),
        ),
      ];
}
