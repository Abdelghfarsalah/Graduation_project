import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';

class Titels extends StatelessWidget {
  const Titels(
      {super.key,
      required this.title,
      required this.text,
      required this.subtitle});
  final String title;
  final String text;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              fontFamily: appFonts.Poppins),
        ),
        Text(
          subtitle,
          style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              fontFamily: appFonts.Poppins),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 161, 161, 161),
              fontFamily: appFonts.Poppins),
        ),
      ],
    );
  }
}
