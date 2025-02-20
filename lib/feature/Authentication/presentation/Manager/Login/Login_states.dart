import 'package:graduation_project/feature/Authentication/domain/Entity/userinfo.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  LoginEntity model;
  LoginSuccess({required this.model});
}

class LoginFailure extends LoginState {
  final String error;
  const LoginFailure({required this.error});
}
