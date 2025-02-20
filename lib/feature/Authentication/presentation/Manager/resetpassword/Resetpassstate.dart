sealed class Resetpassstate {}

class init extends Resetpassstate {}

class forgetpasswordLoading extends Resetpassstate {}

class forgetpasswordSuccess extends Resetpassstate {
  final String email;

  forgetpasswordSuccess({required this.email});
}

class forgetpasswordFailure extends Resetpassstate {}

class forgetpasswordotpLoading extends Resetpassstate {}

class forgetpasswordotpSuccess extends Resetpassstate {}

class forgetpasswordotpFailure extends Resetpassstate {}

class forgetpasswordresetLoading extends Resetpassstate {}

class forgetpasswordresetSuccess extends Resetpassstate {}

class forgetpasswordresetFailure extends Resetpassstate {}
