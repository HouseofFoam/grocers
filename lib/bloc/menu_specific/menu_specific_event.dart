part of 'menu_specific_bloc.dart';

sealed class MenuSpecificEvent extends Equatable {
  const MenuSpecificEvent();

  @override
  List<Object> get props => [];
}

class MenuChangeIdEvent extends MenuSpecificEvent {
  final int id;

  const MenuChangeIdEvent({required this.id});

  @override
  List<Object> get props => [id];
}
