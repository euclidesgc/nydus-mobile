import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.directional(
            textDirection: Directionality.of(context),
            bottom: 0,
            end: 0,
            child: Image.asset(
              'assets/images/qr_code_background.png',
              package: 'design_system',
              fit: BoxFit.fitWidth,
              height: MediaQuery.of(context).size.height * 0.55,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('QR Code', style: TextStyle(fontSize: 30)),
                const SizedBox(height: 20),
                const Text('Faça a leitura para ter acesso'),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: AppButton(
                    label: 'Ler agora',
                    onPressed: () => Modular.to.pushNamed('read_qr_code'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
