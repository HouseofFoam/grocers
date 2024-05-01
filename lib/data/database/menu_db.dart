import 'package:grocers/data/database/database_service.dart';
import 'package:grocers/model/menu.dart';
import 'package:sqflite/sqflite.dart';

class MenuDB {
  final tableName = "menu";
  final DatabaseService dbService;
  MenuDB({required this.dbService});

  Future<List<Menu>> getAllMenu() async {
    final db = await dbService.database;
    final List<Map<String, Object?>> menuMap = await db.query(tableName);
    return [
      for (final {
            'id': id as int,
            'name': name as String,
            'price': price as int,
            'image': image as String,
            'type': type as String
          } in menuMap)
        Menu(id: id, name: name, price: price, image: image, type: type),
    ];
  }

  Future<List<Menu>> getMenuByStyle(String type) async {
    final db = await dbService.database;
    final List<Map<String, Object?>> menuMap =
        await db.query(tableName, where: 'type = ?', whereArgs: [type]);
    return [
      for (final {
            'id': id as int,
            'name': name as String,
            'price': price as int,
            'image': image as String,
            'type': type as String
          } in menuMap)
        Menu(id: id, name: name, price: price, image: image, type: type),
    ];
  }

  void setData(List<Menu> menus) async {
    final db = await dbService.database;
    final batch = db.batch();
    for (var element in menus) {
      batch.insert(tableName, element.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    batch.commit();
  }

  Future<Menu> getMenuById(int id) async {
    final db = await dbService.database;
    final List<Map<String, Object?>> menuMap =
        await db.query(tableName, where: 'id = ?', whereArgs: [id]);

    final List<Menu> menuList = [
      for (final {
            'id': id as int,
            'name': name as String,
            'price': price as int,
            'image': image as String,
            'type': type as String
          } in menuMap)
        Menu(id: id, name: name, price: price, image: image, type: type),
    ];

    return menuList[0];
  }

  Future<List<Menu>> getMenuByQuery(String query) async {
    final db = await dbService.database;
    final List<Map<String, Object?>> menuMap = await db
        .query(tableName, where: 'name LIKE ?', whereArgs: ['%$query%']);
    final List<Menu> menuList = [
      for (final {
            'id': id as int,
            'name': name as String,
            'price': price as int,
            'image': image as String,
            'type': type as String
          } in menuMap)
        Menu(id: id, name: name, price: price, image: image, type: type),
    ];

    return menuList;
  }
}
