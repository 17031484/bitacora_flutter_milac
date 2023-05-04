import 'package:flutter/material.dart';
import '../navbar.dart';

enum Answers { buen_estado, no_aplica, mal_estado }

class CInterna extends StatefulWidget {
  const CInterna({super.key});

  @override
  State<CInterna> createState() => _CInternaState();
}

class _CInternaState extends State<CInterna> {
  Answers? _value_61 = Answers.buen_estado;
  Answers? _value_62 = Answers.buen_estado;
  Answers? _value_63 = Answers.buen_estado;
  Answers? _value_64 = Answers.buen_estado;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Area de Combustión Interna'),
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
        onPressed: () {},
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
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_61,
            onChanged: (Answers? value) {
              setState(() {
                _value_61 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_61,
            onChanged: (Answers? value) {
              setState(() {
                _value_61 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_61,
            onChanged: (Answers? value) {
              setState(() {
                _value_61 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Segunda pregunta
          title: Text('RADIADOR'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_62,
            onChanged: (Answers? value) {
              setState(() {
                _value_62 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_62,
            onChanged: (Answers? value) {
              setState(() {
                _value_62 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_62,
            onChanged: (Answers? value) {
              setState(() {
                _value_62 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('BATERIA'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_63,
            onChanged: (Answers? value) {
              setState(() {
                _value_63 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_63,
            onChanged: (Answers? value) {
              setState(() {
                _value_63 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_63,
            onChanged: (Answers? value) {
              setState(() {
                _value_63 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('BANDAS'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_64,
            onChanged: (Answers? value) {
              setState(() {
                _value_64 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_64,
            onChanged: (Answers? value) {
              setState(() {
                _value_64 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_64,
            onChanged: (Answers? value) {
              setState(() {
                _value_64 = value;
              });
            }),
      ],
    );
  }
}
