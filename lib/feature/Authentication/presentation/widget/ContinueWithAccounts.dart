import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/widget/Continue_With_Account_widget.dart';

class Continuewithaccounts extends StatelessWidget {
  const Continuewithaccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ContinueWithAccountWidget(
            onTap: () {},
            icon: SvgPicture.asset("assets/onboarding/devicon_google.svg")),
        SizedBox(
          width: 20.w,
        ),
        ContinueWithAccountWidget(
            onTap: () {},
            icon: SvgPicture.asset("assets/onboarding/logos_facebook.svg")),
        SizedBox(
          width: 20.w,
        ),
        ContinueWithAccountWidget(
            onTap: () {},
            icon: SvgPicture.asset("assets/onboarding/pajamas_twitter.svg")),
        SizedBox(
          width: 20.w,
        ),
        ContinueWithAccountWidget(
            onTap: () {},
            icon:
                SvgPicture.asset("assets/onboarding/logos_linkedin-icon.svg")),
      ],
    );
  }
}
