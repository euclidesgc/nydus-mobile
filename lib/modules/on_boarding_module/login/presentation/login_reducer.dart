import 'dart:developer';

import 'package:package_manager/package_manager.dart';

import '../../../shared/shared.dart';
import '../domain/entities/auth_params_entity.dart';
import '../domain/errors/errors.dart';
import '../domain/usecase/authorize_usecase.dart';
import '../domain/usecase/get_profile_usecase.dart';
import 'login_states.dart';

class LoginReducer extends RxReducer {
  final AuthorizeUsecase authorizeUsecase;
  final GetProfileUsecase getProfileUsecase;

  LoginReducer({
    required this.authorizeUsecase,
    required this.getProfileUsecase,
  }) {
    on(() => [validateUserNameAction.value], _validateUserName);
    on(() => [validatePasswordAction.value], _validatePassword);
    on(() => [loginAction.value], _login);
  }

  void _validateUserName() {
    if (validateUserNameAction.value == null) {
      userNameErrorText.value = 'Campo obrigatório';
    } else if (validateUserNameAction.value!.length < 3) {
      userNameErrorText.value = 'O nome deve ter no mínimo 3 caracteres';
    } else {
      userNameErrorText.value = null;
      userName.value = validateUserNameAction.value;
    }
  }

  void _validatePassword() {
    if (validatePasswordAction.value == null) {
      passwordErrorText.value = 'Campo obrigatório';
    } else if (validatePasswordAction.value!.length < 3) {
      passwordErrorText.value = 'A senha deve ter no mínimo 3 caracteres';
    } else {
      passwordErrorText.value = null;
      password.value = validatePasswordAction.value;
    }
  }

  void _login() async {
    try {
      loginLoading.value = true;

      final response = await authorizeUsecase.call(
        authParams: AuthParamsEntity(
          email: userName.value!,
          password: password.value!,
        ),
      );

      UserSession.token = response.accessToken;
      UserSession.refreshToken = response.refreshToken;

      await _getPerfil();

      Modular.to.navigate(
        '/home_module/dashboard_module/',
      );
      loginLoading.value = false;
    } on InvalidLoginError {
      loginError.value = true;
    } catch (error, stack) {
      log('📛 Error', error: error, stackTrace: stack);
      loginError.value = true;
    } finally {
      loginLoading.value = false;
    }
  }

  Future<void> _getPerfil() async {
    try {
      final response = await getProfileUsecase.call();
      UserSession.perfil = response;
    } catch (error, stack) {
      log('📛 Error', error: error, stackTrace: stack);
    }
  }

  
}
