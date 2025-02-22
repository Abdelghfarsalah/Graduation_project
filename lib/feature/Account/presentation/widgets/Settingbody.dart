import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/AccountSection.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/Actions.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/CacheAndcellular.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/SupportandAboutSection.dart';

class Settingbody extends StatelessWidget {
  const Settingbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Accountsection(),
            SizedBox(
              height: 20.h,
            ),
            Supportandaboutsection(),
            SizedBox(
              height: 20.h,
            ),
            Cacheandcellular(),
            SizedBox(
              height: 20.h,
            ),
            ActionsSection()
          ],
        ),
      ),
    );
  }
}
