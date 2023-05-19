import 'package:nydus_mobile/modules/paycheck_module/paycheck/paycheck_page.dart';
import 'package:package_manager/package_manager.dart';

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
