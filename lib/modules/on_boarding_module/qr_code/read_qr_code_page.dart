import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

class ReadQrCodePage extends StatelessWidget {
  const ReadQrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'QR Code',
          style: TextStyle(color: Colors.black),
        ),
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Mire na câmera para o QR Code do site'),
            const SizedBox(height: 40),
            GestureDetector(
              child: Icon(
                Icons.qr_code_scanner,
                size: 200,
                color: Colors.indigo.shade200,
              ),
              onTap: () => Modular.to.navigate('/on_boarding_module/login'),
            ),
          ],
        ),
      ),
    );
  }
}
