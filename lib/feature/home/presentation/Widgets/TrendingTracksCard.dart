import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';

class Trendingtrackscard extends StatelessWidget {
  const Trendingtrackscard(
      {super.key,
      required this.image,
      required this.title,
      required this.color,
      required this.top,
      required this.subtitle,
      required this.height,
      required this.width,
      required this.padding});
  final String image;
  final String title;
  final String subtitle;
  final Color color;
  final bool top;
  final double height;
  final double width;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: Color(0xffF8F7FF)),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24), color: color),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (top) Image.asset(image),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff0C0A1C),
                          fontFamily: appFonts.Poppins),
                    ),
                  ),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                        fontFamily: appFonts.Poppins),
                  ),
                ],
              ),
              if (!top) Image.asset(image),
            ],
          ),
        ),
      ),
    );
  }
}
