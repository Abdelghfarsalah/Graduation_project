import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Register/presentation/pages/ForgetPassword.dart';
import 'package:graduation_project/feature/Register/presentation/pages/VerificationPhone.dart';
import 'package:graduation_project/feature/Register/presentation/pages/widget/Custom_button.dart';
import 'package:graduation_project/feature/Register/presentation/pages/widget/Email.dart';
import 'package:graduation_project/feature/Register/presentation/pages/widget/Password.dart';

class FormAndButtonLogin extends StatelessWidget {
  const FormAndButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Form(
          key: key,
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            EmailTextField(onChanged: (data) {}),
            SizedBox(
              height: 20,
            ),
            Password(onChanged: (data) {}),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Forgetpassword(),
                    ),
                  );
                },
                child: Text(
                  "Forget Password ?",
                  style: TextStyle(
                    fontFamily: appFonts.Poppins,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff323142),
                  ),
                ),
              ),
            ),
            CustomButton(
              borderRadius: 14,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Verificationphone()));
              },
              endcolor: Color(0xff9CC7FF),
              color: Color(0xff5FA5FF),
              width: MediaQuery.of(context).size.width,
              text: 'Login',
            ),
          ])),
    );
  }
}
