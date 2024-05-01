part of 'menu_specific_bloc.dart';

sealed class MenuSpecificState extends Equatable {
  const MenuSpecificState();

  @override
  List<Object> get props => [];
}

final class MenuSpecificInitial extends MenuSpecificState {}

final class MenuSpecificHasData extends MenuSpecificState {
  final Menu menu;

  const MenuSpecificHasData({required this.menu});

  @override
  List<Object> get props => [menu];
}

final class MenuSpecificHasError extends MenuSpecificState {
  final String error;

  const MenuSpecificHasError({required this.error});

  @override
  List<Object> get props => [error];
}
