import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  void _onRegisterSubmitted(
      RegisterSubmitted event, Emitter<RegisterState> emit) {
    emit(RegisterLoading());

    // Simulate registration process
    Future.delayed(Duration(seconds: 2), () {
      if (event.email.contains('@') && event.password.length >= 6) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailure(error: 'Invalid email or password'));
      }
    });
  }
}
