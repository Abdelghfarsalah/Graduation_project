// login_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Authentication/data/repoImple/Loginrepoimple.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/resetpassword/Resetpassevent.dart';
import 'package:graduation_project/feature/Authentication/presentation/Manager/resetpassword/Resetpassstate.dart';

class Resetpassbloc extends Bloc<Resetpassevent, Resetpassstate> {
  final Authrepoimple authrepoimple;
  Resetpassbloc(this.authrepoimple) : super(init()) {
    on<forgetpasswordotp>(_forgetpasswordotp);
    on<forgetpasswordreset>(_forgetpasswordreset);
    on<forgetpassword>(_forgetpassword);
  }

  Future<void> _forgetpassword(
      forgetpassword event, Emitter<Resetpassstate> emit) async {
    emit(forgetpasswordLoading());
    var res = await authrepoimple.forgetPassword(email: event.email);
    res.fold((ifLeft) {
      emit(forgetpasswordFailure());
    }, (ifRight) {
      emit(forgetpasswordSuccess(email: event.email));
    });
  }

  Future<void> _forgetpasswordreset(
      forgetpasswordreset event, Emitter<Resetpassstate> emit) async {
    emit(forgetpasswordresetLoading());
    print(event.email);
    print(event.email);
    print(event.email);
    var res = await authrepoimple.forgetPasswordReset(
        email: event.email, newPassword: event.newpass);
    res.fold((ifLeft) {
      emit(forgetpasswordresetFailure());
    }, (ifRight) {
      emit(forgetpasswordresetSuccess());
    });
  }

  String otp = "";
  Future<void> _forgetpasswordotp(
      forgetpasswordotp event, Emitter<Resetpassstate> emit) async {
    emit(forgetpasswordotpLoading());
    var res = await authrepoimple.forgetPasswordVerifyOtp(
        email: event.email, otp: event.otp);
    res.fold((ifLeft) {
      emit(forgetpasswordotpFailure());
    }, (ifRight) {
      emit(forgetpasswordotpSuccess());
    });
  }
}
