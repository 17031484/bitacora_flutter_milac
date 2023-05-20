import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test_app/global.dart' as globals;

// ignore: camel_case_types
class localStorage {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'localStorage.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE checklistData (id INTEGER PRIMARY KEY, fecha Text, no_viaje INTEGER, unidad TEXT, IdOperador INTEGER, respuestas TEXT, ruta TEXT)');
    }, version: 1);
  }

  void insertNewCheskListRow() async {
    Database database = await _openDB();
    await database.insert('checklistData', {
      'fecha': globals.dateString,
      'no_viaje': globals.no_viaje,
      'unidad': globals.unidad,
      'IdOperador': globals.operador,
      'respuestas': globals.respuestas,
      'ruta': globals.ruta
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

  Future<List<Map<String, dynamic>>> getRecordsFromDatabase() async {
    Database db = await _openDB();
    List<Map<String, dynamic>> queryResult = await db.query('checklistData',
        columns: ['no_viaje, ruta'],
        where: 'IdOperador = ? AND unidad = ?',
        whereArgs: [globals.operador, globals.unidad],
        groupBy: 'no_viaje, ruta');

    return queryResult;
  }

  Future<List<Map<String, dynamic>>> getDataFormRecord(int noViaje) async {
    Database db = await _openDB();
    List<Map<String, dynamic>> queryResult = await db.query('checklistData',
        columns: ['fecha, respuestas'],
        where: 'no_viaje = ?',
        whereArgs: [noViaje]);

    return queryResult;
  }

  Future<List<Map<String, dynamic>>> getTotalRecords(int noViaje) async {
    Database db = await _openDB();
    List<Map<String, dynamic>> queryResult = await db.query('checklistData',
        columns: ['COUNT(*)'], where: 'no_viaje = ?', whereArgs: [noViaje]);

    return queryResult;
  }

  Future<Map<String, dynamic>?> getLastRecord(noViaje) async {
    Database db = await _openDB();
    final records = await db.query('checklistData',
        orderBy: 'fecha DESC',
        where: 'no_viaje = ?',
        whereArgs: [noViaje],
        limit: 1);

    return records.isNotEmpty ? records.first : null;
  }

  //INSERT Y UPDATE SON LOS NECESARIOS PARA REALIZAR EL LLENADO Y VACIADO DE LA BD
}
