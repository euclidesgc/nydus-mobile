import 'package:flutter/material.dart';

import '../../shared/shared.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = UserSession.perfil?.nome ?? '';

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Dashboard'),
      ),
      body: SizedBox(
        child: Center(
          child: Text('Dashboard - $userName'),
        ),
      ),
    );
  }
}
