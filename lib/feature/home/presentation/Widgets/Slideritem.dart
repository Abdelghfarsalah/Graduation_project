import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';

class Slideritem extends StatelessWidget {
  const Slideritem({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 154,
          width: 249,
          decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage(image))),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff202244)),
        )
      ],
    );
  }
}
