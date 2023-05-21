import 'package:package_manager/package_manager.dart';

//States
final userNameErrorText = RxNotifier<String?>(null);
final passwordErrorText = RxNotifier<String?>(null);

final userNameIsValid = RxNotifier<bool>(false);
final passwordIsValid = RxNotifier<bool>(false);
final formIsValid = RxNotifier<bool>(false);

//Actions
final validateUserNameAction = RxNotifier<String?>(null);
final validatePasswordAction = RxNotifier<String?>(null);
final validateFormAction = RxNotifier.action();
