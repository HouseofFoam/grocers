import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grocers/bloc/menu/menu_bloc.dart';
import 'package:grocers/data/database/database_service.dart';
import 'package:grocers/data/database/menu_db.dart';
import 'package:grocers/data/repository/repository.dart';
import 'package:grocers/data/repository/repository_impl.dart';
import 'package:grocers/pages/home.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  injection
      .registerSingleton<Repository>(RepositoryImpl(db: injection<MenuDB>()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => MenuBloc())],
        child: GetMaterialApp(
          home: HomePage(),
          theme:
              ThemeData(textTheme: GoogleFonts.montserratAlternatesTextTheme()),
        ));
  }
}
