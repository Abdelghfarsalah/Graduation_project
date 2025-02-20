import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/registerBody.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5EA5FF),
      body: Registerbody(),
    );
  }
}
