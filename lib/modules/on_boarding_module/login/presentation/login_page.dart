import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

import 'login_states.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final tfcUserName = TextEditingController();
  final tfcPassword = TextEditingController();

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
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                AppText(
                  text: 'Entre com seus dados',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 60),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      onChanged: () => validateFormAction(),
      child: Column(
        children: [
          RxBuilder(builder: (context) {
            return AppTextFormField(
              labelText: 'Usuário',
              errorText: userNameErrorText.value,
              onChanged: (value) => validateUserNameAction.value = value,
            );
          }),
          const SizedBox(height: 32),
          RxBuilder(builder: (context) {
            return AppTextFormField(
              labelText: 'Senha',
              obscureText: true,
              errorText: passwordErrorText.value,
              onChanged: (value) => validatePasswordAction.value = value,
            );
          }),
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
              if (loginState.value == LoginState.loading) {
                return const CircularProgressIndicator();
              } else {
                return AppButton(
                  label: 'Entrar',
                  onPressed: formIsValid.value ? () => loginAction() : null,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
