import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/chat/presentation/pages/welcomepage.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/widget/Continue_With_Account_widget.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/widget/login_button.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/widget/register_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F8FA),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            SvgPicture.asset("assets/onboarding/WelcomeIcon.svg"),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  " Welcome to ",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: appFonts.Urbanist,
                      fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WelcomepageChabot()),
                    );
                  },
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black),
                    child: Center(
                      child: Image.asset("assets/Bot/Boticon.png"),
                    ),
                  ),
                )
              ],
            ),
            Text(
              "Smart Path",
              style: TextStyle(
                  fontFamily: appFonts.Urbanist,
                  fontSize: 40,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: LoginButton(),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: RegisterButton(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 20),
              child: Text(
                "Continue With Accounts",
                style: TextStyle(
                    fontFamily: appFonts.Poppins,
                    fontSize: 16,
                    color: Color(0xffACADB9),
                    fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContinueWithAccountWidget(
                    onTap: () {},
                    icon: SvgPicture.asset(
                        "assets/onboarding/devicon_google.svg")),
                SizedBox(
                  width: 20,
                ),
                ContinueWithAccountWidget(
                    onTap: () {},
                    icon: SvgPicture.asset(
                        "assets/onboarding/logos_facebook.svg")),
                SizedBox(
                  width: 20,
                ),
                ContinueWithAccountWidget(
                    onTap: () {},
                    icon: SvgPicture.asset(
                        "assets/onboarding/pajamas_twitter.svg")),
                SizedBox(
                  width: 20,
                ),
                ContinueWithAccountWidget(
                    onTap: () {},
                    icon: SvgPicture.asset(
                        "assets/onboarding/logos_linkedin-icon.svg")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
