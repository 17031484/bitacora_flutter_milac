import 'package:flutter/material.dart';
import '../navbar.dart';

enum Answers { buen_estado, no_aplica, mal_estado }

class Autotanque extends StatefulWidget {
  const Autotanque({super.key});

  @override
  State<Autotanque> createState() => _AutotanqueState();
}

class _AutotanqueState extends State<Autotanque> {
  Answers? _value_42 = Answers.buen_estado;
  Answers? _value_43 = Answers.buen_estado;
  Answers? _value_44 = Answers.buen_estado;
  Answers? _value_45 = Answers.buen_estado;
  Answers? _value_46 = Answers.buen_estado;
  Answers? _value_47 = Answers.buen_estado;
  Answers? _value_48 = Answers.buen_estado;
  Answers? _value_49 = Answers.buen_estado;
  Answers? _value_50 = Answers.buen_estado;
  Answers? _value_51 = Answers.buen_estado;
  Answers? _value_52 = Answers.buen_estado;
  Answers? _value_53 = Answers.buen_estado;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Autotanque'),
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
        onPressed: () {},
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
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_42,
            onChanged: (Answers? value) {
              setState(() {
                _value_42 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_42,
            onChanged: (Answers? value) {
              setState(() {
                _value_42 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_42,
            onChanged: (Answers? value) {
              setState(() {
                _value_42 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Segunda pregunta
          title: Text('PLACA METALICA DE IDENTIFICACION'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_43,
            onChanged: (Answers? value) {
              setState(() {
                _value_43 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_43,
            onChanged: (Answers? value) {
              setState(() {
                _value_43 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_43,
            onChanged: (Answers? value) {
              setState(() {
                _value_43 = value;
              });
            }),
        const ListTile(
          //Primera pregunta
          title: Text('ENGOMADOS DE PRUEBA VIGENTE'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_44,
            onChanged: (Answers? value) {
              setState(() {
                _value_44 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_44,
            onChanged: (Answers? value) {
              setState(() {
                _value_44 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_44,
            onChanged: (Answers? value) {
              setState(() {
                _value_44 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('REFLEJANTES'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_45,
            onChanged: (Answers? value) {
              setState(() {
                _value_45 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_45,
            onChanged: (Answers? value) {
              setState(() {
                _value_45 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_45,
            onChanged: (Answers? value) {
              setState(() {
                _value_45 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('TUBERIA, VALVULAS CONEXIONES'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_46,
            onChanged: (Answers? value) {
              setState(() {
                _value_46 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_46,
            onChanged: (Answers? value) {
              setState(() {
                _value_46 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_46,
            onChanged: (Answers? value) {
              setState(() {
                _value_46 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('ESCALERILLAS'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_47,
            onChanged: (Answers? value) {
              setState(() {
                _value_47 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_47,
            onChanged: (Answers? value) {
              setState(() {
                _value_47 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_47,
            onChanged: (Answers? value) {
              setState(() {
                _value_47 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('PASILLO'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_48,
            onChanged: (Answers? value) {
              setState(() {
                _value_48 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_48,
            onChanged: (Answers? value) {
              setState(() {
                _value_48 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_48,
            onChanged: (Answers? value) {
              setState(() {
                _value_48 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('CUERPO DEL TANQUE (SIN GOLPES, FISURAS O FUGAS)'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_49,
            onChanged: (Answers? value) {
              setState(() {
                _value_49 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_49,
            onChanged: (Answers? value) {
              setState(() {
                _value_49 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_49,
            onChanged: (Answers? value) {
              setState(() {
                _value_49 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('INSTRUMENTOS DE MEDICION'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_50,
            onChanged: (Answers? value) {
              setState(() {
                _value_50 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_50,
            onChanged: (Answers? value) {
              setState(() {
                _value_50 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_50,
            onChanged: (Answers? value) {
              setState(() {
                _value_50 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('VÁLVULA DE DESFOGE INTERNA Y DE VACIO'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_51,
            onChanged: (Answers? value) {
              setState(() {
                _value_51 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_51,
            onChanged: (Answers? value) {
              setState(() {
                _value_51 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_51,
            onChanged: (Answers? value) {
              setState(() {
                _value_51 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('ENTRADA PASA HOMBRE'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_52,
            onChanged: (Answers? value) {
              setState(() {
                _value_52 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_52,
            onChanged: (Answers? value) {
              setState(() {
                _value_52 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_52,
            onChanged: (Answers? value) {
              setState(() {
                _value_52 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          //Primera pregunta
          title: Text('CONEXIÓN A TIERRA'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_53,
            onChanged: (Answers? value) {
              setState(() {
                _value_53 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_53,
            onChanged: (Answers? value) {
              setState(() {
                _value_53 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_53,
            onChanged: (Answers? value) {
              setState(() {
                _value_53 = value;
              });
            }),
      ],
    );
  }
}
