import 'package:package_manager/package_manager.dart';

import 'forgot_password/forgot_password_page.dart';
import 'login/login_page.dart';
import 'qr_code/qr_code_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [];

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
          '/login',
          child: (context, args) => const LoginPage(),
        ),
        ChildRoute(
          '/forgot_password',
          child: (context, args) => const ForgotPasswordPage(),
        ),
      ];
}
