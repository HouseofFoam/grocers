part of 'menu_bloc.dart';

sealed class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object> get props => [];
}

class FetchAllMenusEvent extends MenuEvent {}

class InsertMenusEvent extends MenuEvent {
  final List<Menu> menu;

  const InsertMenusEvent({required this.menu});

  @override
  List<Object> get props => [menu];
}
