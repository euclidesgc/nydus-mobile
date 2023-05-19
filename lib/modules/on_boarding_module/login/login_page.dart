import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Text(
                'Login',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'Entre com seus dados',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 60),
              const AppTextFormField(
                labelText: 'Usuário',
              ),
              const SizedBox(height: 32),
              const AppTextFormField(
                labelText: 'Senha',
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Modular.to
                      .pushNamed('/on_boarding_module/forgot_password'),
                  child: const Text('Esqueceu a senha?'),
                ),
              ),
              const SizedBox(height: 80),
              AppButton(
                label: 'Entrar',
                onPressed: () => Modular.to.navigate('/home_module/'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
