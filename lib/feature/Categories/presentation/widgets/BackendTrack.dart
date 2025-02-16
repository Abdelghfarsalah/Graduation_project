import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/techcard.dart';

class Backendtrack extends StatelessWidget {
  const Backendtrack({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Backend",
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ),
        Techcard(
          text: "Node.js (Express.js)",
          width: 210,
          color: Color(0xffA8A7DA),
        ),
        Techcard(
          text: "Django",
          width: 120,
          color: Color(0xffD0A7DA),
        ),
        Techcard(
          text: "Flask",
          width: 90,
          color: Color(0xffA7DAAC),
        ),
        Techcard(
          text: "Ruby on Rails",
          width: 170,
          color: Color(0xffD0A7DA),
        ),
        Techcard(
          text: "Spring Boot",
          width: 150,
          color: Color(0xffEBE07C),
        ),
      ],
    );
  }
}
