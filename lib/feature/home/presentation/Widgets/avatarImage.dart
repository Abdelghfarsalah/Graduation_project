import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';

class Avatarimage extends StatelessWidget {
  const Avatarimage({super.key});

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
          return CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: CircleAvatar(
                radius: 23,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    snapshot.data!)), // من المسار اللي محفوظ في Shared
          );
        }
      },
    );
  }
}
