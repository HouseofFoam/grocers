part of 'categories_index_bloc.dart';

sealed class CategoriesIndexEvent extends Equatable {
  const CategoriesIndexEvent();

  @override
  List<Object> get props => [];
}

class ChangeIndexEvent extends CategoriesIndexEvent {
  final int newIndex;

  const ChangeIndexEvent({required this.newIndex});

  @override
  List<Object> get props => [newIndex];
}
