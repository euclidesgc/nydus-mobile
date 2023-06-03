import 'dart:developer';

import 'package:nydus_mobile/modules/on_boarding_module/login/domain/usecase/login_usecase.dart';
import 'package:package_manager/package_manager.dart';

import '../domain/entities/auth_params_entity.dart';
import 'login_states.dart';

class LoginReducer extends RxReducer {
  final AuthorizeUsecase usecase;

  LoginReducer({required this.usecase}) {
    on(() => [validateUserNameAction.value], _validateUserName);
    on(() => [validatePasswordAction.value], _validatePassword);
    on(
      () => [
        validateUserNameAction.value,
        validatePasswordAction.value,
        validateFormAction.value,
      ],
      _validateForm,
    );
    on(() => [loginAction.value], _login);
  }

  _validateUserName() {
    if (validateUserNameAction.value == null) {
      userNameErrorText.value = 'Campo obrigatório';
      userNameIsValid.value = false;
    } else if (validateUserNameAction.value!.length < 3) {
      userNameErrorText.value = 'O nome deve ter no mínimo 3 caracteres';
      userNameIsValid.value = false;
    } else {
      userNameIsValid.value = true;
      userNameErrorText.value = null;
    }
  }

  _validatePassword() {
    if (validatePasswordAction.value == null) {
      passwordIsValid.value = false;
      passwordErrorText.value = 'Campo obrigatório';
    } else if (validatePasswordAction.value!.length < 3) {
      passwordIsValid.value = false;
      passwordErrorText.value = 'A senha deve ter no mínimo 3 caracteres';
    } else {
      passwordIsValid.value = true;
      passwordErrorText.value = null;
    }
  }

  _validateForm() {
    if (userNameIsValid.value && passwordIsValid.value) {
      formIsValid.value = true;
    } else {
      formIsValid.value = false;
    }
  }

  _login() async {
    loginState.value = LoginState.loading;
    try {
      final response = await usecase.call(
        authParams: AuthParamsEntity(
          email: validateUserNameAction.value!,
          password: validatePasswordAction.value!,
        ),
      );
      await Future.delayed(const Duration(seconds: 3));
      loginState.value = LoginState.success;
      log('$response', name: 'Response');

      Modular.to.navigate('/home_module/dashboard_module/');
    } catch (error, stack) {
      loginState.value = LoginState.error;
      log('📛 Error', error: error, stackTrace: stack);
    }
  }
}
