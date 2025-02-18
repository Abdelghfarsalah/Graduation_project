import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/Custom_button.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/pages/Recommendationsystempagetow.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/widgets/TechRate.dart';

class Recommendationsystembody extends StatelessWidget {
  const Recommendationsystembody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please rate your interest in the following subjects using one of the options",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: appFonts.Poppins,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000)),
            ),
            SizedBox(
              height: 10,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffC0DAA7),
              text: 'Database Fundamental',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffA7D7DA),
              text: 'Forensics Fundamental',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffDAB9A7),
              text: 'Computer Architecture',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffA8A7DA),
              text: 'Technical Communication',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffD0A7DA),
              text: 'Distributed Computed Systems',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffDAAAA7),
              text: 'AI Machine Learning',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffC0DAA7),
              text: 'Cyber Security',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xff95B2DE),
              text: 'Database Fundamental',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffEBE07C),
              text: 'Computer Networks',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffDAA7C2),
              text: 'Software Engineering',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffB7E4C7),
              text: 'Business Analysis',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffFBC4AB),
              text: 'Software Development',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xff89CFF0),
              text: 'Data Science',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Techrate(
              onTap: () {},
              color: Color(0xffD8BFD8),
              text: 'Programming Skills',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            CustomButton(
              borderRadius: 14,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Recommendationsystempagetow()),
                );
                // context.read<Recommendationsystembloc>().printmap();
              },
              endcolor: Color(0xff9CC7FF),
              color: Color(0xff5FA5FF),
              width: MediaQuery.of(context).size.width,
              text: 'Continue',
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
