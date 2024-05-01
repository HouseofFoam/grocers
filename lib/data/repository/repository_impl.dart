import 'package:grocers/data/database/menu_db.dart';
import 'package:grocers/data/database/user_db.dart';
import 'package:grocers/data/repository/repository.dart';
import 'package:grocers/model/menu.dart';
import 'package:grocers/model/user.dart';

class RepositoryImpl implements Repository {
  final MenuDB dbMenu;
  final UserDB dbUser;

  RepositoryImpl({required this.dbUser, required this.dbMenu});

  @override
  Future<List<Menu>> getAllMenu() async => dbMenu.getAllMenu();

  @override
  void setMenuData({required List<Menu> menus}) async {
    dbMenu.setData(menus);
  }

  @override
  Future<List<Menu>> getMenusByType({required String type}) async =>
      dbMenu.getMenuByStyle(type);

  @override
  Future<Menu> getMenuById({required int id}) async => dbMenu.getMenuById(id);

  @override
  Future<List<Menu>> getMenuByQuery({required String query}) async =>
      dbMenu.getMenuByQuery(query);

  @override
  void setUserData({required List<User> users}) {
    dbUser.setData(users);
  }

  @override
  Future<List<User>> getAllUser() async => dbUser.getAllUser();
}
