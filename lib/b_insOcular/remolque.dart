import 'package:flutter/material.dart';
import '../navbar.dart';

enum Answers { buen_estado, no_aplica, mal_estado }

class Remolque extends StatefulWidget {
  const Remolque({super.key});

  @override
  State<Remolque> createState() => _RemolqueState();
}

class _RemolqueState extends State<Remolque> {
  Answers? _value_82 = Answers.buen_estado;
  Answers? _value_83 = Answers.buen_estado;
  Answers? _value_84 = Answers.buen_estado;
  Answers? _value_85 = Answers.buen_estado;
  Answers? _value_86 = Answers.buen_estado;
  Answers? _value_87 = Answers.buen_estado;
  Answers? _value_88 = Answers.buen_estado;
  Answers? _value_89 = Answers.buen_estado;
  Answers? _value_90 = Answers.buen_estado;
  Answers? _value_91 = Answers.buen_estado;
  Answers? _value_92 = Answers.buen_estado;
  Answers? _value_93 = Answers.buen_estado;
  Answers? _value_94 = Answers.buen_estado;
  Answers? _value_95 = Answers.buen_estado;
  Answers? _value_96 = Answers.buen_estado;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Remolque, Semiremolque (Incluyendo tipo de tanque)'),
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
                  'Remolque, Semiremolque(Incluyendo tipo de tanque)',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            buildRemolque()
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

  Widget buildRemolque() {
    return Column(
      children: [
        const ListTile(
          title: Text('FRENO REMOLQUE'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_82,
            onChanged: (Answers? value) {
              setState(() {
                _value_82 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_82,
            onChanged: (Answers? value) {
              setState(() {
                _value_82 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_82,
            onChanged: (Answers? value) {
              setState(() {
                _value_82 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          title: Text('LINEAS ELECTRICAS (SUJETAS)'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_83,
            onChanged: (Answers? value) {
              setState(() {
                _value_83 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_83,
            onChanged: (Answers? value) {
              setState(() {
                _value_83 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_83,
            onChanged: (Answers? value) {
              setState(() {
                _value_83 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          title: Text('CONEXIONES DE FRENOS'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_84,
            onChanged: (Answers? value) {
              setState(() {
                _value_84 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_84,
            onChanged: (Answers? value) {
              setState(() {
                _value_84 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_84,
            onChanged: (Answers? value) {
              setState(() {
                _value_84 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          title: Text('CONEXION QUINTA RUEDA'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_85,
            onChanged: (Answers? value) {
              setState(() {
                _value_85 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_85,
            onChanged: (Answers? value) {
              setState(() {
                _value_85 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_85,
            onChanged: (Answers? value) {
              setState(() {
                _value_85 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          title: Text('PATINES'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_86,
            onChanged: (Answers? value) {
              setState(() {
                _value_86 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_86,
            onChanged: (Answers? value) {
              setState(() {
                _value_86 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_86,
            onChanged: (Answers? value) {
              setState(() {
                _value_86 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          title: Text('CERRADURA DE PUERTAS'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_87,
            onChanged: (Answers? value) {
              setState(() {
                _value_87 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_87,
            onChanged: (Answers? value) {
              setState(() {
                _value_87 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_87,
            onChanged: (Answers? value) {
              setState(() {
                _value_87 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          title: Text('CARTELES DE RIESGO (4) O (8)'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_88,
            onChanged: (Answers? value) {
              setState(() {
                _value_88 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_88,
            onChanged: (Answers? value) {
              setState(() {
                _value_88 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_88,
            onChanged: (Answers? value) {
              setState(() {
                _value_88 = value;
              });
            }),
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
                title: Text('DEMARCADORAS'),
              ),
              RadioListTile<Answers>(
                  title: const Text('Buen estado'),
                  value: Answers.buen_estado,
                  groupValue: _value_89,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_89 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('No aplica'),
                  value: Answers.no_aplica,
                  groupValue: _value_89,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_89 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('Mal estado'),
                  value: Answers.mal_estado,
                  groupValue: _value_89,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_89 = value;
                    });
                  }),
              const ListTile(
                title: Text('DE IDENTIFICACION (PORTA PLACA)'),
              ),
              RadioListTile<Answers>(
                  title: const Text('Buen estado'),
                  value: Answers.buen_estado,
                  groupValue: _value_90,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_90 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('No aplica'),
                  value: Answers.no_aplica,
                  groupValue: _value_90,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_90 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('Mal estado'),
                  value: Answers.mal_estado,
                  groupValue: _value_90,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_90 = value;
                    });
                  }),
              const Divider(
                thickness: 5,
                indent: 10,
                endIndent: 10,
              ),
              const ListTile(
                title: Text('DIRECCIONALES'),
              ),
              RadioListTile<Answers>(
                  title: const Text('Buen estado'),
                  value: Answers.buen_estado,
                  groupValue: _value_91,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_91 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('No aplica'),
                  value: Answers.no_aplica,
                  groupValue: _value_91,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_91 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('Mal estado'),
                  value: Answers.mal_estado,
                  groupValue: _value_91,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_91 = value;
                    });
                  }),
              const Divider(
                thickness: 5,
                indent: 10,
                endIndent: 10,
              ),
              const ListTile(
                title: Text('DE ESTACIONAMIENTO'),
              ),
              RadioListTile<Answers>(
                  title: const Text('Buen estado'),
                  value: Answers.buen_estado,
                  groupValue: _value_92,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_92 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('No aplica'),
                  value: Answers.no_aplica,
                  groupValue: _value_92,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_92 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('Mal estado'),
                  value: Answers.mal_estado,
                  groupValue: _value_92,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_92 = value;
                    });
                  }),
              const Divider(
                thickness: 5,
                indent: 10,
                endIndent: 10,
              ),
              const ListTile(
                title: Text('DE GALIBO (ALTURA)'),
              ),
              RadioListTile<Answers>(
                  title: const Text('Buen estado'),
                  value: Answers.buen_estado,
                  groupValue: _value_93,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_93 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('No aplica'),
                  value: Answers.no_aplica,
                  groupValue: _value_93,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_93 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('Mal estado'),
                  value: Answers.mal_estado,
                  groupValue: _value_93,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_93 = value;
                    });
                  }),
              const Divider(
                thickness: 5,
                indent: 10,
                endIndent: 10,
              ),
              const ListTile(
                title: Text('DE ADVERTENCIA'),
              ),
              RadioListTile<Answers>(
                  title: const Text('Buen estado'),
                  value: Answers.buen_estado,
                  groupValue: _value_94,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_94 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('No aplica'),
                  value: Answers.no_aplica,
                  groupValue: _value_94,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_94 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('Mal estado'),
                  value: Answers.mal_estado,
                  groupValue: _value_94,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_94 = value;
                    });
                  }),
                  const Divider(
                thickness: 5,
                indent: 10,
                endIndent: 10,
              ),
              const ListTile(
                title: Text('DE FRENADO'),
              ),
              RadioListTile<Answers>(
                  title: const Text('Buen estado'),
                  value: Answers.buen_estado,
                  groupValue: _value_95,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_95 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('No aplica'),
                  value: Answers.no_aplica,
                  groupValue: _value_95,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_95 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('Mal estado'),
                  value: Answers.mal_estado,
                  groupValue: _value_95,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_95 = value;
                    });
                  }),
                  const Divider(
                thickness: 5,
                indent: 10,
                endIndent: 10,
              ),
              const ListTile(
                title: Text('DE MARCHA ATRAS'),
              ),
              RadioListTile<Answers>(
                  title: const Text('Buen estado'),
                  value: Answers.buen_estado,
                  groupValue: _value_96,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_96 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('No aplica'),
                  value: Answers.no_aplica,
                  groupValue: _value_96,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_96 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('Mal estado'),
                  value: Answers.mal_estado,
                  groupValue: _value_96,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_96 = value;
                    });
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
