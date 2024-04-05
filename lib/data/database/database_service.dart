import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  final tableName = "menus";
  late Database _database;

  Future<Database> get database async {
    _database = await _initialize();
    return _database;
  }

  Future<String> get fullPath async {
    const name = 'menu.db';
    final path = await getDatabasesPath();
    if (Platform.isWindows || Platform.isLinux) {
      return path;
    }
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    Database database = await openDatabase(path,
        version: 1, onCreate: create, singleInstance: true);
    return database;
  }

  Future<void> create(Database db, int version) async => await db.execute(
      """CREATE TABLE $tableName( "id" INTEGER NOT NULL PRIMARY KEY, "name" VARCHAR(255) NOT NULL, "price" INTEGER NOT NULL, "image" VARCHAR(255) NOT NULL); """);
}
