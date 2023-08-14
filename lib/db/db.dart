import 'package:mundo_preescolar/db/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<bool> databaseExists() async =>
      databaseFactory.databaseExists(join(await getDatabasesPath(), 'demo.db'));

  static Future<Database> _openDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'demo.db');
    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      return db.execute(
          'CREATE TABLE usuario (id INTEGER PRIMARY KEY, name TEXT, genre TEXT, score INTEGER)');
    });
  }

  static Future<void> insert(Usuario usuario) async {
    Database db = await _openDB();
    db.insert('usuario', usuario.toMap());
  }

  static Future<void> update(Usuario usuario) async {
    Database db = await _openDB();
    db.update('usuario', usuario.toMap(),
        where: 'id = ?', whereArgs: [usuario.id]);
  }

  static Future<List<Usuario>> select() async {
    Database db = await _openDB();
    List<Map<String, dynamic>> usuarioList =
        await db.query('usuario', limit: 1);
    return List.generate(
        usuarioList.length,
        (i) => Usuario(
              id: usuarioList[i]['id'],
              name: usuarioList[i]['name'],
              genre: usuarioList[i]['genre'],
              score: usuarioList[i]['score'],
            ));
  }

  static void deleteBD() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'demo.db');
    await deleteDatabase(path);
  }
}
