import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Register/presentation/pages/widget/Custom_button.dart';
import 'package:graduation_project/feature/Register/presentation/pages/widget/Email.dart';
import 'package:graduation_project/feature/Register/presentation/pages/widget/VerifyEmailcodeForResetPassword.dart';

class Enteremailtoforgetpass extends StatelessWidget {
  const Enteremailtoforgetpass({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 40),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: EmailTextField(
                    onChanged: (data) {},
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: CustomButton(
                    borderRadius: 14,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Verifyemailcodeforresetpassword()),
                      );
                    },
                    endcolor: Color(0xff9CC7FF),
                    color: Color(0xff5FA5FF),
                    width: MediaQuery.of(context).size.width,
                    text: 'Send OTP',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
