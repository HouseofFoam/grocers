import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocers/bloc/menu/menu_bloc.dart';
import 'package:grocers/model/menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MenuBloc>(context).add(InsertMenusEvent(menu: batchOfMenu));
    return Scaffold(
        body: BlocBuilder<MenuBloc, MenuState>(builder: (context, state) {
      if (state is MenuHasData) {
        return GridView.builder(
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromARGB(255, 205, 226, 236),
              elevation: 0,
              shadowColor: Colors.black,
              margin: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    state.menus[index].image,
                    height: 120,
                    width: 120,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    state.menus[index].name.toUpperCase(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            );
          },
          itemCount: state.menus.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400),
        );
      } else if (state is MenuHasError) {
        return Text(state.error);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    }));
  }
}
