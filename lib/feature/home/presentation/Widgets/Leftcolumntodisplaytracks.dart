import 'package:flutter/material.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/TrendingTracksCard.dart';

class Leftcolumntodisplaytracks extends StatelessWidget {
  const Leftcolumntodisplaytracks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Trendingtrackscard(
            padding: 8,
            height: 163,
            width: MediaQuery.sizeOf(context).width * 0.43 - 8,
            image: 'assets/HomeImage/trendingTracksImages/Saly-25.png',
            title: 'Information System',
            color: Color(0xffFFEEB4).withOpacity(0.5),
            top: false,
            subtitle: 'System Analysis and Design',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Trendingtrackscard(
            padding: 8,
            height: 163,
            width: MediaQuery.sizeOf(context).width * 0.43 - 8,
            image:
                'assets/HomeImage/trendingTracksImages/People Building Metaverse.png',
            title: 'Artificial Intelligence',
            color: Color(0xffD7FCF1),
            top: false,
            subtitle: 'Natural Language Process',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Trendingtrackscard(
            padding: 15,
            height: 202,
            width: MediaQuery.sizeOf(context).width * 0.43,
            image: 'assets/HomeImage/trendingTracksImages/Web Template.png',
            title: 'Computer Science',
            color: Color(0xffFFB4B4).withOpacity(0.5),
            top: false,
            subtitle: 'Operating System',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Trendingtrackscard(
            padding: 8,
            height: 163,
            width: MediaQuery.sizeOf(context).width * 0.43 - 8,
            image: 'assets/HomeImage/trendingTracksImages/Dashboard Growth.png',
            title: ' Operations Research &Design Support',
            color: Color(0xffFFB1F3).withOpacity(0.5),
            top: true,
            subtitle: 'Strategic Design Support',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Trendingtrackscard(
            padding: 8,
            height: 163,
            width: MediaQuery.sizeOf(context).width * 0.43 - 8,
            image: 'assets/HomeImage/trendingTracksImages/Contract.png',
            title: 'Information System',
            color: Color(0xffFFEEB4).withOpacity(0.5),
            top: false,
            subtitle: 'Enterprise Resource Planning(ERP)',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Trendingtrackscard(
            padding: 8,
            height: 163,
            width: MediaQuery.sizeOf(context).width * 0.43 - 8,
            image: 'assets/HomeImage/trendingTracksImages/Idea.png',
            title: 'Artificial Intelligence',
            color: Color(0xffD7FCF1),
            top: false,
            subtitle: 'Intelligent Systems',
          ),
        ),
      ],
    );
  }
}
