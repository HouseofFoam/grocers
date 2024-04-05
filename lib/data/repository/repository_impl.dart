import 'package:grocers/data/database/menu_db.dart';
import 'package:grocers/data/repository/repository.dart';
import 'package:grocers/model/menu.dart';

class RepositoryImpl implements Repository {
  final MenuDB db;

  RepositoryImpl({required this.db});

  @override
  Future<List<Menu>> getAllMenu() async {
    return db.getAllMenu();
  }

  @override
  void setData({required List<Menu> menus}) async {
    db.setData(menus);
  }
}
