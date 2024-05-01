part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserHasData extends UserState {
  final List<User> users;

  const UserHasData({required this.users});

  @override
  List<Object> get props => [users];
}

final class UserHasError extends UserState {
  final String error;

  const UserHasError({required this.error});

  @override
  List<Object> get props => [error];
}
