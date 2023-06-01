import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseURLEVENT =
    'https://track.milac.com.mx/MilacServices/EventTrac/api';

class BaseInfo {
  var info = http.Client();
  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseURLEVENT + api);

    try {
      var response = await info.get(url);
      if (response.statusCode == 200)
        return response.body;
      else {
        print('Error en el insert. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      print('Error en la conexión: $error');
    }
  }

  Future<void> insertarDatos(
      String operador, String unidad, String noViaje, String date) async {
    var url = Uri.parse(
        'https://track.milac.com.mx/MilacServices/MilacNavigation/api/v1/automaticBinnacle/newBin'); // Reemplaza con la URL de tu servidor y la ruta para insertar datos

    // Datos que deseas enviar al servidor
    var datos = {
      'operador': operador,
      'unidad': unidad,
      'noViaje': noViaje,
      'date': date
    };

    var headers = <String, String>{
      'Authorization':
          'Basic ' + base64Encode(utf8.encode('m1L4cN4v1G4T10n:n4V1sySt3m_')),
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    try {
      var respuesta = await http.post(url, body: datos, headers: headers);

      if (respuesta.statusCode == 200) {
        print('Insert realizado con éxito');
        print(respuesta.body);
      } else {
        print('Error en el insert. Código de estado: ${respuesta.statusCode}');
      }
    } catch (error) {
      print('Error en la conexión: $error');
    }
  }


Future<List<Map<String, dynamic>>> sendGetRequestWithBody(
    String endpoint, String operador, String unidad) async {
  var url = Uri.parse(endpoint);
  var datos = {'operador': operador, 'unidad': unidad};
  var headers = <String, String>{
    'Authorization':
        'Basic ' + base64Encode(utf8.encode('m1L4cN4v1G4T10n:n4V1sySt3m_')),
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  try {
    var respuesta = await http.post(url, body: datos, headers: headers);
    if (respuesta.statusCode == 200) {
      print('Datos recuperados con éxito');
      var jsonResponse = jsonDecode(respuesta.body);
      if (jsonResponse is List) {
        print(jsonResponse.cast<Map<String, dynamic>>());
        return jsonResponse.cast<Map<String, dynamic>>();
      } else {
        print('La respuesta no es una lista válida');
        return [];
      }
    } else {
      print(
          'Error al recuperar la información. Código de estado: ${respuesta.statusCode}');
      return [];
    }
  } catch (error) {
    print('Error en la conexión: $error');
    return [];
  }
}

}
