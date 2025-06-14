import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/Account/domain/Entities/PersonalInformationmodel.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/PersonalInformationCard.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/ForgetPassword.dart';

class Displaypersonalinformation extends StatefulWidget {
  const Displaypersonalinformation({super.key});

  @override
  State<Displaypersonalinformation> createState() =>
      _DisplaypersonalinformationState();
}

class _DisplaypersonalinformationState
    extends State<Displaypersonalinformation> {
  List<Personalinformationmodel> PersonalinformationListmethod(
      BuildContext context) {
    return [
      Personalinformationmodel(
          title: "Email",
          icon: FutureBuilder(
            future: SharedPreferencesDemo.getUserEmail(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text(" loading email..."); // أو شيمر مثلاً
              } else if (snapshot.hasError) {
                return Text("Error loading email");
              } else if (snapshot.hasData) {
                return Text(
                  snapshot.data!,
                  style: TextStyle(
                    fontFamily: appFonts.Poppins,
                    fontSize: 12.sp,
                    color: Color(0xff001A4D),
                    fontWeight: FontWeight.w400,
                  ),
                );
              } else {
                return Text("No email found");
              }
            },
          )),
      Personalinformationmodel(
        title: "Mobile Phone",
        icon: Text(
          "+201008751062",
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontSize: 12.sp,
              color: Color(0xff001A4D),
              fontWeight: FontWeight.w400),
        ),
      ),
      Personalinformationmodel(
        title: "Current Track",
        icon: Text(
          "UI Designer",
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontSize: 12.sp,
              color: Color(0xff001A4D),
              fontWeight: FontWeight.w400),
        ),
      ),
      Personalinformationmodel(
        title: "Number of completed Tracks ",
        icon: Text(
          "3",
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontSize: 12.sp,
              color: Color(0xff001A4D),
              fontWeight: FontWeight.w400),
        ),
      ),
      // Personalinformationmodel(
      //   title: "Digital badges or awards",
      //   icon: Text(
      //     "4",
      //     style: TextStyle(
      //         fontFamily: appFonts.Poppins,
      //         fontSize: 12.sp,
      //         color: Color(0xff001A4D),
      //         fontWeight: FontWeight.w400),
      //   ),
      // ),
      // Personalinformationmodel(
      //   title: "Change Pin",
      //   icon: GestureDetector(
      //       onTap: () {},
      //       child: Icon(
      //         Icons.arrow_forward_ios,
      //         color: appColor.Primarycolor,
      //       )),
      // ),
      Personalinformationmodel(
        title: "Change Password",
        icon: GestureDetector(
            onTap: () {
              Animationsforpages.navigateWithSlidepush(
                  context, Forgetpassword());
            },
            child: Icon(
              Icons.arrow_forward_ios,
              color: appColor.Primarycolor,
            )),
      ),
      // Personalinformationmodel(title: "Finger Print", icon: Fingerprintbutton()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: PersonalinformationListmethod(context).length,
      itemBuilder: (context, index) => Personalinformationcard(
        model: PersonalinformationListmethod(context)[index],
      ),
    );
  }
}
