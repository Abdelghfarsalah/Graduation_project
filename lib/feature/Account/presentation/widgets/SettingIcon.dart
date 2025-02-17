import 'package:flutter/material.dart';

class Settingicon extends StatelessWidget {
  const Settingicon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 30,
        left: MediaQuery.of(context).size.width * 0.85,
        right: 20,
        child: Image.asset("assets/HomeImage/Accountimages/Setting.png"));
  }
}
