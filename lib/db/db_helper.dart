import 'package:sqflite/sqflite.dart' as sqlf;
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

class DBHelper {
  //CREATE DB
  static Future<Database> database() async {
    final dbPath = await sqlf.getDatabasesPath();
    return sqlf.openDatabase(path.join(dbPath, 'feels.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_feels(id INTEGER PRIMARY KEY AUTOINCREMENT, datetime TEXT , feel TEXT, image TEXT, actimage TEXT, actname TEXT, foodimage, foodname , date TEXT)');
    }, version: 2);
  }

  //CREATE

  static Future<void> insertFeel(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
    ); //conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  //READ
  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    var res = await db.rawQuery('SELECT * FROM $table');
    return res.toList();
  }

  //DELETE
  static Future<void> delete(int id) async {
    final db = await DBHelper.database();
    await db.rawDelete('DELETE FROM user_feels WHERE id = $id');
  }

  static Future<void> deleteNew(String dateTime) async {
    final db = await DBHelper.database();
    await db.delete('user_feels', where: dateTime);
  }
}
