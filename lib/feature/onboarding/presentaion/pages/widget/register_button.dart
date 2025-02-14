import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/RegisterPage.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Registerpage()));
      },
      child: Container(
        height: 61,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(95), color: Color(0xffC0DCFF)),
        child: Center(
          child: Text(
            "Sign up",
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
