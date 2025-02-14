import 'package:flutter/material.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/Slideritem.dart';

class Sliderinhome extends StatelessWidget {
  const Sliderinhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.24),
      child: SizedBox(
        height: 200,
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(
              width: 30,
            ),
            Slideritem(
              image: "assets/HomeImage/Sliderimage1.png",
              title: "Recommendation System",
            ),
            SizedBox(
              width: 10,
            ),
            Slideritem(
              image: "assets/HomeImage/Sliderimage1.png",
              title: "Core Languages",
            ),
            SizedBox(
              width: 10,
            ),
            Slideritem(
              image: "assets/HomeImage/Sliderimage1.png",
              title: "Popular Tracks",
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
