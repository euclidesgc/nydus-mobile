import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppButton(
              label: 'Esqueceu a senha',
              onPressed: () {
                log('Esqueceu a senha!');
                return Modular.to.pushNamed('/forgot_password');
              },
            ),
            AppButton(
              label: 'Entrar',
              onPressed: () => Modular.to.navigate('/home/'),
            ),
          ],
        ),
      )),
    );
  }
}
