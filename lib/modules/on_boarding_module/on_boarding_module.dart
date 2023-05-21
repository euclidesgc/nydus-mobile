import 'package:package_manager/package_manager.dart';

import 'forgot_password/forgot_password_page.dart';
import 'login/login_page.dart';
import 'login/login_reducer.dart';
import 'qr_code/qr_code_page.dart';
import 'qr_code/read_qr_code_page.dart';

class OnBoardingModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => LoginReducer()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const QrCodePage(),
        ),
        ChildRoute(
          '/qr_code',
          child: (context, args) => const QrCodePage(),
        ),
        ChildRoute(
          '/read_qr_code',
          child: (context, args) => const ReadQrCodePage(),
        ),
        ChildRoute(
          '/login',
          child: (context, args) => LoginPage(),
        ),
        ChildRoute(
          '/forgot_password',
          child: (context, args) => const ForgotPasswordPage(),
        ),
      ];
}
