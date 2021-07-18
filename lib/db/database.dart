import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqliteflutter/body/librost.dart';
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqlite_api.dart';

class DBBook{
  DBBook._();

  static final  DBBook db = DBBook._();
  Database _database;

  //para evitar que abra varias conexciones una y otra vez podemos usar algo como esto..
  Future<Database> get database async {
    if(_database != null) return _database;
    _database = await getDatabaseInstanace();
    return _database;
  }

  Future<Database> getDatabaseInstanace() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "libreria.db");
     return await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE Libreria ("
        "id integer primary key,"
        "name TEXT,"
            "auto TEXT,"
            "catego TEXT,"
            "fecha TEXT,"
            "estado TEXT"


        ")");
      });
  }


  Future<List<Client>> getAllClients() async {
    final db = await database;
    var response = await db.query("Libreria");
    List<Client> list = response.map((c) => Client.fromMap(c)).toList();
    return list;
  }

  Future<Client> getClientWithId(int id) async {
    final db = await database;
    var response = await db.query("Libreria", where: "id = ?", whereArgs: [id]);
    return response.isNotEmpty ? Client.fromMap(response.first) : null;
  }

  addClientToDatabase(Client client) async {
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Libreria");
    int id = table.first["id"];
    client.id = id;
    var raw = await db.insert(
      "Libreria",
      client.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;

  }


  deleteClientWithId(int id) async {
    final db = await database;
    return db.delete("Libreria", where: "id = ?", whereArgs: [id]);
  }


  deleteAllClient() async {
    final db = await database;
    db.delete("Libreria");
  }


  updateClient(Client client) async {
    final db = await database;
    var response = await db.update("Libreria", client.toMap(),
    where: "id = ?", whereArgs: [client.id]);
    return response;
  }

}