import 'package:grocers/data/database/database_service.dart';
import 'package:grocers/model/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDB {
  final tableName = "login";
  final DatabaseService dbService;

  UserDB({required this.dbService});

  void setData(List<User> users) async {
    final db = await dbService.database;
    final batch = db.batch();
    for (var element in users) {
      batch.insert(tableName, element.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    batch.commit();
  }

  Future<List<User>> getAllUser() async {
    final db = await dbService.database;
    final List<Map<String, Object?>> userMap = await db.query(tableName);
    return [
      for (final {
            'email': email as String,
            'name': name as String,
            'password': password as String,
          } in userMap)
        User(email: email, password: password, name: name),
    ];
  }
}
