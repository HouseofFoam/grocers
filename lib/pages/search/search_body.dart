import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:grocers/bloc/search/search_bloc.dart';
import 'package:grocers/pages/menu_detail.dart/menu_detail.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                onChanged: (query) {
                  context
                      .read<SearchBloc>()
                      .add(SearchQueryEvent(query: query));
                },
                decoration: InputDecoration(
                  icon: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  iconColor: Colors.black,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(999)),
                  hintText: "Search Your Foods and Drinks",
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            if (state is SearchHasData) {
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
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })
        ],
      ),
    );
  }
}
