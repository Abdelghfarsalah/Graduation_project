import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Initiatives/presentation/pages/mainInitiatives.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Initiatives",
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff202244)),
        ),
        SizedBox(
          height: 10,
        ),
        Initiativespage()
        // Categoriesitem(
        //   onTap: () {
        //     Animationsforpages.navigateWithSlidepush(context, Roadmaps());
        //     // Navigator.push(
        //     //   context,
        //     //   MaterialPageRoute(
        //     //     builder: (context) => Roadmaps(),
        //     //   ),
        //     // );
        //   },
        //   image: 'assets/HomeImage/Categoriesitem1.png',
        //   title: 'Roadmaps',
        //   subtitle: 'Step-by-step guides to achieve specific goals.',
        // ),
        // Categoriesitem(
        //   onTap: () {
        //     Animationsforpages.navigateWithSlidepush(context, Environmentone());
        //     // Navigator.push(
        //     //   context,
        //     //   MaterialPageRoute(
        //     //     builder: (context) => Environmentone(),
        //     //   ),
        //     // );
        //   },
        //   image: 'assets/HomeImage/Categoriesitem1 (2).png',
        //   title: 'Environment',
        //   subtitle:
        //       'A setup that provides tools for coding and application development.',
        // ),
        // Categoriesitem(
        //   onTap: () {
        //     Animationsforpages.navigateWithSlidepush(context, Frameworks());
        //     // Navigator.push(
        //     //   context,
        //     //   MaterialPageRoute(
        //     //     builder: (context) => Frameworks(),
        //     //   ),
        //     // );
        //   },
        //   image: 'assets/HomeImage/Categoriesitem3.png',
        //   title: 'Frameworks',
        //   subtitle: 'Structures that simplify development and problem-solving.',
        // ),
      ],
    );
  }
}
