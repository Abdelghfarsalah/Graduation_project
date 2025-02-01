// login_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Login/presentation/Bloc/Login_event.dart';
import 'package:graduation_project/feature/Login/presentation/Bloc/Login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) {
    emit(LoginLoading());

    // Simulate login process
    Future.delayed(Duration(seconds: 2), () {
      if (event.email.contains('@') && event.password.length >= 6) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(error: 'Invalid email or password'));
      }
    });
  }
}
