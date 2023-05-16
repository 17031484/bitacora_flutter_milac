import 'package:flutter/material.dart';
import 'package:test_app/b_insOcular/emergencia.dart';
import '../global.dart' as globals;
import 'AppButtons.dart';

class CInterna extends StatefulWidget {
  const CInterna({super.key});

  @override
  State<CInterna> createState() => _CInternaState();
}

class _CInternaState extends State<CInterna> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: const Text('Area de Combustión Interna'),
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
                  'Revisión Interior',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            buildCInterna()
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
          Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 1500),
              pageBuilder: (context, _, __) => Emergencia(),
              transitionsBuilder: (_, animation, __, child) {
                return SlideTransition(
                  position: Tween(begin: Offset(1, 0), end: Offset.zero)
                      .animate(CurvedAnimation(
                          parent: animation, curve: Curves.easeInOut)),
                  child: child,
                );
              },
            ),
          );
        },
        child: const Text('Guardar'),
      ),
    );
  }

  Widget buildCInterna() {
    return Column(
      children: [
        const ListTile(
          //Primera pregunta
          title: Text('MOTOR'),
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
                    globals.selectedIndex[60] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[60] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[60] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[60] == index
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
          title: Text('RADIADOR'),
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
                    globals.selectedIndex[61] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[61] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[61] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[61] == index
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
          title: Text('BATERIA'),
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
                    globals.selectedIndex[62] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[62] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[62] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[62] == index
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
          title: Text('BANDAS'),
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
                    globals.selectedIndex[63] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[63] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[63] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[63] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    text: index == 0
                        ? 'Buen estado'
                        : index == 1
                            ? 'No aplica'
                            : 'Mal estado'));
          }),
        ), SizedBox(height: 5,)
      ],
    );
  }
}
