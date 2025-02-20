// login_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Authentication/data/repoImple/Loginrepoimple.dart';
import 'package:graduation_project/feature/Authentication/domain/usecase/loginUsecase.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Login/Login_event.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/Login/Login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Loginusecase loginusecase;
  final Authrepoimple authrepoimple;
  LoginBloc(this.loginusecase, this.authrepoimple) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }
  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    var response =
        await loginusecase.login(email: event.email, password: event.password);
    response.fold((ifLeft) {
      emit(LoginFailure(error: 'erro'));
    }, (ifRight) {
      emit(LoginSuccess(model: ifRight));
    });
  }
}
