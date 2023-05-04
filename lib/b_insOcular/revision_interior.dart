import 'package:flutter/material.dart';
import '../navbar.dart';

enum Answers { buen_estado, no_aplica, mal_estado }

class RevisionInterior extends StatefulWidget {
  const RevisionInterior({super.key});

  @override
  State<RevisionInterior> createState() => _RevisionInteriorState();
}

class _RevisionInteriorState extends State<RevisionInterior> {
  Answers? _value_54 = Answers.buen_estado;
  Answers? _value_55 = Answers.buen_estado;
  Answers? _value_56 = Answers.buen_estado;
  Answers? _value_57 = Answers.buen_estado;
  Answers? _value_58 = Answers.buen_estado;
  Answers? _value_59 = Answers.buen_estado;
  Answers? _value_60 = Answers.buen_estado;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Revisión Interior'),
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
        onPressed: () {},
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
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_54,
            onChanged: (Answers? value) {
              setState(() {
                _value_54 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_54,
            onChanged: (Answers? value) {
              setState(() {
                _value_54 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_54,
            onChanged: (Answers? value) {
              setState(() {
                _value_54 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Segunda pregunta
          title: Text('MUELLES (SUSPENSION SIN HOJAS SUELTAS, ROTAS, FISURAS)'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_55,
            onChanged: (Answers? value) {
              setState(() {
                _value_55 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_55,
            onChanged: (Answers? value) {
              setState(() {
                _value_55 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_55,
            onChanged: (Answers? value) {
              setState(() {
                _value_55 = value;
              });
            }),
        const ListTile(
          //Primera pregunta
          title: Text('CHASIS SIN FISURAS'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_56,
            onChanged: (Answers? value) {
              setState(() {
                _value_56 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_56,
            onChanged: (Answers? value) {
              setState(() {
                _value_56 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_56,
            onChanged: (Answers? value) {
              setState(() {
                _value_56 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('LINEAS DEA AIRE'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_57,
            onChanged: (Answers? value) {
              setState(() {
                _value_57 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_57,
            onChanged: (Answers? value) {
              setState(() {
                _value_57 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_57,
            onChanged: (Answers? value) {
              setState(() {
                _value_57 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('LINEAS ELECTRICAS'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_58,
            onChanged: (Answers? value) {
              setState(() {
                _value_58 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_58,
            onChanged: (Answers? value) {
              setState(() {
                _value_58 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_58,
            onChanged: (Answers? value) {
              setState(() {
                _value_58 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('DIFERENCIAL SIN FUGAS'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_59,
            onChanged: (Answers? value) {
              setState(() {
                _value_59 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_59,
            onChanged: (Answers? value) {
              setState(() {
                _value_59 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_59,
            onChanged: (Answers? value) {
              setState(() {
                _value_59 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('TRANSMISION SIN FUGAS'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_60,
            onChanged: (Answers? value) {
              setState(() {
                _value_60 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_60,
            onChanged: (Answers? value) {
              setState(() {
                _value_60 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_60,
            onChanged: (Answers? value) {
              setState(() {
                _value_60 = value;
              });
            }),
              ],
    );
  }
}
