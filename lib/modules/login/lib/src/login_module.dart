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
          child: (_, args) => const QrCodePage(),
        ),
        ChildRoute(
          '/login',
          child: (_, args) => const LoginPage(),
        ),
        ChildRoute(
          '/forgot_password',
          child: (_, args) => const ForgotPasswordPage(),
        ),
      ];
}
