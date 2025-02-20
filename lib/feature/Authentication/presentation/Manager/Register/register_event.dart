abstract class RegisterEvent {
  const RegisterEvent();
}

class RegisterSubmitted extends RegisterEvent {
  final String email;
  final String password;
  final String name;

  const RegisterSubmitted({
    required this.email,
    required this.password,
    required this.name,
  });
}

class VerifyEmailEvent extends RegisterEvent {
  final String email;
  final String otp;

  const VerifyEmailEvent({
    required this.email,
    required this.otp,
  });
}

class resentdVerifyEmailEvent extends RegisterEvent {
  final String email;

  const resentdVerifyEmailEvent({
    required this.email,
  });
}
