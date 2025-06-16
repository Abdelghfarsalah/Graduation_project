import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/CardinHomePage.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/HomePageActivities.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/homeAppBar.dart';

class Homebody extends StatelessWidget {
  const Homebody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.Primarycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Homeappbar(),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Homepageactivities(),
                Positioned(
                    top: -70, left: 30, right: 30, child: Cardinhomepage())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
