import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/Initiatives/presentation/pages/DigitalPioneersnitiative.dart';
import 'package:graduation_project/feature/Initiatives/presentation/pages/DigitalYouthofEgypt.dart';
import 'package:graduation_project/feature/Initiatives/presentation/pages/EgyptDigitalPioneersInitiative.dart';
import 'package:graduation_project/feature/Initiatives/presentation/pages/Iti3.dart';
import 'package:graduation_project/feature/Initiatives/presentation/pages/Iti9.dart';
import 'package:graduation_project/feature/Initiatives/presentation/widgets/InitiativesItem.dart';

class Initiativespage extends StatelessWidget {
  const Initiativespage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InitiativesItem(
          onTap: () {
            Animationsforpages.navigateWithSlidepush(
                context, Egyptdigitalpioneersinitiative());
          },
          image: 'assets/Initiatives/image1.png',
          title: 'Egypt Digital Pioneers Initiative',
          subtitle:
              'A national initiative to equip youth with digital skills for the job market.',
        ),
        InitiativesItem(
          onTap: () {
            Animationsforpages.navigateWithSlidepush(
                context, Digitalpioneersnitiative());
          },
          image: 'assets/Initiatives/image2.png',
          title: 'Digital Pioneers Initiative',
          subtitle:
              'A comprehensive training program to develop future digital leaders in Egypt.',
        ),
        InitiativesItem(
          onTap: () {
            Animationsforpages.navigateWithSlidepush(
                context, Digitalyouthofegypt());
          },
          image: 'assets/Initiatives/image3.png',
          title: 'Digital Youth of Egypt',
          subtitle:
              'A government program to empower youth with hands-on training in IT and tech fields.',
        ),
        InitiativesItem(
          onTap: () {
            Animationsforpages.navigateWithSlidepush(context, Iti9());
          },
          image: 'assets/Initiatives/image4.png',
          title: 'Ministry of Communications ITI 9-month scholarship',
          subtitle:
              'An advanced 9-month training program by ITI for graduates in specialized tech fields.',
        ),
        InitiativesItem(
          onTap: () {
            Animationsforpages.navigateWithSlidepush(context, Iti3());
          },
          image: 'assets/Initiatives/image5.png',
          title: 'Ministry of Communications ITI 3-month scholarship',
          subtitle:
              'A 3-month intensive bootcamp by ITI to quickly prepare youth for digital careers.',
        ),
      ],
    );
  }
}
