import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/techcard.dart';

class Databasetech extends StatelessWidget {
  const Databasetech({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "DataBase",
            style: TextStyle(
                color: appColor.Primarycolor,
                fontFamily: appFonts.Poppins,
                fontWeight: FontWeight.w700,
                fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Techcard(
          text: "Hibernate (Java ORM)",
          width: MediaQuery.of(context).size.width * 0.7,
          color: Color(0xffB7E4C7),
        ),
        Techcard(
          text: "SQLAlchemy (Python) ",
          width: MediaQuery.of(context).size.width * 0.6,
          color: Color(0xffFBC4AB),
        ),
        Techcard(
          text: "Entity Framework (.NET)",
          width: MediaQuery.of(context).size.width * 0.69,
          color: Color(0xff89CFF0),
        ),
      ],
    );
  }
}
