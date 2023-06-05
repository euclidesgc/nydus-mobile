import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

import '../../../shared/shared.dart';
import 'login_states.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Loader, Messages {
  final tfcUserName = TextEditingController();
  final tfcPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    userName.value = null;
    password.value = null;

    tfcUserName.clear();
    tfcPassword.clear();

    loginError.addListener(() {
      if (loginError.value == true) {
        showError('Login inválido!');
      }
    });

    loginLoading.addListener(() {
      if (loginLoading.value == true) {
        showLoader();
      } else {
        hideLoader();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                AppText(
                  text: 'Login',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                AppText(
                  text: 'Entre com seus dados',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 60),
                FormWidget(formKey: formKey),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    tfcUserName.dispose();
    tfcPassword.dispose();
    loginError.removeListener(() {});
    loginLoading.removeListener(() {});

    super.dispose();
  }
}

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          RxBuilder(
            builder: (context) {
              return AppTextFormField(
                labelText: 'Usuário',
                errorText: userNameErrorText.value,
                onChanged: (value) => validateUserNameAction.value = value,
              );
            },
          ),
          const SizedBox(height: 32),
          RxBuilder(
            builder: (context) {
              return AppTextFormField(
                labelText: 'Senha',
                obscureText: true,
                errorText: passwordErrorText.value,
                onChanged: (value) => validatePasswordAction.value = value,
              );
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: AppTextButton(
              label: 'Esqueceu a senha?',
              onPressed: () =>
                  Modular.to.pushNamed('/on_boarding_module/forgot_password'),
            ),
          ),
          const SizedBox(height: 80),
          RxBuilder(
            builder: (context) {
              return AppButton(
                label: 'Entrar',
                onPressed: formIsValid ? loginAction.call : null,
              );
            },
          ),
        ],
      ),
    );
  }
}
