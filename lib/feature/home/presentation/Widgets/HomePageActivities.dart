import 'package:flutter/material.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/Categories.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/SliderinHome.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/TrendingTracks.dart';

class Homepageactivities extends StatelessWidget {
  const Homepageactivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Sliderinhome(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20),
            child: Categories(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
            child: Trendingtracks(),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom + 20,
          )
        ],
      ),
    );
  }
}
