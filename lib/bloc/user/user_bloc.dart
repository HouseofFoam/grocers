import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocers/data/repository/repository.dart';
import 'package:grocers/main.dart';
import 'package:grocers/model/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Repository repository = injection<Repository>();
  UserBloc() : super(UserInitial()) {
    on<InsertUserEvent>((event, emit) async {
      emit(UserInitial());
      try {
        repository.setUserData(users: event.users);
        final List<User> fetch = await repository.getAllUser();
        emit(UserHasData(users: fetch));
      } catch (e) {
        emit(UserHasError(error: e.toString()));
      }
    });
  }
}
