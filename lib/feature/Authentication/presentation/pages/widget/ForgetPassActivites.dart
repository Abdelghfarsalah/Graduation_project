import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/SendOtpbyEmail.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/VerificationPhone.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/Custom_button.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/SentCodeForResetPasswordWidget.dart';

class Forgetpassactivites extends StatefulWidget {
  const Forgetpassactivites({super.key});

  @override
  State<Forgetpassactivites> createState() => _ForgetpassactivitesState();
}

class _ForgetpassactivitesState extends State<Forgetpassactivites> {
  bool Selectemail = true;
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Selectemail = true;
                    });
                  },
                  child: SentCodeForResetPasswordWidget(
                      Selectemail: Selectemail,
                      title: "Email",
                      icon: SvgPicture.asset("assets/Icons/Email Icon (1).svg"),
                      subtitle: "Code Send to your email"),
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Selectemail = false;
                    });
                  },
                  child: SentCodeForResetPasswordWidget(
                      Selectemail: !Selectemail,
                      title: "Phone ",
                      icon: SvgPicture.asset("assets/Icons/Email Icon (1).svg"),
                      subtitle: "Code Send to your Phone"),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: CustomButton(
                    borderRadius: 14,
                    onTap: () {
                      if (Selectemail) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Sendotpbyemail()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Verificationphone()));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => SendotPbyphone()));
                      }
                    },
                    endcolor: Color(0xff9CC7FF),
                    color: Color(0xff5FA5FF),
                    width: MediaQuery.of(context).size.width,
                    text: 'Next',
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
