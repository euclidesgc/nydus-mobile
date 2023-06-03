import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

import '../../shared/user_session/user_session.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Dashboard'),
      ),
      body: SizedBox(
        child: Center(
          child:
              Text('Dashboard ${Modular.get<UserSession>().perfilEntity.name}'),
        ),
      ),
    );
  }
}
