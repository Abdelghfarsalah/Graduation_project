import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/helper.dart';
import 'package:graduation_project/feature/Register/presentation/pages/widget/Back_button.dart';
import 'package:graduation_project/feature/Register/presentation/pages/widget/Create_your_accout_Text.dart';
import 'package:graduation_project/feature/Register/presentation/pages/widget/Custom_button.dart';
import 'package:graduation_project/feature/Register/presentation/pages/widget/Password.dart';

class Resetyourpasswordpage extends StatefulWidget {
  const Resetyourpasswordpage({super.key});

  @override
  State<Resetyourpasswordpage> createState() => _ResetyourpasswordpageState();
}

class _ResetyourpasswordpageState extends State<Resetyourpasswordpage> {
  @override
  String pass = "";
  String Confirmpass = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5EA5FF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backButton(),
            CreateYourAccoutText(
              title: "Reset Your Password",
            ),
            Expanded(
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Password(onChanged: (data) {
                            pass = data;
                          }),
                          SizedBox(
                            height: 10,
                          ),
                          Text(". Password should be 8-20 characters",
                              style: TextStyle(
                                  fontFamily: appFonts.Poppins,
                                  fontSize: 12,
                                  color: Color(0xff838383))),
                          Text(". Password should have a lower case letter",
                              style: TextStyle(
                                  fontFamily: appFonts.Poppins,
                                  fontSize: 12,
                                  color: Color(0xff838383))),
                          Text(". Password should have a upper case letter",
                              style: TextStyle(
                                  fontFamily: appFonts.Poppins,
                                  fontSize: 12,
                                  color: Color(0xff838383))),
                          Text(
                              ". Password should have a number or\n    acceptable characters",
                              style: TextStyle(
                                  fontFamily: appFonts.Poppins,
                                  fontSize: 12,
                                  color: Color(0xff838383))),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Confirm Password",
                              style: TextStyle(
                                  fontFamily: appFonts.Poppins,
                                  fontSize: 14,
                                  color: Color(0xff282828))),
                          SizedBox(
                            height: 10,
                          ),
                          Password(onChanged: (data) {
                            Confirmpass = data;
                          }),
                          SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            borderRadius: 14,
                            onTap: () {
                              Helper.showSuccessDialog(context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             Verificationphone()));
                            },
                            endcolor: Color(0xff9CC7FF),
                            color: Color(0xff5FA5FF),
                            width: MediaQuery.of(context).size.width,
                            text: 'Reset',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
