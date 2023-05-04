import 'package:sqflite/sqflite.dart';
import 'generalStructure.dart';
import 'package:path/path.dart';

// ignore: camel_case_types
class localStorage {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'localStorage.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE checklistData (id INTEGER PRIMARY KEY, unidad TEXT, operador INTEGER, no_viaje INTEGER, respuestas TEXT)');
    }, version: 1);
  }

  static Future<int> insert(generalChecklistData data) async {
    Database database = await _openDB();

    return database.insert('checklistData', data.toMap());
  }

  static Future<int> delete(generalChecklistData data) async {
    Database database = await _openDB();

    return database
        .delete('checklistData', where: 'id = ?', whereArgs: [data.id]);
  }
}
