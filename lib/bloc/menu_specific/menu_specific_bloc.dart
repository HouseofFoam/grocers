import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocers/data/repository/repository.dart';
import 'package:grocers/main.dart';
import 'package:grocers/model/menu.dart';

part 'menu_specific_event.dart';
part 'menu_specific_state.dart';

class MenuSpecificBloc extends Bloc<MenuSpecificEvent, MenuSpecificState> {
  final Repository repository = injection<Repository>();
  MenuSpecificBloc() : super(MenuSpecificInitial()) {
    on<MenuChangeIdEvent>((event, emit) async {
      emit(MenuSpecificInitial());
      try {
        final Menu fetch = await repository.getMenuById(id: event.id);
        emit(MenuSpecificHasData(menu: fetch));
      } catch (e) {
        emit(MenuSpecificHasError(error: e.toString()));
      }
    });
  }
}
