import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Register/presentation/pages/Loginpage.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Loginpage()));
      },
      child: Container(
        height: 61,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(95),
            gradient: LinearGradient(colors: [
              Color(0xff5FA5FF),
              Color(0xff9CC7FF),
              Color(0xff9CC7FF)
            ])),
        child: Center(
          child: Text(
            "Log in",
            style: TextStyle(
                fontFamily: appFonts.Urbanist,
                fontSize: 18,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
