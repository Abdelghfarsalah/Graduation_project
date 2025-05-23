import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/DisplayAccountImage.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/editAvatarimage.dart';

class Avatarimageinaccount extends StatelessWidget {
  const Avatarimageinaccount({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: SharedPreferencesDemo.getavatar(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        } else if (snapshot.hasError ||
            !snapshot.hasData ||
            snapshot.data == null) {
          return CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 23,
              backgroundImage:
                  AssetImage("assets/HomeImage/default.png"), // صورة افتراضية
            ),
          );
        } else {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                onLongPress: () {
                  CustomDialogForAccountAvatar.showCustomImageDialog(
                      context, snapshot.data!);
                },
                onTap: () {
                  CustomDialogForAccountAvatar.showCustomImageDialog(
                      context, snapshot.data!);
                },
                child: CircleAvatar(
                  radius: 64.r,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                      radius: 64.r,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          snapshot.data!)), // من المسار اللي محفوظ في Shared
                ),
              ),
              Editavatarimage()
            ],
          );
        }
      },
    );
  }
}
