import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Register/presentation/pages/widget/SendOtpByemailBody.dart';

class Sendotpbyemail extends StatelessWidget {
  const Sendotpbyemail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5EA5FF),
      body: Sendotpbyemailbody(),
    );
  }
}
