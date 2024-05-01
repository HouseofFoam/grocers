import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String password;
  final String name;

  const User({required this.email, required this.password, required this.name});

  @override
  List<Object?> get props => [email, password, name];

  Map<String, Object?> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
    };
  }
}

List<User> batchOfUsers = [
  const User(
      email: "example@example.com",
      password: "examplepassword",
      name: "Example Name"),
  const User(
      email: "ifan@gmail.com", password: "passwordifan", name: "Ifan Perdana")
];
