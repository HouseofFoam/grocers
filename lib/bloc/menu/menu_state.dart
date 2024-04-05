part of 'menu_bloc.dart';

sealed class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

final class MenuInitial extends MenuState {}

final class MenuHasData extends MenuState {
  final List<Menu> menus;

  const MenuHasData({required this.menus});

  @override
  List<Object> get props => [menus];
}

final class MenuHasError extends MenuState {
  final String error;

  const MenuHasError({required this.error});

  @override
  List<Object> get props => [error];
}
