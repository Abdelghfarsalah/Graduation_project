import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/VerifyEmailcodeForResetPassbody.dart';

class Verifyemailcodeforresetpassword extends StatelessWidget {
  const Verifyemailcodeforresetpassword({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff5EA5FF),
        body: Verifyemailcodeforresetpassbody(
          Email: email,
        ));
  }
}
