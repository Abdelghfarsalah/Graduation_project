import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/Loginpage.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Form_and_buttonRegister.dart';

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
                      "Don't Have An Account?",
                      style: TextStyle(
                          fontFamily: appFonts.Poppins,
                          fontSize: 14.sp,
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
                              fontSize: 16.sp,
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
                // Padding(
                //   padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                //   child: Text(
                //     "Continue With Accounts",
                //     style: TextStyle(
                //         fontFamily: appFonts.Poppins,
                //         fontSize: 16.sp,
                //         color: Color(0xffACADB9),
                //         fontWeight: FontWeight.w500),
                //   ),
                // ),
                // Continuewithaccounts(),

                SizedBox(height: 40.h),
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
                SizedBox(height: 20.h),
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
