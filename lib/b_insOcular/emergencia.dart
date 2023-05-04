import 'package:flutter/material.dart';
import 'package:test_app/b_insOcular/parte_posterior.dart';
import '../global.dart' as globals;
import 'AppButtons.dart';

class Emergencia extends StatefulWidget {
  const Emergencia({super.key});

  @override
  State<Emergencia> createState() => _EmergenciaState();
}

class _EmergenciaState extends State<Emergencia> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: const Text('Equipo de Emergencia'),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
            padding: EdgeInsets.zero, children: <Widget>[buildContent()]),
        bottomNavigationBar: buildfixedButton(),
      )),
    );
  }

  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: const Color.fromARGB(215, 151, 238, 144),
        child: Column(
          children: <Widget>[
            const ListTile(
              title: Center(
                child: Text(
                  'Equipo de Emergencia',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            buildEmergencia()
          ],
        ),
      ),
    );
  }

  Widget buildfixedButton() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: () {
          print(globals.selectedIndex);
          Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => PartePosterior()));
        },
        child: const Text('Guardar'),
      ),
    );
  }

  Widget buildEmergencia() {
    return Column(
      children: [
        const ListTile(
          //Primera pregunta
          title: Text('LIBRO U HOJA DE INFORMACIÓN DE EMERGENCIA'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(3, (index) {
            return InkWell(
                onTap: () {
                  setState(() {
                    globals.selectedIndex[64] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[64] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[64] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[64] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    text: index == 0
                        ? 'Buen estado'
                        : index == 1
                            ? 'No aplica'
                            : 'Mal estado'));
          }),
        ),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Segunda pregunta
          title: Text('BOTIQUIN DE PRIMEROS AUXILIOS'),
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.center, //Center Row contents horizontally,
          crossAxisAlignment:
              CrossAxisAlignment.center, //Center Row contents vertically,
          children: List.generate(3, (index) {
            return InkWell(
                onTap: () {
                  setState(() {
                    globals.selectedIndex[65] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[65] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[65] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[65] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    text: index == 0
                        ? 'Buen estado'
                        : index == 1
                            ? 'No aplica'
                            : 'Mal estado'));
          }),
        ),SizedBox(height: 10,),
        const ListTile(
          //Primera pregunta
          title: Text(
              'EQUIPO DE SEGURIRDAD (DE ACUERDO A LA INFORMACION DE EMERGENCIA DE TRANSPORTACION)'),
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.center, //Center Row contents horizontally,
          crossAxisAlignment:
              CrossAxisAlignment.center, //Center Row contents vertically,
          children: List.generate(3, (index) {
            return InkWell(
                onTap: () {
                  setState(() {
                    globals.selectedIndex[66] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[66] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[66] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[66] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    text: index == 0
                        ? 'Buen estado'
                        : index == 1
                            ? 'No aplica'
                            : 'Mal estado'));
          }),
        ),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('TRIANGULOS DE SEGURIDAD (MINIMO 3)'),
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.center, //Center Row contents horizontally,
          crossAxisAlignment:
              CrossAxisAlignment.center, //Center Row contents vertically,
          children: List.generate(3, (index) {
            return InkWell(
                onTap: () {
                  setState(() {
                    globals.selectedIndex[67] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[67] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[67] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[67] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    text: index == 0
                        ? 'Buen estado'
                        : index == 1
                            ? 'No aplica'
                            : 'Mal estado'));
          }),
        ),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('RETRANCAS (MINIMO 2)'),
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.center, //Center Row contents horizontally,
          crossAxisAlignment:
              CrossAxisAlignment.center, //Center Row contents vertically,
          children: List.generate(3, (index) {
            return InkWell(
                onTap: () {
                  setState(() {
                    globals.selectedIndex[68] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[68] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[68] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[68] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    text: index == 0
                        ? 'Buen estado'
                        : index == 1
                            ? 'No aplica'
                            : 'Mal estado'));
          }),
        ),SizedBox(height: 5,)
      ],
    );
  }
}
