import 'package:grocers/model/menu.dart';

abstract class Repository {
  Future<List<Menu>> getAllMenu();
  void setData({required List<Menu> menus});
}
