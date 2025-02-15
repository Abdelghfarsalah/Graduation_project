import 'package:flutter/material.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/TrendingTracksCard.dart';

class Rightcolumntodisplaytracks extends StatelessWidget {
  const Rightcolumntodisplaytracks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Trendingtrackscard(
          padding: 8,
          height: 163,
          width: MediaQuery.sizeOf(context).width * 0.43 - 8,
          image: 'assets/HomeImage/trendingTracksImages/informationTech.png',
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
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Trendingtrackscard(
            padding: 8,
            height: 163,
            width: MediaQuery.sizeOf(context).width * 0.43 - 8,
            image: 'assets/HomeImage/trendingTracksImages/Saly-13.png',
            title: ' Information Technology',
            color: Color(0xffCCB4FF).withOpacity(0.5),
            top: true,
            subtitle: 'Cyber Security',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Trendingtrackscard(
            padding: 15,
            height: 202,
            width: MediaQuery.sizeOf(context).width * 0.43,
            image: 'assets/HomeImage/trendingTracksImages/Target.png',
            title: 'Computer Science',
            color: Color(0xffFFB4B4).withOpacity(0.5),
            top: false,
            subtitle: 'Algorithms and Data Structures',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Trendingtrackscard(
            padding: 8,
            height: 163,
            width: MediaQuery.sizeOf(context).width * 0.43 - 8,
            image: 'assets/HomeImage/trendingTracksImages/Business startup.png',
            title: ' Information Technology',
            color: Color(0xffB4FFE4).withOpacity(0.5),
            top: true,
            subtitle: 'Database Management System',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Trendingtrackscard(
            padding: 15,
            height: 202,
            width: MediaQuery.sizeOf(context).width * 0.43,
            image:
                'assets/HomeImage/trendingTracksImages/Socialmediamarketing.png',
            title: 'Artificial Intelligence',
            color: Color(0xffFF6348).withOpacity(0.5),
            top: false,
            subtitle: 'Computer Vision',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Trendingtrackscard(
            padding: 8,
            height: 163,
            width: MediaQuery.sizeOf(context).width * 0.43 - 8,
            image: 'assets/HomeImage/trendingTracksImages/Image.png',
            title: ' Information Technology',
            color: Color(0xffCCB4FF).withOpacity(0.5),
            top: true,
            subtitle: 'Cloud Computing',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Trendingtrackscard(
            padding: 15,
            height: 202,
            width: MediaQuery.sizeOf(context).width * 0.43,
            image: 'assets/HomeImage/trendingTracksImages/Api Programming.png',
            title: 'Computer Science',
            color: Color(0xffFFB4B4).withOpacity(0.5),
            top: false,
            subtitle: 'Database System',
          ),
        ),
      ],
    );
  }
}
