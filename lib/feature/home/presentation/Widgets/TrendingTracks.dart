import 'package:flutter/material.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/TrendingTracksCard.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/TrendingtracksHeader.dart';

class Trendingtracks extends StatelessWidget {
  const Trendingtracks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Trendingtracksheader(),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Trendingtrackscard(
                  padding: 15,
                  height: 202,
                  width: MediaQuery.sizeOf(context).width * 0.43,
                  image: 'assets/HomeImage/trendingTracksImages/Cs.png',
                  title: 'Computer Science',
                  color: Color(0xffFFB4B4).withOpacity(0.5),
                  top: false,
                  subtitle: 'Software Engineering',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Trendingtrackscard(
                    padding: 8,
                    height: 163,
                    width: MediaQuery.sizeOf(context).width * 0.43 - 8,
                    image: 'assets/HomeImage/trendingTracksImages/OR.png',
                    title: ' Operations Research &Design Support',
                    color: Color(0xffFFB1F3).withOpacity(0.5),
                    top: true,
                    subtitle: 'Data Analysis',
                  ),
                )
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Trendingtrackscard(
                  padding: 8,
                  height: 163,
                  width: MediaQuery.sizeOf(context).width * 0.43 - 8,
                  image:
                      'assets/HomeImage/trendingTracksImages/informationTech.png',
                  title: ' Information Technology',
                  color: Color(0xffB4FFE4).withOpacity(0.5),
                  top: true,
                  subtitle: 'Computer Networks',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Trendingtrackscard(
                    padding: 15,
                    height: 202,
                    width: MediaQuery.sizeOf(context).width * 0.43,
                    image:
                        'assets/HomeImage/trendingTracksImages/ArtificialIntelligence.png',
                    title: 'Artificial Intelligence',
                    color: Color(0xffFF6348).withOpacity(0.5),
                    top: false,
                    subtitle: 'Machine Learning',
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
