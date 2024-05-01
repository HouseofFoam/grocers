import 'package:grocers/model/menu.dart';
import 'package:grocers/model/user.dart';

abstract class Repository {
  Future<List<Menu>> getAllMenu();
  Future<List<Menu>> getMenusByType({required String type});
  void setMenuData({required List<Menu> menus});
  Future<Menu> getMenuById({required int id});
  Future<List<Menu>> getMenuByQuery({required String query});

  void setUserData({required List<User> users});
  Future<List<User>> getAllUser();
}
