import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_app/b_insOcular/revision_interna.dart';
import 'Alerts.dart';
import 'b_insOcular/localStorage.dart';
import 'global.dart' as globals;

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  localStorage storage = new localStorage();
  @override
  void initState() {
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
                onTap: () async {
                  if (globals.no_viaje == 'SIN VIAJE')
                    Alerts.showConfirmAlert(context, Colors.amberAccent,
                        '¡Atención!', 'Debe tener un viaje asignado', 'Ok');
                  if (await storage.checkListDone())
                    Alerts.showConfirmAlert(
                        context,
                        Colors.amberAccent,
                        '¡Atención!',
                        'Usted ya realizó el checklist correspondiante del día de hoy',
                        'Ok');
                  else
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CheckList()));
                },
              ),
              ListTile(
                title: const Text('Ver historial'),
                onTap: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
