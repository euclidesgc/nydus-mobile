import 'package:package_manager/package_manager.dart';

import 'profile/profile_page.dart';

class ProfileModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const ProfilePage(),
        ),
      ];
}
