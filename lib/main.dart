import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grocers/bloc/categories_index/categories_index_bloc.dart';
import 'package:grocers/bloc/menu_specific/menu_specific_bloc.dart';
import 'package:grocers/bloc/menu/menu_bloc.dart';
import 'package:grocers/bloc/search/search_bloc.dart';
import 'package:grocers/bloc/user/user_bloc.dart';
import 'package:grocers/data/database/database_service.dart';
import 'package:grocers/data/database/menu_db.dart';
import 'package:grocers/data/database/user_db.dart';
import 'package:grocers/data/repository/repository.dart';
import 'package:grocers/data/repository/repository_impl.dart';
import 'package:grocers/pages/home/home.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocers/pages/menu_detail.dart/menu_detail.dart';
import 'package:grocers/pages/search/search.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:google_fonts/google_fonts.dart';

final injection = GetIt.instance;
Future main() async {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  di();
  runApp(const MainApp());
}

void di() {
  injection.registerSingleton<DatabaseService>(DatabaseService());
  injection.registerSingleton<MenuDB>(
      MenuDB(dbService: injection<DatabaseService>()));
  injection.registerSingleton<UserDB>(
      UserDB(dbService: injection<DatabaseService>()));
  injection.registerSingleton<Repository>(
      RepositoryImpl(dbMenu: injection<MenuDB>(), dbUser: injection<UserDB>()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MenuBloc()),
          BlocProvider(create: (context) => CategoriesIndexBloc()),
          BlocProvider(create: (context) => MenuSpecificBloc()),
          BlocProvider(create: (context) => SearchBloc()),
          BlocProvider(create: (context) => UserBloc()),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
          theme:
              ThemeData(textTheme: GoogleFonts.montserratAlternatesTextTheme()),
          getPages: [
            GetPage(name: HomePage.route, page: () => const HomePage()),
            GetPage(name: MenuDetail.route, page: () => const MenuDetail()),
            GetPage(name: Search.route, page: () => const Search()),
          ],
        ));
  }
}
