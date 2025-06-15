import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/TrendingTracksCard.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/pages/Blockchain.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/pages/CloudComputing.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/pages/DigitalTwinsPage.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/pages/Robotics.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/pages/iot.dart';

class Righttredingtarcks extends StatelessWidget {
  const Righttredingtarcks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Trendingtrackscard(
        padding: 8,
        height: 163,
        width: MediaQuery.sizeOf(context).width * 0.43 - 8,
        image: 'assets/tredingTracks/DigitalTwins/image1.png',
        title: ' Digital Twins',
        color: Color(0xff0F161E),
        top: true,
        onTap: () {
          Animationsforpages.navigateWithSlidepush(context, DigitalTwinsPage());
        },
        subtitle: '',
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Trendingtrackscard(
          padding: 15,
          height: 202,
          onTap: () {
            Animationsforpages.navigateWithSlidepush(context, RPAPage());
          },
          width: MediaQuery.sizeOf(context).width * 0.43,
          image: "assets/tredingTracks/Robotics/image1.png",
          title: 'Robotics Process',
          color: Color(0xff0F161E),
          top: false,
          subtitle: 'Automation',
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Trendingtrackscard(
          padding: 8,
          height: 163,
          width: MediaQuery.sizeOf(context).width * 0.43 - 8,
          image: "assets/tredingTracks/Blockchain/image1.png",
          title: ' Blockchain',
          color: Color(0xff0F161E),
          top: true,
          onTap: () {
            Animationsforpages.navigateWithSlidepush(context, BlockchainPage());
          },
          subtitle: '',
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Trendingtrackscard(
          padding: 15,
          height: 202,
          onTap: () {
            Animationsforpages.navigateWithSlidepush(
                context, CloudComputingPage());
          },
          width: MediaQuery.sizeOf(context).width * 0.43,
          image: "assets/tredingTracks/CloudComputing/image1.png",
          title: 'Cloud Computing',
          color: Color(0xff0F161E),
          top: false,
          subtitle: '',
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Trendingtrackscard(
          padding: 8,
          height: 163,
          width: MediaQuery.sizeOf(context).width * 0.43 - 8,
          image: "assets/tredingTracks/iot/image1.png",
          title: ' Internet of Things ',
          color: Color(0xff0F161E),
          top: true,
          onTap: () {
            Animationsforpages.navigateWithSlidepush(
                context, IoTDevelopmentPage());
          },
          subtitle: '(IoT) ',
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 20),
        child: Container(
          height: 202,
          width: MediaQuery.sizeOf(context).width * 0.43 - 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Color(0xffF8F7FF),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: const Color.fromARGB(
                    255, 26, 20, 43), // نفس لون الكارت الداخلي
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Keep exploring...\nMore tracks coming soon!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: appFonts.Poppins, // استخدم نفس الفونت بتاعك
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
