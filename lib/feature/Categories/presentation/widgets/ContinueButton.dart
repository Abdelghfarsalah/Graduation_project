import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';

class Continuebutton extends StatelessWidget {
  const Continuebutton({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff9CC7FF),
              Color(0xff5FA5FF),
            ]),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            "Continue",
            style: TextStyle(
                fontFamily: appFonts.Poppins,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
