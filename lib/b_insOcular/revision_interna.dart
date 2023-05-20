import 'package:flutter/material.dart';
import 'package:test_app/b_insOcular/AppButtons.dart';
import '../global.dart' as globals;
import 'frente_exterior.dart';

enum Answers { buen_estado, no_aplica, mal_estado }

class CheckList extends StatefulWidget {
  const CheckList({super.key});

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Revisión Interna'),
            backgroundColor: Colors.blue,
          ),
          body: ListView(
              padding: EdgeInsets.zero, children: <Widget>[buildContent()]),
          bottomNavigationBar: buildfixedButton(),
        ),
      ),
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
                  'Revisión Interna',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            buildRInterna()
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
              pageBuilder: (context, _, __) => FrenteExterior(),
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

  Widget buildRInterna() {
    return Column(
      children: [
        const ListTile(
          //Primera pregunta
          title: Text('INDICADOR DE PRESION DE ACEITE'),
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
                    globals.selectedIndex[0] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[0] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[0] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[0] == index
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
          title: Text('INDICADOR DE PRESION AIRE/VACIO'),
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
                    globals.selectedIndex[1] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[1] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[1] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[1] == index
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
          //Tercera pregunta
          title: Text('DISPOSITIVO DE ADVERTENCIA DE POCO AIRE O VACIO'),
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
                    globals.selectedIndex[2] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[2] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[2] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[2] == index
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
                    'Tablero de instrumentos',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const ListTile(
                title: Text('VELOCIMETRO'),
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
                          globals.selectedIndex[3] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[3] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[3] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[3] == index
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
                color: const Color.fromARGB(230, 243, 212, 161),
                child: Column(
                  children: [
                    const ListTile(
                      title: Center(
                        child: Text(
                          'Luces del tablero',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const ListTile(
                      title: Text('DIRECCIONALES'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment
                          .center, //Center Row contents vertically,
                      children: List.generate(3, (index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                globals.selectedIndex[4] = index;
                              });
                            },
                            child: AppButtons(
                                color: globals.selectedIndex[4] == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor:
                                    globals.selectedIndex[4] == index
                                        ? Colors.black
                                        : Color.fromARGB(186, 239, 234, 234),
                                borderColor: globals.selectedIndex[4] == index
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
                      title: Text('ESTACIONAMIENTO'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment
                          .center, //Center Row contents vertically,
                      children: List.generate(3, (index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                globals.selectedIndex[5] = index;
                              });
                            },
                            child: AppButtons(
                                color: globals.selectedIndex[5] == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor:
                                    globals.selectedIndex[5] == index
                                        ? Colors.black
                                        : Color.fromARGB(186, 239, 234, 234),
                                borderColor: globals.selectedIndex[5] == index
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
                      title: Text('GALIBO (ALTURA)'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment
                          .center, //Center Row contents vertically,
                      children: List.generate(3, (index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                globals.selectedIndex[6] = index;
                              });
                            },
                            child: AppButtons(
                                color: globals.selectedIndex[6] == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor:
                                    globals.selectedIndex[6] == index
                                        ? Colors.black
                                        : Color.fromARGB(186, 239, 234, 234),
                                borderColor: globals.selectedIndex[6] == index
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
                      title: Text('INTERIOR'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment
                          .center, //Center Row contents vertically,
                      children: List.generate(3, (index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                globals.selectedIndex[7] = index;
                              });
                            },
                            child: AppButtons(
                                color: globals.selectedIndex[7] == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor:
                                    globals.selectedIndex[7] == index
                                        ? Colors.black
                                        : Color.fromARGB(186, 239, 234, 234),
                                borderColor: globals.selectedIndex[7] == index
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
                      title: Text('ADVERTENCIA'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment
                          .center, //Center Row contents vertically,
                      children: List.generate(3, (index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                globals.selectedIndex[8] = index;
                              });
                            },
                            child: AppButtons(
                                color: globals.selectedIndex[8] == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor:
                                    globals.selectedIndex[8] == index
                                        ? Colors.black
                                        : Color.fromARGB(186, 239, 234, 234),
                                borderColor: globals.selectedIndex[8] == index
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
                      title: Text('DEMARCADORAS'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment
                          .center, //Center Row contents vertically,
                      children: List.generate(3, (index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                globals.selectedIndex[9] = index;
                              });
                            },
                            child: AppButtons(
                                color: globals.selectedIndex[9] == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor:
                                    globals.selectedIndex[9] == index
                                        ? Colors.black
                                        : Color.fromARGB(186, 239, 234, 234),
                                borderColor: globals.selectedIndex[9] == index
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
              const ListTile(
                title: Text('CALENTADOR DESEMPAÑADOR'),
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
                          globals.selectedIndex[10] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[10] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[10] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[10] == index
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
                title: Text('BATERIA'),
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
                          globals.selectedIndex[11] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[11] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[11] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[11] == index
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
                title: Text('MOTOR'),
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
                          globals.selectedIndex[12] = index;
                        });
                      },
                      child: AppButtons(
                          color: globals.selectedIndex[12] == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: globals.selectedIndex[12] == index
                              ? Colors.black
                              : Color.fromARGB(186, 239, 234, 234),
                          borderColor: globals.selectedIndex[12] == index
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
        const ListTile(
          //Primera pregunta
          title: Text('CLAXÓN O CORNETA'),
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
                    globals.selectedIndex[13] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[13] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[13] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[13] == index
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
          title: Text('CINTURON DE SEGURIDAD (MINIMO DEL OPERADOR)'),
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
                    globals.selectedIndex[14] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[14] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[14] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[14] == index
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
          title: Text(
              'PARABRISAS (SIN FISURAS QUE OBSTRUYAN LA VISIBILIDAD DEL CONDUCTOR)'),
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
                    globals.selectedIndex[15] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[15] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[15] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[15] == index
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
          title: Text('LIMPIADORES'),
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
                    globals.selectedIndex[16] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[16] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[16] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[16] == index
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
          title: Text('ESPEJOS RETROVISORES (2)'),
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
                    globals.selectedIndex[17] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[17] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[17] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[17] == index
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
          title: Text('VOLANTE (DIRECCION SIN EXCESO DE JUEGO)'),
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
                    globals.selectedIndex[18] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[18] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[18] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[18] == index
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
          title: Text('FRENO DE PIE'),
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
                    globals.selectedIndex[19] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[19] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[19] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[19] == index
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
          title: Text('FRENOS DE EMERGENCIA'),
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
                    globals.selectedIndex[20] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[20] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[20] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[20] == index
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
    );
  }
}
