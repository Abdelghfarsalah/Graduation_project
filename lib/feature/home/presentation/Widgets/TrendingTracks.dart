import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/TrendingTracksCard.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/TrendingtracksHeader.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/pages/AiMlPage.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/pages/Cybersecurity.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/pages/DigitalTwinsPage.dart';

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
                  image: 'assets/tredingTracks/AiAndML/image.png',
                  title: 'Artificial Intelligence (AI)',
                  color: Color(0xff0F161E),
                  top: false,
                  subtitle: ' and Machine Learning (ML)',
                  onTap: () {
                    Animationsforpages.navigateWithSlidepush(
                        context, AIHackathonsPage());
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Trendingtrackscard(
                    padding: 8,
                    height: 163,
                    width: MediaQuery.sizeOf(context).width * 0.43 - 8,
                    image: 'assets/tredingTracks/CyberSecurity/image1.png',
                    title: ' Cybersecurity',
                    color: Color(0xff0F161E),
                    top: true,
                    subtitle: '',
                    onTap: () {
                      Animationsforpages.navigateWithSlidepush(
                          context, CyberSecurityPage());
                    },
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
                  image: 'assets/tredingTracks/DigitalTwins/image1.png',
                  title: ' Digital Twins',
                  color: Color(0xff0F161E),
                  top: true,
                  onTap: () {
                    Animationsforpages.navigateWithSlidepush(
                        context, DigitalTwinsPage());
                  },
                  subtitle: '',
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
