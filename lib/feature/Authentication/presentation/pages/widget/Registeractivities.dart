import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/Loginpage.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/ContinueWithAccounts.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/Form_and_buttonRegister.dart';

class Registeractivities extends StatelessWidget {
  const Registeractivities({super.key});

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
                FormAndButtonRegister(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have An Account?",
                      style: TextStyle(
                          fontFamily: appFonts.Poppins,
                          fontSize: 14,
                          color: Color(0xffACADB9),
                          fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Loginpage()),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontFamily: appFonts.Poppins,
                              fontSize: 16,
                              color: Color(0xff1A6EFC),
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Color(0xffC2C3CB),
                  thickness: 0,
                  height: 0.4,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                  child: Text(
                    "Continue With Accounts",
                    style: TextStyle(
                        fontFamily: appFonts.Poppins,
                        fontSize: 16,
                        color: Color(0xffACADB9),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Continuewithaccounts(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
