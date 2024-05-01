import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocers/pages/menu_detail.dart/menu_detail_body.dart';

class MenuDetail extends StatelessWidget {
  static const String route = '/detail';
  const MenuDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final int id = Get.arguments['menuId'];
    return Scaffold(
        backgroundColor: Colors.grey[200], body: MenuDetailBody(id: id));
  }
}
