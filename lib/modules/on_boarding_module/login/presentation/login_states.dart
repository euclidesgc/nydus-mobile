import 'package:package_manager/package_manager.dart';

//States
final userNameErrorText = RxNotifier<String?>(null);
final passwordErrorText = RxNotifier<String?>(null);

final formIsValid = RxNotifier<bool>(false);
final loginState = RxNotifier<LoginState>(LoginState.idle);

//Actions
final validateUserNameAction = RxNotifier<String?>(null);
final validatePasswordAction = RxNotifier<String?>(null);
final validateFormAction = RxNotifier.action();
final loginAction = RxNotifier.action();

enum LoginState {
  loading,
  success,
  error,
  idle,
}
