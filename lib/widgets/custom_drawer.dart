import 'package:flutter/material.dart';
import 'package:portifolio_flutter/controllers/navigation_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    Future<void> handleLogout() async {
      final prefs = await SharedPreferences.getInstance();
      Navigator.pushNamed(context, '/');
    }

    void _showLogoutDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Deseja sair da sua conta?'),
            content: Text('Você será desconectado do sistema'),
            actions: <Widget>[
              TextButton(
                child: Text('CANCELAR'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('OK'),
                onPressed: handleLogout,
              ),
            ],
          );
        },
      );
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(
              'Guilherme de Lamare Abreu',
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: Text('glhrmdelamare@gmail.com',
                style: TextStyle(color: Colors.white)),
            currentAccountPicture: Icon(
              Icons.account_circle,
              size: 40,
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('Agendamentos'),
                  selected: navigationProvider.selectedIndex == 0,
                  onTap: () {
                    navigationProvider.setSelectedIndex(0);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.bar_chart_rounded),
                  title: const Text('Dashboards'),
                  selected: navigationProvider.selectedIndex == 1,
                  onTap: () {
                    navigationProvider.setSelectedIndex(1);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.work_rounded),
                  title: const Text('Funcionários'),
                  selected: navigationProvider.selectedIndex == 2,
                  onTap: () {
                    navigationProvider.setSelectedIndex(2);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.people),
                  title: const Text('Clientes'),
                  selected: navigationProvider.selectedIndex == 3,
                  onTap: () {
                    navigationProvider.setSelectedIndex(3);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.inventory),
                  title: const Text('Produtos'),
                  selected: navigationProvider.selectedIndex == 4,
                  onTap: () {
                    navigationProvider.setSelectedIndex(4);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.miscellaneous_services),
                  title: const Text('Serviços'),
                  selected: navigationProvider.selectedIndex == 5,
                  onTap: () {
                    navigationProvider.setSelectedIndex(5);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.monetization_on_outlined),
                  title: const Text('Vendas'),
                  selected: navigationProvider.selectedIndex == 6,
                  onTap: () {
                    navigationProvider.setSelectedIndex(6);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.engineering),
                  title: const Text('Funções'),
                  selected: navigationProvider.selectedIndex == 7,
                  onTap: () {
                    navigationProvider.setSelectedIndex(7);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Configurações'),
                  selected: navigationProvider.selectedIndex == 8,
                  onTap: () {
                    navigationProvider.setSelectedIndex(8);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text('Logout'),
                  onTap: () => {_showLogoutDialog(context)},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}