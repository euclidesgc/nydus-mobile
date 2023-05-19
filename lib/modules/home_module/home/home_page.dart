import 'package:flutter/material.dart';
import 'package:package_manager/package_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const pageRoutes = [
      '/home_module/paychek_module/',
      '/home_module/clocking_module/',
      '/home_module/',
      '/home_module/vacation_module/',
      '/home_module/profile_module/',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.indigo.shade200,
        unselectedItemColor: Colors.indigo.shade200,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => Modular.to.navigate(pageRoutes[index]),
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
      ),
    );
  }
}
