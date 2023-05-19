import 'package:package_manager/package_manager.dart';

import 'messages/messages_page.dart';

class MessagesModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const MessagesPage(),
        ),
      ];
}
