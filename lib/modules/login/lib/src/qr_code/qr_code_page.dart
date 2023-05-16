import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppButton(
              label: 'Ler imediatamente!',
              onPressed: () => Modular.to.pushNamed('/login'),
            ),
          ],
        ),
      )),
    );
  }
}
