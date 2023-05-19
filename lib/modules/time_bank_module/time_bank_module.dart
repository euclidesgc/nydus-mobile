import 'package:package_manager/package_manager.dart';

import 'time_bank/time_bank_page.dart';

class TimeBankModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const TimeBankPage(),
        ),
      ];
}
