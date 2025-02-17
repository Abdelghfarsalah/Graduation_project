import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/VerifyPhoneNumbercodebody.dart';

class VerifyPhoneNumbercode extends StatelessWidget {
  const VerifyPhoneNumbercode({super.key, required this.phone});
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5EA5FF),
      body: VerifyPhoneNumbercodebody(
        phone: phone,
      ),
    );
  }
}
