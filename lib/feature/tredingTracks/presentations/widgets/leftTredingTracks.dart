import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/TrendingTracksCard.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/pages/AiMlPage.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/pages/Cybersecurity.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/pages/DevOps.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/pages/EdgeComputing.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/pages/VirtualReality.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/pages/bio.dart';

class Lefttredingtracks extends StatelessWidget {
  const Lefttredingtracks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Trendingtrackscard(
            padding: 15,
            height: 202,
            width: MediaQuery.sizeOf(context).width * 0.43,
            image: 'assets/tredingTracks/VirtualReality/image1.png',
            title: 'Virtual Reality ',
            color: Color(0xff0F161E),
            top: false,
            subtitle: '',
            onTap: () {
              Animationsforpages.navigateWithSlidepush(
                  context, VirtualRealityPage());
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Trendingtrackscard(
            padding: 8,
            height: 163,
            width: MediaQuery.sizeOf(context).width * 0.43 - 8,
            image: 'assets/tredingTracks/DevOps/image1.png',
            title: ' DevOps',
            color: Color(0xff0F161E),
            top: true,
            subtitle: '',
            onTap: () {
              Animationsforpages.navigateWithSlidepush(context, DevOpsPage());
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Trendingtrackscard(
            padding: 15,
            height: 202,
            width: MediaQuery.sizeOf(context).width * 0.43,
            image: 'assets/tredingTracks/EdgeComputing/image1.png',
            title: 'Edge Computing  ',
            color: Color(0xff0F161E),
            top: false,
            subtitle: '',
            onTap: () {
              Animationsforpages.navigateWithSlidepush(
                  context, EdgeComputingPage());
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Trendingtrackscard(
            padding: 8,
            height: 163,
            width: MediaQuery.sizeOf(context).width * 0.43 - 8,
            image: 'assets/tredingTracks/Bioinformatics/image1.png',
            title: ' Bioinformatics',
            color: Color(0xff0F161E),
            top: true,
            subtitle: '',
            onTap: () {
              Animationsforpages.navigateWithSlidepush(
                  context, BioinformaticsPage());
            },
          ),
        ),
      ],
    );
  }
}
