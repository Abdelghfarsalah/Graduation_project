import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/Account/presentation/pages/SettingPages/ReportProblemPage.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/SettingCard.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/RegisterPage.dart';
import 'package:graduation_project/feature/home/presentation/manager/BottomNavBar/BottomNavBarBloc.dart';
import 'package:graduation_project/feature/home/presentation/manager/BottomNavBar/BottomNavBarEvent.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/WelcomePage.dart';

class ActionsSection extends StatelessWidget {
  const ActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Actions",
            style: TextStyle(
                color: Colors.black,
                fontFamily: appFonts.Poppins,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.h,
          ),
          Settingcard(
              title: "Report a problem",
              icon: Icon(Icons.flag),
              onTap: () {
                Animationsforpages.navigateWithSlidepush(
                    context, ReportProblemPage());
              }),
          Settingcard(
              title: "Add Account or Log in to Another ",
              icon: Icon(Icons.people),
              onTap: () {
                Animationsforpages.navigateWithSlidepush(
                    context, Registerpage());
              }),
          Settingcard(
              title: "Log out",
              icon: Icon(Icons.logout),
              onTap: () async {
                await SharedPreferencesDemo.clearToken();
                Future.delayed(Duration(seconds: 2), () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                      (predicate) => false);
                });
                context.read<Bottomnavbarbloc>().add(ChangeEvent(index: 0));
              }),
        ],
      ),
    );
  }
}
