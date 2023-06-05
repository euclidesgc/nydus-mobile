import 'package:package_manager/package_manager.dart';

//States
final userNameErrorText = RxNotifier<String?>(null);
final passwordErrorText = RxNotifier<String?>(null);

final userName = RxNotifier<String?>(null);
final password = RxNotifier<String?>(null);

final loginLoading = RxNotifier(false);
final loginError = RxNotifier(false);

//computeds
bool get formIsValid =>
    userNameErrorText.value == null &&
    passwordErrorText.value == null &&
    userName.value != null &&
    password.value != null;

//Actions
final validateUserNameAction = RxNotifier<String?>(null);
final validatePasswordAction = RxNotifier<String?>(null);

final loginAction = RxNotifier.action();
final getPerfilAction = RxNotifier.action();
