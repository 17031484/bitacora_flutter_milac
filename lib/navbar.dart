import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:test_app/b_insOcular/revision_interna.dart';
import 'package:test_app/home.page.dart';
import 'package:test_app/pdf/viewPDFHistory.dart';
import 'package:test_app/pdf/viewRegisters.dart';
import 'Alerts.dart';
import 'DB/localStorage.dart';
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
                    Alerts.showSuccessAlert('¡Atención!', context,
                        'Debe tener un viaje asignado', QuickAlertType.info);
                  if (await storage.checkListDone())
                    Alerts.showSuccessAlert(
                        '¡Atención!',
                        context,
                        'Usted ya realizó el checklist correspondiante del día de hoy',
                        QuickAlertType.info);
                  if (globals.no_viaje != 'SIN VIAJE' &&
                      !await storage.checkListDone())
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CheckList()));
                },
              ),
              ListTile(
                title: const Text('Ver historial'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => viewPDFHistory()));
                },
              )
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.access_time),
            title: const Text('Horas de Servicio del Conductor'),
            children: [
              ListTile(
                title: const Text('Ver registros'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => viewRegisters()));
                },
              )
            ],
          ),
          ListTile(
                leading: Icon(Icons.home),
                title: const Text('Inicio'),
                onTap: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomePage()));
                },
              )
        ],
      ),
    );
  }
}
