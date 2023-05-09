import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_app/home.page.dart';
import '../Alerts.dart';
import '../global.dart' as globals;
import 'AppButtons.dart';
import 'localStorage.dart';
import 'dart:developer';

class Remolque extends StatefulWidget {
  const Remolque({super.key});

  @override
  State<Remolque> createState() => _RemolqueState();
}

class _RemolqueState extends State<Remolque> {
  late localStorage storage = new localStorage();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title:
              const Text('Remolque, Semiremolque (Incluyendo tipo de tanque)'),
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
                  'Remolque, Semiremolque(Incluyendo tipo de tanque)',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            buildRemolque()
          ],
        ),
      ),
    );
  }

  Widget buildfixedButton() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: () async {
          print(globals.dateString);

          if (await storage.checkListDone()) {
            log('Checklist realizado');
            //desplegar alerta
          } else {
            log('Checklist NO realizado');
            globals.respuestas = convertAnswersToString();
            storage.insertNewCheskListRow();
            Alerts.showSuccessAlert(
                context, 'Checklist realizado y almacenado correctamente');
          }
        },
        child: const Text('Guardar'),
      ),
    );
  }

  Widget buildRemolque() {
    return Column(
      children: [
        const ListTile(
          title: Text('FRENO REMOLQUE'),
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
                    globals.selectedIndex[81] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[81] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[81] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[81] == index
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
          title: Text('LINEAS ELECTRICAS (SUJETAS)'),
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
                    globals.selectedIndex[82] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[82] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[82] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[82] == index
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
          title: Text('CONEXIONES DE FRENOS'),
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
                    globals.selectedIndex[83] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[83] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[83] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[83] == index
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
          title: Text('CONEXION QUINTA RUEDA'),
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
                    globals.selectedIndex[84] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[84] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[84] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[84] == index
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
          title: Text('PATINES'),
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
                    globals.selectedIndex[85] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[85] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[85] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[85] == index
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
          title: Text('CERRADURA DE PUERTAS'),
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
                    globals.selectedIndex[86] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[86] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[86] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[86] == index
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
          title: Text('CARTELES DE RIESGO (4) O (8)'),
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
                    globals.selectedIndex[87] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[87] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[87] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[87] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    text: index == 0
                        ? 'Buen estado'
                        : index == 1
                            ? 'No aplica'
                            : 'Mal estado'));
          }),
        ),
        Card(
          color: const Color.fromARGB(214, 219, 158, 223),
          child: Column(
            children: [
              const ListTile(
                title: Center(
                  child: Text(
                    'Luces',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const ListTile(
                title: Text('DEMARCADORAS'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: List.generate(3, (index) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          globals.selectedIndex[88] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[88] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[88] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[88] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          text: index == 0
                              ? 'Buen estado'
                              : index == 1
                                  ? 'No aplica'
                                  : 'Mal estado'));
                }),
              ),
              const ListTile(
                title: Text('DE IDENTIFICACION (PORTA PLACA)'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: List.generate(3, (index) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          globals.selectedIndex[89] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[89] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[89] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[89] == index
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
                title: Text('DIRECCIONALES'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: List.generate(3, (index) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          globals.selectedIndex[90] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[90] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[90] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[90] == index
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
                title: Text('DE ESTACIONAMIENTO'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: List.generate(3, (index) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          globals.selectedIndex[91] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[91] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[91] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[91] == index
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
                title: Text('DE GALIBO (ALTURA)'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: List.generate(3, (index) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          globals.selectedIndex[92] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[92] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[92] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[92] == index
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
                title: Text('DE ADVERTENCIA'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: List.generate(3, (index) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          globals.selectedIndex[93] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[93] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[93] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[93] == index
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
                title: Text('DE FRENADO'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: List.generate(3, (index) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          globals.selectedIndex[94] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[94] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[94] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[94] == index
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
                title: Text('DE MARCHA ATRAS'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: List.generate(3, (index) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          globals.selectedIndex[95] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[95] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[95] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[95] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          text: index == 0
                              ? 'Buen estado'
                              : index == 1
                                  ? 'No aplica'
                                  : 'Mal estado'));
                }),
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ],
    );
  }

  String convertAnswersToString() {
    List<MapEntry<int, String>> mapAnswers = [];
    for (var i = 0; i < globals.selectedIndex.length; i++) {
      mapAnswers.add(MapEntry(
          i,
          globals.selectedIndex[i] == 0
              ? 'Buen estado'
              : globals.selectedIndex[i] == 1
                  ? 'No aplica'
                  : 'Mal estado'));
    }

    String json = jsonEncode(mapAnswers
        .map((entry) => {entry.key.toString(): entry.value})
        .toList());

    return json;
  }
}
