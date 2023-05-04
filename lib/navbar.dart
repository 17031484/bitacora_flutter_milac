import 'package:flutter/material.dart';
import 'package:test_app/b_insOcular/revision_interna.dart';
import 'global.dart' as globals;

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  void initState() {
    //TODO: IMPLEMENT USER DATA IN NAVBAR
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(globals.operador),
            accountEmail: Text(globals.unidad),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('images/user.png'),
            ),
          ),
          ExpansionTile(
            leading: const Icon(Icons.remove_red_eye_outlined),
            title: const Text('Inspección ocular diaria'),
            children: [
              ListTile(
                title: const Text('Realizar Inspección'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CheckList()));
                },
              ),
              ListTile(
                title: const Text('Ver historial'),
                onTap: () {
                  
                },
              )
              
            ],
          )
        ],
      ),
    );
  }
}
