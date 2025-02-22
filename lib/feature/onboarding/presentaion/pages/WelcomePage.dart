import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              SvgPicture.asset("assets/onboarding/WelcomeIcon.svg"),
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " Welcome to ",
                    style: TextStyle(
                        fontSize: 40.sp,
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
                      height: 38.h,
                      width: 38.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.black),
                      child: Center(
                        child: Image.asset("assets/Bot/Boticon.png",
                            height: 24.h, width: 24.w),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                "Smart Path",
                style: TextStyle(
                    fontFamily: appFonts.Urbanist,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 60.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: LoginButton(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: RegisterButton(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.h, bottom: 20.h),
                child: Text(
                  "Continue With Accounts",
                  style: TextStyle(
                      fontFamily: appFonts.Poppins,
                      fontSize: 16.sp,
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
                          "assets/onboarding/devicon_google.svg",
                          height: 30.h,
                          width: 30.w)),
                  SizedBox(
                    width: 20.w,
                  ),
                  ContinueWithAccountWidget(
                      onTap: () {},
                      icon: SvgPicture.asset(
                          "assets/onboarding/logos_facebook.svg",
                          height: 30.h,
                          width: 30.w)),
                  SizedBox(
                    width: 20.w,
                  ),
                  ContinueWithAccountWidget(
                      onTap: () {},
                      icon: SvgPicture.asset(
                          "assets/onboarding/pajamas_twitter.svg",
                          height: 30.h,
                          width: 30.w)),
                  SizedBox(
                    width: 20.w,
                  ),
                  ContinueWithAccountWidget(
                      onTap: () {},
                      icon: SvgPicture.asset(
                          "assets/onboarding/logos_linkedin-icon.svg",
                          height: 30.h,
                          width: 30.w)),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
