import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Authentication/domain/usecase/VerifyEmailUsecase.dart';
import 'package:graduation_project/feature/Authentication/domain/usecase/registerusecase.dart';
import 'package:graduation_project/feature/Authentication/domain/usecase/resendotpusecase.dart';

import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this.usecase, this.verifyEmailusecase, this.resendotpusecase)
      : super(RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
    on<VerifyEmailEvent>(_verifyEmail);
    on<resentdVerifyEmailEvent>(_resentdVerifyEmail);
  }
  String otp = "";
  String Email = "";
  final Registerusecase usecase;
  final VerifyEmailusecase verifyEmailusecase;
  final Resendotpusecase resendotpusecase;
  Future<void> _onRegisterSubmitted(
      RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    final response = await usecase.register(
        email: event.email, password: event.password, name: event.name);
    response.fold((ifLeft) {
      emit(RegisterFailure(error: ifLeft.error));
    }, (ifRight) {
      emit(RegisterSuccess(Email: ifRight.email));
    });
  }

  Future<void> _verifyEmail(
    VerifyEmailEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(VerifyEmailloading());

    var response = await verifyEmailusecase.VerifyEmail(
        email: event.email, otp: event.otp);
    response.fold((l) {
      emit(VerifyEmailFaliuer());
    }, (r) {
      emit(VerifyEmailsuccess());
    });
  }

  Future<void> _resentdVerifyEmail(
    resentdVerifyEmailEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(resendVerifyEmailloading());
    var response = await resendotpusecase.resendotp(email: event.email);
    response.fold((l) {
      emit(resendVerifyEmailFaliuer());
    }, (r) {
      emit(resendVerifyEmailsuccess());
    });
  }
}
