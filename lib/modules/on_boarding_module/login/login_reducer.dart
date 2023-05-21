import 'package:package_manager/package_manager.dart';

import 'login_states.dart';

class LoginReducer extends RxReducer {
  LoginReducer() {
    on(() => [validateUserNameAction.value], _validateUserName);
    on(() => [validatePasswordAction.value], _validatePassword);
    on(() => [validateFormAction.value], _validateForm);
  }
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
