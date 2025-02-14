import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/ResetYourPasswordPage.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/Back_button.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/Custom_button.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/otp.dart';

class Verifyemailcodeforresetpassbody extends StatelessWidget {
  const Verifyemailcodeforresetpassbody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: backButton(),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(child: SizedBox()),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Expanded(
                        child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height * 0.7,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          )),
                    )),
                    Positioned(
                      top: -100,
                      left: 20,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        decoration: BoxDecoration(
                          color: Color(0xffF7F8FA),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Verify Email",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: appFonts.Poppins,
                                  fontSize: 22),
                            ),
                            Text(
                              "We Have Sent Code To Your Phone Number",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffACADB9),
                                  fontFamily: appFonts.Poppins,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Nora---fcai.usc.edu.eg",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffACADB9),
                                  fontFamily: appFonts.Poppins,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Otp(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: CustomButton(
                                borderRadius: 40,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Resetyourpasswordpage()));
                                },
                                endcolor: Color(0xff9CC7FF),
                                color: Color(0xff5FA5FF),
                                width: MediaQuery.of(context).size.width,
                                text: 'Verify',
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: CustomButton(
                                borderRadius: 40,
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Verificationphone()));
                                },
                                endcolor: Color(0xffC0DCFF),
                                color: Color(0xffC0DCFF),
                                width: MediaQuery.of(context).size.width,
                                text: 'Send Again',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
