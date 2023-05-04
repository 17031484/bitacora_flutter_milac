import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/baseinfo.dart';
import 'package:test_app/home.page.dart';
import 'global.dart' as globals;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();
  bool? val = false;
  bool? check = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _header(context),
            _inputfields(context),
            _support(context)
          ],
        ),
      ),
    ));
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          'Bienvenido de regreso',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text('Ingrese sus credenciales para acceder')
      ],
    );
  }

  _inputfields(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _userTEC,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: 'Número de operador',
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _passwordTEC,
          decoration: InputDecoration(
              hintText: 'Unidad',
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.car_rental)),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            await singIn();
            //showLoading();
            clearFields();
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            'Acceder',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }

  _support(context) {
    return TextButton(onPressed: () {}, child: const Text('Soporte técnico'));
  }

  showAlertDialog(context, title, message) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void clearFields() {
    _userTEC.text = '';
    _passwordTEC.text = '';
  }

  showLoading() {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Future singIn() async {
    //loading circle
    showDialog(context: context, builder: (context){
      return Center(child: CircularProgressIndicator());
    });

    var response = await BaseInfo()
        .get(
            '/verifyConfig/${_passwordTEC.text.toUpperCase()}/${_userTEC.text}')
        .catchError((err) {});

    if (!json.decode(response)['verify_config']) {
      showAlertDialog(context, 'Error', 'Los datos no coinciden');
    } else {
      var response = await BaseInfo()
          .get('/dataUserExactly/${_userTEC.text}')
          .catchError((err) {}); 
      var data = json.decode(response);

      globals.unidad = data[0]['Unidad'];
      globals.operador = data[0]['Operador'];
      globals.no_viaje = data[0]['no_viaje'];
      globals.ruta = data[0]['Ruta'];

      //debugPrint(data[0]['ruta']);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    }


  }
}
