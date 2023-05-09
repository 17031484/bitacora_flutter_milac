import 'package:flutter/material.dart';
import 'package:test_app/b_insOcular/autotanque.dart';
import '../global.dart' as globals;
import 'AppButtons.dart';

class LadoID extends StatefulWidget {
  const LadoID({super.key});

  @override
  State<LadoID> createState() => _LadoIDState();
}

class _LadoIDState extends State<LadoID> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{ return false; },
      child: MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: const Text('Lado Izquierdo-Derecho'),
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
                  'Lado Izquierdo-Derecho',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            buildLadoID()
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
          .push(MaterialPageRoute(builder: (context) => Autotanque()));
        },
        child: const Text('Guardar'),
      ),
    );
  }

  Widget buildLadoID() {
    return Column(
      children: [
        const ListTile(
          //Primera pregunta
          title: Text('TANQUE(S) COMBUSTIBLE DERECHO Y TAPON'),
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
                    globals.selectedIndex[31] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[31] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[31] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[31] == index
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
          title: Text('TANQUE(S) COMBUSTIBLE IZQUIERDO Y TAPON'),
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
                    globals.selectedIndex[32] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[32] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[32] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[32] == index
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
          //Primera pregunta
          title: Text('LUCES DE ADVERTENCIA Y LATERALES'),
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
                    globals.selectedIndex[33] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[33] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[33] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[33] == index
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
          title: Text('REFLEJANTE'),
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
                    globals.selectedIndex[34] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[34] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[34] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[34] == index
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
          title: Text('LLANTAS DE REFACCION'),
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
                    globals.selectedIndex[35] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[35] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[35] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[35] == index
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
          title: Text('LLANTAS (DESGASTE Y AIRE)'),
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
                    globals.selectedIndex[36] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[36] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[36] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[36] == index
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
                    globals.selectedIndex[37] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[37] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[37] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[37] == index
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
          title: Text('BIRLOS Y TUERCAS SIN FISURAS'),
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
                    globals.selectedIndex[38] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[38] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[38] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[38] == index
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
          title: Text('SISTEMA DE ASEGURAMIENTO Y SUJECION DE CARGA'),
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
                    globals.selectedIndex[39] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[39] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[39] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[39] == index
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
          //Primera pregunta
          title: Text('QUINTA RUEDA'),
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
                    globals.selectedIndex[40] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[40] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[40] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[40] == index
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
