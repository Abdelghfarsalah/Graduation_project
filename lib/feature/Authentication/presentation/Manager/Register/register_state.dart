abstract class RegisterState {
  const RegisterState();
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String Email;

  RegisterSuccess({required this.Email});
}

class RegisterFailure extends RegisterState {
  final String error;
  const RegisterFailure({required this.error});
}

class VerifyEmailsuccess extends RegisterState {}

class VerifyEmailFaliuer extends RegisterState {}

class VerifyEmailloading extends RegisterState {}

class resendVerifyEmailsuccess extends RegisterState {}

class resendVerifyEmailFaliuer extends RegisterState {}

class resendVerifyEmailloading extends RegisterState {}
