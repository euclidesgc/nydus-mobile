import 'package:package_manager/package_manager.dart';

import 'downloads/downloads_page.dart';

class DownloadsModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const DownloadsPage(),
        ),
      ];
}
