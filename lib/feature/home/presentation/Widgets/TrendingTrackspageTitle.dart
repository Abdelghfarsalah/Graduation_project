import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';

class Trendingtrackspagetitle extends StatelessWidget {
  const Trendingtrackspagetitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(),
        child: Center(
          child: Text(
            "Trending Tracks",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Color(0xffFFFFFF),
                fontFamily: appFonts.Poppins),
          ),
        ),
      ),
    );
  }
}
