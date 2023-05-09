import 'dart:math';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test_app/global.dart' as globals;

// ignore: camel_case_types
class localStorage {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'localStorage.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE checklistData (id INTEGER PRIMARY KEY, fecha Text, no_viaje INTEGER, unidad TEXT, IdOperador INTEGER, respuestas TEXT)');
    }, version: 1);
  }

  void insertNewCheskListRow() async {
    Database database = await _openDB();
    await database.insert('checklistData', {
      'fecha': globals.dateString,
      'no_viaje': globals.no_viaje,
      'unidad': globals.unidad,
      'IdOperador': globals.operador,
      'respuestas': globals.respuestas
    });
  }

  Future<bool> checkListDone() async {
    Database database = await _openDB();
    int count = await database.rawQuery(
          'SELECT COUNT(*) FROM checklistData WHERE no_viaje = ? AND fecha = ?',
          [globals.no_viaje, globals.dateString],
        ).then((result) => Sqflite.firstIntValue(result)) ??
        0;

    print(count);
    return count == 0 ? false : true;
  }

  

  //INSERT Y UPDATE SON LOS NECESARIOS PARA REALIZAR EL LLENADO Y VACIADO DE LA BD
}
