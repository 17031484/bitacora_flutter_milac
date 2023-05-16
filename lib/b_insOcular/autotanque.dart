import 'package:flutter/material.dart';
import 'package:test_app/b_insOcular/revision_interior.dart';
import '../global.dart' as globals;
import 'AppButtons.dart';

class Autotanque extends StatefulWidget {
  const Autotanque({super.key});

  @override
  State<Autotanque> createState() => _AutotanqueState();
}

class _AutotanqueState extends State<Autotanque> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: const Text('Autotanque'),
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
                  'Autotanque',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            buildAutotanque()
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
              pageBuilder: (context, _, __) => RevisionInterior(),
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

  Widget buildAutotanque() {
    return Column(
      children: [
        const ListTile(
          //Primera pregunta
          title: Text('MATA CHISPAS'),
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
                    globals.selectedIndex[41] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[41] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[41] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[41] == index
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
          title: Text('PLACA METALICA DE IDENTIFICACION'),
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
                    globals.selectedIndex[42] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[42] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[42] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[42] == index
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
          title: Text('ENGOMADOS DE PRUEBA VIGENTE'),
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
                    globals.selectedIndex[43] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[43] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[43] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[43] == index
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
                    globals.selectedIndex[44] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[44] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[44] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[44] == index
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
          title: Text('TUBERIA, VALVULAS CONEXIONES'),
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
                    globals.selectedIndex[45] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[45] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[45] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[45] == index
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
          title: Text('ESCALERILLAS'),
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
                    globals.selectedIndex[46] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[46] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[46] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[46] == index
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
          title: Text('PASILLO'),
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
                    globals.selectedIndex[47] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[47] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[47] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[47] == index
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
          title: Text('CUERPO DEL TANQUE (SIN GOLPES, FISURAS O FUGAS)'),
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
                    globals.selectedIndex[48] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[48] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[48] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[48] == index
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
          title: Text('INSTRUMENTOS DE MEDICION'),
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
                    globals.selectedIndex[49] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[49] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[49] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[49] == index
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
          title: Text('VÁLVULA DE DESFOGE INTERNA Y DE VACIO'),
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
                    globals.selectedIndex[50] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[50] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[50] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[50] == index
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
          title: Text('ENTRADA PASA HOMBRE'),
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
                    globals.selectedIndex[51] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[51] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[51] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[51] == index
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
          title: Text('CONEXIÓN A TIERRA'),
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
                    globals.selectedIndex[52] = index;
                  });
                },
                child: AppButtons(
                    color: globals.selectedIndex[52] == index
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: globals.selectedIndex[52] == index
                        ? Colors.black
                        : Color.fromARGB(186, 239, 234, 234),
                    borderColor: globals.selectedIndex[52] == index
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
