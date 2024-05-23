import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:grocers/bloc/categories_index/categories_index_bloc.dart';
import 'package:grocers/bloc/menu/menu_bloc.dart';
import 'package:grocers/pages/menu_detail.dart/menu_detail.dart';
import 'package:grocers/pages/search/search.dart';
import 'package:grocers/widget/categories_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Container(
                padding: const EdgeInsets.all(12),
                height: 240,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Colors.blueAccent,
                    Color.fromARGB(255, 109, 223, 252)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/images/cake.png',
                      width: 160,
                      height: 160,
                    ),
                    const SizedBox(
                      width: 160,
                      child: Text(
                        "Buy 3 get 1 Cake Free for Rp. 30,000 Limited",
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: GestureDetector(
              onTap: () => Get.toNamed(Search.route),
              child: Container(
                padding: const EdgeInsets.all(12),
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.search_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Search Your Foods and Drinks",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: categoriesChooser()),
          ),
          BlocBuilder<MenuBloc, MenuState>(
            builder: (context, state) {
              if (state is MenuHasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      elevation: 0,
                      shadowColor: Colors.black,
                      margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: index == 0 ? 0 : 8,
                          bottom: index == state.menus.length - 1 ? 8 : 0),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 12, bottom: 12, left: 8, right: 0),
                        child: GestureDetector(
                          onTap: () => Get.toNamed(MenuDetail.route,
                              arguments: {'menuId': state.menus[index].id}),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                state.menus[index].image,
                                height: 60,
                                width: 60,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                state.menus[index].name.toUpperCase(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: state.menus.length,
                );
              } else if (state is MenuHasError) {
                return Text(state.error);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

Padding categoriesChooser() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: Container(
        width: double.infinity,
        height: 40,
        color: Colors.white,
        child: BlocBuilder<CategoriesIndexBloc, CategoriesIndexState>(
          builder: (context, state) {
            if (state is CategoriesIndexInitial) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CategoriesWidget(
                    index: state.index,
                    onTap: () {
                      context.read<CategoriesIndexBloc>().add(
                            const ChangeIndexEvent(newIndex: 0),
                          );
                      context.read<MenuBloc>().add(
                            const ChangeMenusByTypeEvent(type: ''),
                          );
                    },
                    name: 'All',
                    intendedIndex: 0,
                    image: 'lib/images/noodles.png',
                  ),
                  CategoriesWidget(
                    index: state.index,
                    onTap: () {
                      context.read<CategoriesIndexBloc>().add(
                            const ChangeIndexEvent(newIndex: 1),
                          );
                      context.read<MenuBloc>().add(
                            const ChangeMenusByTypeEvent(type: 'food'),
                          );
                    },
                    name: 'Foods',
                    intendedIndex: 1,
                    image: 'lib/images/steak.png',
                  ),
                  CategoriesWidget(
                    index: state.index,
                    onTap: () {
                      context.read<CategoriesIndexBloc>().add(
                            const ChangeIndexEvent(newIndex: 2),
                          );
                      context.read<MenuBloc>().add(
                            const ChangeMenusByTypeEvent(type: 'drink'),
                          );
                    },
                    name: 'Drinks',
                    intendedIndex: 2,
                    image: 'lib/images/soft-drinks.png',
                  ),
                ],
              );
            } else {
              return const Text("There is a problem!");
            }
          },
        ),
      ),
    ),
  );
}
