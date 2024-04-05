import 'package:grocers/data/database/database_service.dart';
import 'package:grocers/model/menu.dart';
import 'package:sqflite/sqflite.dart';

class MenuDB {
  final tableName = "menus";
  final DatabaseService dbService;
  MenuDB({required this.dbService});

  Future<List<Menu>> getAllMenu() async {
    final db = await dbService.database;
    final List<Map<String, Object?>> menuMap = await db.query('menus');
    return [
      for (final {
            'id': id as int,
            'name': name as String,
            'price': price as int,
            'image': image as String
          } in menuMap)
        Menu(id: id, name: name, price: price, image: image),
    ];
  }

  void setData(List<Menu> menus) async {
    final db = await dbService.database;
    final batch = db.batch();
    for (var element in menus) {
      batch.insert('menus', element.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    batch.commit();
  }
}
