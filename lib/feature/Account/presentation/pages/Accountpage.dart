import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/Accountcard.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/BackgroundimageinAccount.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/DisplayPersonalinformation.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/PersonalInformationOther.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/SettingIcon.dart';

class Accountpage extends StatelessWidget {
  const Accountpage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Backgroundimageinaccount(),
                Settingicon(),
                Accountcard(),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          sliver: SliverToBoxAdapter(
            child: Text(
              "Personal Information",
              style: TextStyle(
                  fontFamily: appFonts.Poppins,
                  fontSize: 17,
                  color: appColor.Primarycolor,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 15,
          ),
        ),
        Displaypersonalinformation(),
        Personalinformationother(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).padding.bottom + 15,
          ),
        )
      ],
    );
  }
}
