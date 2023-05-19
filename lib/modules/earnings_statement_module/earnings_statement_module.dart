import 'package:package_manager/package_manager.dart';

import 'earnings_statement/earnings_statement_page.dart';

class EarningsStatementModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const EarningsStatementPage(),
        ),
      ];
}
