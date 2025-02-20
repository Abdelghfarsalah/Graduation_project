abstract class Resetpassevent {
  const Resetpassevent();
}

class forgetpassword extends Resetpassevent {
  final String email;

  const forgetpassword({required this.email});
}

class forgetpasswordotp extends Resetpassevent {
  final String otp;
  final String email;

  const forgetpasswordotp({required this.otp, required this.email});
}

class forgetpasswordreset extends Resetpassevent {
  final String newpass;
  final String email;

  const forgetpasswordreset({required this.email, required this.newpass});
}
