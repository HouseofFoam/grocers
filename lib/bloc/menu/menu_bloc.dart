import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocers/data/repository/repository.dart';
import 'package:grocers/main.dart';
import 'package:grocers/model/menu.dart';
part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final Repository repository = injection<Repository>();
  MenuBloc() : super(MenuInitial()) {
    on<InsertMenusEvent>((event, emit) async {
      emit(MenuInitial());
      try {
        repository.setData(menus: event.menu);
        final List<Menu> fetch = await repository.getAllMenu();
        emit(MenuHasData(menus: fetch));
      } catch (e) {
        emit(MenuHasError(error: e.toString()));
      }
    });
  }
}
