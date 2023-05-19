import 'package:package_manager/package_manager.dart';

import 'notice_board/notice_board_page.dart';

class NoticeBoardModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const NoticeBoardPage(),
        ),
      ];
}
