import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';

class Fingerprintbutton extends StatefulWidget {
  const Fingerprintbutton({super.key});

  @override
  State<Fingerprintbutton> createState() => _FingerprintbuttonState();
}

class _FingerprintbuttonState extends State<Fingerprintbutton> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: value,
        activeColor: Colors.white,
        inactiveThumbColor: Colors.white,
        padding: EdgeInsets.all(0),
        inactiveTrackColor: Color(0xffD9D9D9),
        activeTrackColor: appColor.Primarycolor,
        onChanged: (data) {
          setState(() {
            value = !value;
          });
        });
  }
}
