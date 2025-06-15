import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/CardinHomePage.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/CustomDrawer.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/HomePageActivities.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/homeAppBar.dart';

class Homebody extends StatefulWidget {
  const Homebody({super.key});

  @override
  State<Homebody> createState() => _HomebodyState();
}

class _HomebodyState extends State<Homebody> {
  final GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      key: key,
      backgroundColor: appColor.Primarycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Homeappbar(
              scaffoldkey: key,
            ),
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
