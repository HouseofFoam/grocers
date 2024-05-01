part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchUserEvent extends UserEvent {}

class InsertUserEvent extends UserEvent {
  final List<User> users;

  const InsertUserEvent({required this.users});

  @override
  List<Object> get props => [users];
}
