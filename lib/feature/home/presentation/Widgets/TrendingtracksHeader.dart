import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/pages/SeeAllTreadingTracks.dart';

class Trendingtracksheader extends StatelessWidget {
  const Trendingtracksheader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Trending Tracks",
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff202244)),
        ),
        GestureDetector(
          onTap: () {
            Animationsforpages.navigateWithSlidepush(
                context, AllTrendingTracks());
          },
          child: Row(
            children: [
              Text(
                "View All",
                style: TextStyle(
                    fontFamily: appFonts.Poppins,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff5FA5FF)),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.arrow_forward_ios, size: 15, color: Color(0xff5FA5FF))
            ],
          ),
        )
      ],
    );
  }
}
