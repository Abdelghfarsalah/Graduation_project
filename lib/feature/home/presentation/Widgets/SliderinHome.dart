import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/pages/RecommendationSystempage.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/Slideritem.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/recommendchatPage.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/pages/stataicTracksPage.dart';
import 'package:url_launcher/url_launcher.dart';

class Sliderinhome extends StatelessWidget {
  const Sliderinhome({super.key});
  final String url = 'https://adplist.org'; // غيّر الرابط هنا

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.24),
      child: SizedBox(
        height: 220.h,
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(
              width: 30,
            ),
            Slideritem(
              onTap: () {
                Animationsforpages.navigateWithSlidepush(
                    context, Recommendationsystempage());
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       ..builder: (context) => Recommendationsystempage()),
                // );
              },
              image: "assets/HomeImage/Sliderimage1.png",
              title: "Recommendation System",
            ),
            SizedBox(
              width: 10,
            ),
            Slideritem(
              onTap: () {
                Animationsforpages.navigateWithSlidepush(
                    context,
                    Recommendchatpage(
                      text: '',
                    ));
              },
              image: "assets/HomeImage/ChatGPTImage.png",
              title: "Roadmap generator",
            ),
            SizedBox(
              width: 10,
            ),
            Slideritem(
              onTap: () {
                Animationsforpages.navigateWithSlidepush(
                    context, Stataictrackspage());
                // Animationsforpages.navigateWithSlidepush(
                //     context, Actualprogramminglanguages());
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => Actualprogramminglanguages()),
                // );
              },
              image: 'assets/HomeImage/CoreLanguages.png',
              title: "Tracks",
            ),
            SizedBox(
              width: 10,
            ),
            Slideritem(
              onTap: () {
                //https://adplist.org/
                // Animationsforpages.navigateWithSlidepush(
                //     context, Populartracks());
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Populartracks()),
                // );
                // Animationsforpages.navigateWithSlidepush(context, Mentorpage());
                _launchURL();
              },
              image: "assets/HomeImage/PopularTracks.png",
              title: "Mentor",
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
