import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';

class Searchresult extends StatelessWidget {
  const Searchresult({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
        child: Row(
          children: [
            Text(
              "Search Result",
              style: TextStyle(
                  color: appColor.Primarycolor,
                  fontSize: 18,
                  fontFamily: appFonts.Poppins),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              FontAwesomeIcons.search,
              size: 14,
              color: appColor.Primarycolor,
            ),
          ],
        ),
      ),
    );
  }
}
