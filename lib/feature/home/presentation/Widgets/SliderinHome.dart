import 'package:flutter/material.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/pages/RecommendationSystempage.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/Slideritem.dart';
import 'package:graduation_project/feature/home/presentation/pages/PopularTracks.dart';

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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Recommendationsystempage()),
                );
              },
              image: "assets/HomeImage/Sliderimage1.png",
              title: "Recommendation System",
            ),
            SizedBox(
              width: 10,
            ),
            Slideritem(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Populartracks()),
                // );
              },
              image: "assets/HomeImage/CoreLanguages.png",
              title: "Core Languages",
            ),
            SizedBox(
              width: 10,
            ),
            Slideritem(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Populartracks()),
                );
              },
              image: "assets/HomeImage/PopularTracks.png",
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
