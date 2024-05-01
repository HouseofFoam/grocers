import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:grocers/bloc/menu_specific/menu_specific_bloc.dart';

class MenuDetailBody extends StatelessWidget {
  final int id;
  const MenuDetailBody({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MenuSpecificBloc>(context).add(MenuChangeIdEvent(id: id));
    return BlocBuilder<MenuSpecificBloc, MenuSpecificState>(
      builder: (context, state) {
        if (state is MenuSpecificHasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              "Details",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Image.asset(state.menu.image),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Text(
                            state.menu.name,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vestibulum nulla turpis, at placerat neque feugiat a. Suspendisse scelerisque leo et est consectetur ullamcorper. Etiam ac odio sit amet odio varius venenatis vel sit amet tortor. Duis nec nulla efficitur, volutpat tortor ut, interdum tellus. Aenean ornare dolor non ipsum sodales dignissim. Vivamus posuere posuere tortor a maximus. Cras ligula felis, pellentesque et nibh at, condimentum cursus eros. Proin congue magna at lorem gravida commodo in vel orci. Nulla libero nisi, eleifend eget leo id, facilisis ultricies ex. Proin non tempor diam, vulputate sagittis risus. Nam pellentesque metus arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Praesent a dapibus sem, et fringilla eros.",
                            style:
                                TextStyle(color: Colors.grey[600], height: 2),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                child: ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.blueAccent)),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "+ Add to Cart",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              )
            ],
          );
        } else if (state is MenuSpecificHasError) {
          return Text(state.error);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
