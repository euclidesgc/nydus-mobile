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
      appBar: AppBar(),
      endDrawer: Drawer(
        backgroundColor: Colors.indigo.shade200,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 130),
            ListTile(
                title: const Text('Contra-cheques'),
                onTap: () {
                  Modular.to.navigate('/home_module/paychek_module/');
                  Modular.to.pop();
                }),
            ListTile(
                title: const Text('Ponto'),
                onTap: () {
                  Modular.to.navigate('/home_module/clocking_module/');
                  Modular.to.pop();
                }),
            ListTile(
                title: const Text('Banco de Horas'),
                onTap: () {
                  Modular.to.navigate('/home_module/time_bank_module/');
                  Modular.to.pop();
                }),
            ListTile(
                title: const Text('Informe de Rendimentos'),
                onTap: () {
                  Modular.to
                      .navigate('/home_module/earnings_statement_module/');
                  Modular.to.pop();
                }),
            ListTile(
                title: const Text('Férias'),
                onTap: () {
                  Modular.to.navigate('/home_module/vacation_module/');
                  Modular.to.pop();
                }),
            ListTile(
                title: const Text('Mensagens'),
                onTap: () {
                  Modular.to.navigate('/home_module/messages_module/');
                  Modular.to.pop();
                }),
            ListTile(
                title: const Text('Mural de avisos'),
                onTap: () {
                  Modular.to.navigate('/home_module/notice_board_module/');
                  Modular.to.pop();
                }),
            ListTile(
                title: const Text('Histórico Salarial'),
                onTap: () {
                  Modular.to.navigate('/home_module/salary_history_module/');
                  Modular.to.pop();
                }),
            ListTile(
                title: const Text('Avaliação'),
                onTap: () {
                  Modular.to.navigate('/home_module/evaluation_module/');
                  Modular.to.pop();
                }),
            ListTile(
                title: const Text('Download de arquivos'),
                onTap: () {
                  Modular.to.navigate('/home_module/downloads_module/');
                  Modular.to.pop();
                }),
            ListTile(
                title: const Text('Sair'),
                onTap: () {
                  Modular.to.navigate('/on_boarding_module/login');
                  Modular.to.pop();
                }),
          ],
        ),
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
