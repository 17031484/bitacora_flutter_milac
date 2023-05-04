import 'package:flutter/material.dart';

enum Answers { buen_estado, no_aplica, mal_estado }

class LadoID extends StatefulWidget {
  const LadoID({super.key});

  @override
  State<LadoID> createState() => _LadoIDState();
}

class _LadoIDState extends State<LadoID> {
  Answers? _value_32 = Answers.buen_estado;
  Answers? _value_33 = Answers.buen_estado;
  Answers? _value_34 = Answers.buen_estado;
  Answers? _value_35 = Answers.buen_estado;
  Answers? _value_36 = Answers.buen_estado;
  Answers? _value_37 = Answers.buen_estado;
  Answers? _value_38 = Answers.buen_estado;
  Answers? _value_39 = Answers.buen_estado;
  Answers? _value_40 = Answers.buen_estado;
  Answers? _value_41 = Answers.buen_estado;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Lado Izquierdo-Derecho'),
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
        onPressed: () {},
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
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_32,
            onChanged: (Answers? value) {
              setState(() {
                _value_32 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_32,
            onChanged: (Answers? value) {
              setState(() {
                _value_32 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_32,
            onChanged: (Answers? value) {
              setState(() {
                _value_32 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Segunda pregunta
          title: Text('TANQUE(S) COMBUSTIBLE IZQUIERDO Y TAPON'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_33,
            onChanged: (Answers? value) {
              setState(() {
                _value_33 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_33,
            onChanged: (Answers? value) {
              setState(() {
                _value_33 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_33,
            onChanged: (Answers? value) {
              setState(() {
                _value_33 = value;
              });
            }),
        const ListTile(
          //Primera pregunta
          title: Text('LUCES DE ADVERTENCIA Y LATERALES'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_34,
            onChanged: (Answers? value) {
              setState(() {
                _value_34 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_34,
            onChanged: (Answers? value) {
              setState(() {
                _value_34 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_34,
            onChanged: (Answers? value) {
              setState(() {
                _value_34 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('REFLEJANTE'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_35,
            onChanged: (Answers? value) {
              setState(() {
                _value_35 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_35,
            onChanged: (Answers? value) {
              setState(() {
                _value_35 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_35,
            onChanged: (Answers? value) {
              setState(() {
                _value_35 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('LLANTAS DE REFACCION'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_36,
            onChanged: (Answers? value) {
              setState(() {
                _value_36 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_36,
            onChanged: (Answers? value) {
              setState(() {
                _value_36 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_36,
            onChanged: (Answers? value) {
              setState(() {
                _value_36 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('LLANTAS (DESGASTE Y AIRE)'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_37,
            onChanged: (Answers? value) {
              setState(() {
                _value_37 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_37,
            onChanged: (Answers? value) {
              setState(() {
                _value_37 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_37,
            onChanged: (Answers? value) {
              setState(() {
                _value_37 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('RINES SIN FISURAS'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_38,
            onChanged: (Answers? value) {
              setState(() {
                _value_38 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_38,
            onChanged: (Answers? value) {
              setState(() {
                _value_38 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_38,
            onChanged: (Answers? value) {
              setState(() {
                _value_38 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('BIRLOS Y TUERCAS SIN FISURAS'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_39,
            onChanged: (Answers? value) {
              setState(() {
                _value_39 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_39,
            onChanged: (Answers? value) {
              setState(() {
                _value_39 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_39,
            onChanged: (Answers? value) {
              setState(() {
                _value_39 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('SISTEMA DE ASEGURAMIENTO Y SUJECION DE CARGA'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_40,
            onChanged: (Answers? value) {
              setState(() {
                _value_40 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_40,
            onChanged: (Answers? value) {
              setState(() {
                _value_39 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_40,
            onChanged: (Answers? value) {
              setState(() {
                _value_40 = value;
              });
            }),
            const ListTile(
          //Primera pregunta
          title: Text('QUINTA RUEDA'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_41,
            onChanged: (Answers? value) {
              setState(() {
                _value_41 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_41,
            onChanged: (Answers? value) {
              setState(() {
                _value_41 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_41,
            onChanged: (Answers? value) {
              setState(() {
                _value_41 = value;
              });
            }),
      ],
    );
  }
}
