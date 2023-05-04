import 'package:flutter/material.dart';
import 'package:test_app/b_insOcular/c_interna.dart';
import '../global.dart' as globals;
import 'AppButtons.dart';

class RevisionInterior extends StatefulWidget {
  const RevisionInterior({super.key});

  @override
  State<RevisionInterior> createState() => _RevisionInteriorState();
}

class _RevisionInteriorState extends State<RevisionInterior> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: const Text('Revisión Interior'),
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
            buildRInterior()
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
          .push(MaterialPageRoute(builder: (context) => CInterna()));
        },
        child: const Text('Guardar'),
      ),
    );
  }

  Widget buildRInterior() {
    return Column(
      children: [
        const ListTile(
          //Primera pregunta
          title: Text('FRENOS (SIN FUGAS DE AIRE)'),
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
                    globals.selectedIndex[53] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[53] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[53] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[53] == index
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
          title: Text('MUELLES (SUSPENSION SIN HOJAS SUELTAS, ROTAS, FISURAS)'),
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
                    globals.selectedIndex[54] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[54] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[54] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[54] == index
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
          title: Text('CHASIS SIN FISURAS'),
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
                    globals.selectedIndex[55] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[55] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[55] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[55] == index
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
          title: Text('LINEAS DEA AIRE'),
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
                    globals.selectedIndex[56] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[56] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[56] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[56] == index
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
          title: Text('LINEAS ELECTRICAS'),
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
                    globals.selectedIndex[57] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[57] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[57] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[57] == index
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
          title: Text('DIFERENCIAL SIN FUGAS'),
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
                    globals.selectedIndex[58] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[58] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[58] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[58] == index
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
          title: Text('TRANSMISION SIN FUGAS'),
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
                    globals.selectedIndex[59] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[59] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[59] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[59] == index
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
