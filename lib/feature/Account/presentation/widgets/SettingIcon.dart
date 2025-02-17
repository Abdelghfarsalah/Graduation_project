import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Account/presentation/pages/SettingPage.dart';

class Settingicon extends StatelessWidget {
  const Settingicon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 50,
        left: MediaQuery.of(context).size.width * 0.85,
        right: 20,
        child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Settingpage()));
            },
            child: Image.asset("assets/HomeImage/Accountimages/Setting.png")));
  }
}
