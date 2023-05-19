import 'package:package_manager/package_manager.dart';

import 'evaluation/evaluation_page.dart';

class EvaluationModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const EvaluationPage(),
        ),
      ];
}
