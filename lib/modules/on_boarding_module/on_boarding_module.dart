import 'package:package_manager/package_manager.dart';

import 'forgot_password/forgot_password_page.dart';
import 'login/data/datasources/authorize_datasource_impl.dart';
import 'login/data/datasources/get_profile_datasource_impl.dart';
import 'login/domain/repositories/authorize_repository.dart';
import 'login/domain/repositories/get_profile_repository.dart';
import 'login/domain/usecase/authorize_usecase.dart';
import 'login/domain/usecase/get_profile_usecase.dart';
import 'login/infrastructure/datasource/authorize_datasource.dart';
import 'login/infrastructure/datasource/get_profile_datasource.dart';
import 'login/infrastructure/repositories/authorize_repository_impl.dart';
import 'login/infrastructure/repositories/get_profile_repository_impl.dart';
import 'login/presentation/login_page.dart';
import 'login/presentation/login_reducer.dart';
import 'qr_code/qr_code_page.dart';
import 'qr_code/read_qr_code_page.dart';

class OnBoardingModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          <ClientHttp>(i) => ClientHttpDioImpl(),
        ),
        Bind.lazySingleton(
          <AuthorizeDatasource>(i) =>
              AuthorizeDatasourceImpl(clientHttp: i<ClientHttp>()),
        ),
        Bind.lazySingleton(
          <GetProfileDatasource>(i) =>
              GetProfileDatasourceImpl(clientHttp: i<ClientHttp>()),
        ),
        Bind.lazySingleton(
          <AuthorizeRepository>(i) => AuthorizeRepositoryImpl(
            datasource: i<AuthorizeDatasource>(),
          ),
        ),
        Bind.lazySingleton(
          <GetProfileRepository>(i) => GetProfileRepositoryImpl(
            datasource: i<GetProfileDatasource>(),
          ),
        ),
        Bind.lazySingleton(
          (i) => AuthorizeUsecase(repository: i<AuthorizeRepository>()),
        ),
        Bind.lazySingleton(
          (i) => GetProfileUsecase(repository: i<GetProfileRepository>()),
        ),
        Bind.singleton(
          (i) => LoginReducer(
            authorizeUsecase: i<AuthorizeUsecase>(),
            getProfileUsecase: i<GetProfileUsecase>(),
          ),
        ),
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
          child: (context, args) => const LoginPage(),
        ),
        ChildRoute(
          '/forgot_password',
          child: (context, args) => const ForgotPasswordPage(),
        ),
      ];

  
}
