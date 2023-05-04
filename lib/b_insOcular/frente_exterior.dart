import 'package:flutter/material.dart';
import 'package:test_app/b_insOcular/lado_izd_der.dart';
import '../global.dart' as globals;
import 'AppButtons.dart';

class FrenteExterior extends StatefulWidget {
  const FrenteExterior({super.key});

  @override
  State<FrenteExterior> createState() => _FrenteExteriorState();
}

class _FrenteExteriorState extends State<FrenteExterior> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: const Text('Frente Exterior'),
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
                  'Frente Exterior',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            buildFExterior()
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
          .push(MaterialPageRoute(builder: (context) => LadoID()));
        },
        child: const Text('Guardar'),
      ),
    );
  }

  Widget buildFExterior() {
    return Column(
      children: [
        const ListTile(
          //Primera pregunta
          title: Text('DEFENSA (SUJECION)'),
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
                    globals.selectedIndex[21] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[21] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[21] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[21] == index
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
          title: Text('FAROS PRINCIPALES (FUNCIONAMIENTO)'),
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
                    globals.selectedIndex[22] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[22] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[22] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[22] == index
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
                          globals.selectedIndex[23] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[23] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[23] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[23] == index
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
                          globals.selectedIndex[24] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[24] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[24] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[24] == index
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
                          globals.selectedIndex[25] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[25] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[25] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[25] == index
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
                          globals.selectedIndex[26] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[26] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[26] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[26] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          text: index == 0
                              ? 'Buen estado'
                              : index == 1
                                  ? 'No aplica'
                                  : 'Mal estado'));
                }),
              ),
            ],
          ),
        ),
        const ListTile(
          //Primera pregunta
          title:
              Text('LLANTAS (NO RENOVADAS EN EL EJE DELANTERO, DESGASTADAS)'),
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
                    globals.selectedIndex[27] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[27] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[27] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[27] == index
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
          title: Text('RINES SIN FISURAS'),
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
                    globals.selectedIndex[28] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[28] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[28] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[28] == index
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
          title: Text('BIRLOS Y TUERCAS COMPLETOS'),
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
                    globals.selectedIndex[29] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[29] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[29] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[29] == index
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
          title: Text('GUARDA FANGOS (LODERAS)'),
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
                    globals.selectedIndex[30] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[30] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[30] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[30] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    text: index == 0
                        ? 'Buen estado'
                        : index == 1
                            ? 'No aplica'
                            : 'Mal estado'));
          }),
        ),
      ],
    );
  }
}
