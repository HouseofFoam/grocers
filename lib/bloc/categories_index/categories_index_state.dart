part of 'categories_index_bloc.dart';

sealed class CategoriesIndexState extends Equatable {
  const CategoriesIndexState();

  @override
  List<Object> get props => [];
}

final class CategoriesIndexInitial extends CategoriesIndexState {
  final int index;

  const CategoriesIndexInitial({this.index = 0});

  @override
  List<Object> get props => [index];
}
