import 'package:flutter/material.dart';
import '../navbar.dart';

enum Answers { buen_estado, no_aplica, mal_estado }

class PartePosterior extends StatefulWidget {
  const PartePosterior({super.key});

  @override
  State<PartePosterior> createState() => _PartePosterioState();
}

class _PartePosterioState extends State<PartePosterior> {
  Answers? _value_70 = Answers.buen_estado;
  Answers? _value_71 = Answers.buen_estado;
  Answers? _value_72 = Answers.buen_estado;
  Answers? _value_73 = Answers.buen_estado;
  Answers? _value_74 = Answers.buen_estado;
  Answers? _value_75 = Answers.buen_estado;
  Answers? _value_76 = Answers.buen_estado;
  Answers? _value_77 = Answers.buen_estado;
  Answers? _value_78 = Answers.buen_estado;
  Answers? _value_79 = Answers.buen_estado;
  Answers? _value_80 = Answers.buen_estado;
  Answers? _value_81 = Answers.buen_estado;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Parte Posterior'),
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
                  'Parte Posteior',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            buildPosterior()
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

  Widget buildPosterior() {
    return Column(
      children: [
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
                title: Text('GALIBO (ALTURA)'),
              ),
              RadioListTile<Answers>(
                  title: const Text('Buen estado'),
                  value: Answers.buen_estado,
                  groupValue: _value_70,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_70 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('No aplica'),
                  value: Answers.no_aplica,
                  groupValue: _value_70,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_70 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('Mal estado'),
                  value: Answers.mal_estado,
                  groupValue: _value_70,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_70 = value;
                    });
                  }),
              const ListTile(
                title: Text('DIRECCIONALES'),
              ),
              RadioListTile<Answers>(
                  title: const Text('Buen estado'),
                  value: Answers.buen_estado,
                  groupValue: _value_71,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_71 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('No aplica'),
                  value: Answers.no_aplica,
                  groupValue: _value_71,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_71 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('Mal estado'),
                  value: Answers.mal_estado,
                  groupValue: _value_71,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_71 = value;
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
                  groupValue: _value_72,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_72 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('No aplica'),
                  value: Answers.no_aplica,
                  groupValue: _value_72,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_72 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('Mal estado'),
                  value: Answers.mal_estado,
                  groupValue: _value_72,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_72 = value;
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
                  groupValue: _value_73,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_73 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('No aplica'),
                  value: Answers.no_aplica,
                  groupValue: _value_73,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_73 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('Mal estado'),
                  value: Answers.mal_estado,
                  groupValue: _value_73,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_73 = value;
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
                  groupValue: _value_74,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_74 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('No aplica'),
                  value: Answers.no_aplica,
                  groupValue: _value_74,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_74 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('Mal estado'),
                  value: Answers.mal_estado,
                  groupValue: _value_74,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_74 = value;
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
                  groupValue: _value_75,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_75 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('No aplica'),
                  value: Answers.no_aplica,
                  groupValue: _value_75,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_75 = value;
                    });
                  }),
              RadioListTile<Answers>(
                  title: const Text('Mal estado'),
                  value: Answers.mal_estado,
                  groupValue: _value_75,
                  onChanged: (Answers? value) {
                    setState(() {
                      _value_75 = value;
                    });
                  }),
            ],
          ),
        ),
        const ListTile(
          title: Text('REFLEJANTES'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_76,
            onChanged: (Answers? value) {
              setState(() {
                _value_76 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_76,
            onChanged: (Answers? value) {
              setState(() {
                _value_76 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_76,
            onChanged: (Answers? value) {
              setState(() {
                _value_76 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          title: Text('GUARDA FANGOS (LODERAS)'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_77,
            onChanged: (Answers? value) {
              setState(() {
                _value_77 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_77,
            onChanged: (Answers? value) {
              setState(() {
                _value_77 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_77,
            onChanged: (Answers? value) {
              setState(() {
                _value_77 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          title: Text('DISPOSITIVOS DE ASEGURAMIENTO'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_78,
            onChanged: (Answers? value) {
              setState(() {
                _value_78 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_78,
            onChanged: (Answers? value) {
              setState(() {
                _value_78 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_78,
            onChanged: (Answers? value) {
              setState(() {
                _value_78 = value;
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
            groupValue: _value_79,
            onChanged: (Answers? value) {
              setState(() {
                _value_79 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_79,
            onChanged: (Answers? value) {
              setState(() {
                _value_79 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_79,
            onChanged: (Answers? value) {
              setState(() {
                _value_79 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          title: Text('DEFENSA'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_80,
            onChanged: (Answers? value) {
              setState(() {
                _value_80 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_80,
            onChanged: (Answers? value) {
              setState(() {
                _value_80 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_80,
            onChanged: (Answers? value) {
              setState(() {
                _value_80 = value;
              });
            }),
        const Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        const ListTile(
          title: Text('ESCAPE'),
        ),
        RadioListTile<Answers>(
            title: const Text('Buen estado'),
            value: Answers.buen_estado,
            groupValue: _value_81,
            onChanged: (Answers? value) {
              setState(() {
                _value_81 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('No aplica'),
            value: Answers.no_aplica,
            groupValue: _value_81,
            onChanged: (Answers? value) {
              setState(() {
                _value_81 = value;
              });
            }),
        RadioListTile<Answers>(
            title: const Text('Mal estado'),
            value: Answers.mal_estado,
            groupValue: _value_81,
            onChanged: (Answers? value) {
              setState(() {
                _value_81 = value;
              });
            }),
      ],
    );
  }
}
