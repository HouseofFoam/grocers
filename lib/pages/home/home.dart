import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocers/bloc/menu/menu_bloc.dart';
import 'package:grocers/bloc/user/user_bloc.dart';
import 'package:grocers/model/menu.dart';
import 'package:grocers/model/user.dart';
import 'package:grocers/pages/home/home_body.dart';

class HomePage extends StatelessWidget {
  static const String route = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MenuBloc>(context).add(InsertMenusEvent(menu: batchOfMenu));
    BlocProvider.of<UserBloc>(context)
        .add(InsertUserEvent(users: batchOfUsers));
    return Scaffold(backgroundColor: Colors.grey[200], body: const HomeBody());
  }
}
