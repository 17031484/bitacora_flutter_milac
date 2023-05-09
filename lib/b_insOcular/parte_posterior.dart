import 'package:flutter/material.dart';
import 'package:test_app/b_insOcular/remolque.dart';
import '../navbar.dart';
import '../global.dart' as globals;
import 'AppButtons.dart';

class PartePosterior extends StatefulWidget {
  const PartePosterior({super.key});

  @override
  State<PartePosterior> createState() => _PartePosterioState();
}

class _PartePosterioState extends State<PartePosterior> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Parte Posterior'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
          padding: EdgeInsets.zero, children: <Widget>[buildContent()]),
      bottomNavigationBar: buildfixedButton(),
    ));
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
                  'Parte Posterior',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            buildPosterior()
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
          Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Remolque()));
        },
        child: const Text('Guardar'),
      ),
    );
  }

  Widget buildPosterior() {
    return Column(
      children: [
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
                title: Text('GALIBO (ALTURA)'),
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
                          globals.selectedIndex[69] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[69] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[69] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[69] == index
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
                          globals.selectedIndex[70] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[70] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[70] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[70] == index
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
                          globals.selectedIndex[71] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[71] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[71] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[71] == index
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
                          globals.selectedIndex[72] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[72] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[72] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[72] == index
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
                          globals.selectedIndex[73] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[73] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[73] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[73] == index
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
                          globals.selectedIndex[74] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[74] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[74] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[74] == index
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
          ),
        ),
        const ListTile(
          title: Text('REFLEJANTES'),
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
                    globals.selectedIndex[75] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[75] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[75] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[75] == index
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
                    globals.selectedIndex[76] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[76] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[76] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[76] == index
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
          title: Text('DISPOSITIVOS DE ASEGURAMIENTO'),
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
                    globals.selectedIndex[77] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[77] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[77] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[77] == index
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
                    globals.selectedIndex[78] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[78] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[78] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[78] == index
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
          title: Text('DEFENSA'),
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
                    globals.selectedIndex[79] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[79] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[79] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[79] == index
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
          title: Text('ESCAPE'),
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
                    globals.selectedIndex[80] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[80] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[80] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[80] == index
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
