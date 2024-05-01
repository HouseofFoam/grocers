import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocers/bloc/search/search_bloc.dart';
import 'package:grocers/pages/search/search_body.dart';

class Search extends StatelessWidget {
  static const String route = "/search";
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchBloc>(context).add(const SearchQueryEvent(query: ""));
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const SearchBody(),
    );
  }
}
