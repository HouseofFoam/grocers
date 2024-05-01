part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchHasData extends SearchState {
  final List<Menu> menus;

  const SearchHasData({required this.menus});

  @override
  List<Object> get props => [menus];
}

final class SearchHasError extends SearchState {
  final String error;

  const SearchHasError({required this.error});

  @override
  List<Object> get props => [error];
}
