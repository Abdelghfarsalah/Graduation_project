import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/chat/presentation/pages/chatpage.dart';
import 'package:graduation_project/feature/chat/presentation/pages/welcomepage.dart';
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
                    onTap: () async {
                      bool dontshowwelcomepage = await SharedPreferencesDemo
                              .GetDontshowwelcomepageForChatBot() ??
                          false;
                      if (dontshowwelcomepage) {
                        Animationsforpages.navigateWithSlidepush(
                            context, Chatpage());
                        ;
                      } else {
                        Animationsforpages.navigateWithSlidepush(
                            context, WelcomepageChabot());
                      }
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
              // Padding(
              //   padding: EdgeInsets.only(top: 40.h, bottom: 20.h),
              //   child: Text(
              //     "Continue With Accounts",
              //     style: TextStyle(
              //         fontFamily: appFonts.Poppins,
              //         fontSize: 16.sp,
              //         color: Color(0xffACADB9),
              //         fontWeight: FontWeight.w500),
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ContinueWithAccountWidget(
              //         onTap: () {},
              //         icon: SvgPicture.asset(
              //             "assets/onboarding/devicon_google.svg",
              //             height: 30.h,
              //             width: 30.w)),
              //     SizedBox(
              //       width: 20.w,
              //     ),
              //     ContinueWithAccountWidget(
              //         onTap: () {},
              //         icon: SvgPicture.asset(
              //             "assets/onboarding/logos_facebook.svg",
              //             height: 30.h,
              //             width: 30.w)),
              //     SizedBox(
              //       width: 20.w,
              //     ),
              //     ContinueWithAccountWidget(
              //         onTap: () {},
              //         icon: SvgPicture.asset(
              //             "assets/onboarding/pajamas_twitter.svg",
              //             height: 30.h,
              //             width: 30.w)),
              //     SizedBox(
              //       width: 20.w,
              //     ),
              //     ContinueWithAccountWidget(
              //         onTap: () {},
              //         icon: SvgPicture.asset(
              //             "assets/onboarding/logos_linkedin-icon.svg",
              //             height: 30.h,
              //             width: 30.w)),
              //   ],
              // ),
              // SizedBox(
              //   height: 50.h,
              // ),

              SizedBox(height: 40.h),
              // Text(
              //   "The Fastest Way to Smart Learning",
              //   style: TextStyle(
              //     fontSize: 14.sp,
              //     fontFamily: appFonts.Poppins,
              //     fontWeight: FontWeight.w800,
              //     color: Color(0xFF2E384D),
              //     height: 1.3,
              //   ),
              //   // textAlign: TextAlign.center,
              // ),
              // SizedBox(height: 8.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Sign up now and get a personalized learning roadmap powered by AI",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: appFonts.Poppins,
                    color: Color(0xFF888FA6),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 40.h),

              // Platform Features Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    _buildFeatureCard(
                      icon: Icons.map_rounded,
                      color: Color(0xFF4A90E2),
                      title: "AI-Powered Learning Maps",
                      description:
                          "Create personalized learning paths with our intelligent roadmap generator",
                    ),
                    SizedBox(height: 20.h),
                    _buildFeatureCard(
                      icon: Icons.recommend_rounded,
                      color: Color(0xFF4CAF50),
                      title: "Smart Recommendations",
                      description:
                          "Get tailored course and resource suggestions based on your goals",
                    ),
                    SizedBox(height: 20.h),
                    _buildFeatureCard(
                      icon: Icons.forum_rounded,
                      color: Color(0xFFF44336),
                      title: "Collaborative Learning",
                      description:
                          "Join group chats and discussions with peers on similar paths",
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required Color color,
    required String title,
    required String description,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(icon, color: color, size: 28.w),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: appFonts.Poppins,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: appFonts.Poppins,
                    fontSize: 13.sp,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
