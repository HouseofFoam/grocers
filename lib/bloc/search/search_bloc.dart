import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocers/data/repository/repository.dart';
import 'package:grocers/main.dart';
import 'package:grocers/model/menu.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Repository repository = injection<Repository>();
  SearchBloc() : super(SearchInitial()) {
    on<SearchQueryEvent>((event, emit) async {
      emit(SearchInitial());
      try {
        final List<Menu> menus =
            await repository.getMenuByQuery(query: event.query);
        emit(SearchHasData(menus: menus));
      } catch (e) {
        emit(SearchHasError(error: e.toString()));
      }
    });
  }
}
