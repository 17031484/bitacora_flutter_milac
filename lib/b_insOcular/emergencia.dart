import 'package:flutter/material.dart';
import '../navbar.dart';

enum Answers { buen_estado, no_aplica, mal_estado }

class Emergencia extends StatefulWidget {
  const Emergencia({super.key});

  @override
  State<Emergencia> createState() => _EmergenciaState();
}

class _EmergenciaState extends State<Emergencia> {
  Answers? _value_65 = Answers.buen_estado;
  Answers? _value_66 = Answers.buen_estado;
  Answers? _value_67 = Answers.buen_estado;
  Answers? _value_68 = Answers.buen_estado;
  Answers? _value_69 = Answers.buen_estado;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Equipo de Emergencia'),
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
        onPressed: () {},
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
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_65,
            onChanged: (Answers? value) {
              setState(() {
                _value_65 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_65,
            onChanged: (Answers? value) {
              setState(() {
                _value_65 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_65,
            onChanged: (Answers? value) {
              setState(() {
                _value_65 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Segunda pregunta
          title: Text('BOTIQUIN DE PRIMEROS AUXILIOS'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_66,
            onChanged: (Answers? value) {
              setState(() {
                _value_66 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_66,
            onChanged: (Answers? value) {
              setState(() {
                _value_66 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_66,
            onChanged: (Answers? value) {
              setState(() {
                _value_66 = value;
              });
            }),
        const ListTile(
          //Primera pregunta
          title: Text(
              'EQUIPO DE SEGURIRDAD (DE ACUERDO A LA INFORMACION DE EMERGENCIA DE TRANSPORTACION)'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_67,
            onChanged: (Answers? value) {
              setState(() {
                _value_67 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_67,
            onChanged: (Answers? value) {
              setState(() {
                _value_67 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_67,
            onChanged: (Answers? value) {
              setState(() {
                _value_67 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('TRIANGULOS DE SEGURIDAD (MINIMO 3)'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_68,
            onChanged: (Answers? value) {
              setState(() {
                _value_68 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_68,
            onChanged: (Answers? value) {
              setState(() {
                _value_68 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_68,
            onChanged: (Answers? value) {
              setState(() {
                _value_68 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('RETRANCAS (MINIMO 2)'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_69,
            onChanged: (Answers? value) {
              setState(() {
                _value_69 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_69,
            onChanged: (Answers? value) {
              setState(() {
                _value_69 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_69,
            onChanged: (Answers? value) {
              setState(() {
                _value_69 = value;
              });
            }),
      ],
    );
  }
}
