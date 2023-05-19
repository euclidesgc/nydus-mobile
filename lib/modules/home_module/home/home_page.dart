import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  HomePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final pageRoutes = [
    '/home_module/paychek_module/',
    '/home_module/clocking_module/',
    '/home_module/dashboard_module/',
    '/home_module/vacation_module/',
    '/home_module/profile_module/',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(
        child: Text('Drawer'),
      ),
      body: const Row(
        children: [
          Expanded(
            child: RouterOutlet(),
          ),
        ],
      ),
      bottomNavigationBar: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.indigo,
          unselectedItemColor: Colors.indigo.shade200,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: controller.selectedMenu,
          onTap: (index) {
            setState(() {
              controller.selectedMenu = index;
              Modular.to.navigate(pageRoutes[controller.selectedMenu]);
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.price_change),
              label: 'contra-cheque',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.query_builder),
              label: 'ponto',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.house),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.nightlife),
              label: 'férias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'perfil',
            ),
          ],
        );
      }),
    );
  }
}
