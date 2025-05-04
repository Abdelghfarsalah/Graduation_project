import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/accountHelper.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/SettingCard.dart';

class Cacheandcellular extends StatelessWidget {
  const Cacheandcellular({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Cache & cellular",
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
            title: "Delete Account",
            icon: Icon(FontAwesomeIcons.trash),
            onTap: () {
              Accounthelper.showdialogfordelete(context);
            }),
        Settingcard(
            title: "Data Saver",
            icon: Icon(Icons.outbond_outlined),
            onTap: () {}),
      ],
    );
  }
}
