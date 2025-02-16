import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/techcard.dart';

class Databaseenvironments extends StatelessWidget {
  const Databaseenvironments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              "Database Environments",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: appColor.Primarycolor,
                  fontFamily: appFonts.Poppins,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "NoSQL Databases",
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ),
        Techcard(
          text: "MongoDB Compass",
          width: 220,
          color: Color(0xffFBC4AB),
        ),
        Techcard(
          text: " Firebase Console",
          width: 200,
          color: Color(0xffEBE07C),
        ),
        Text(
          "SQL Databases",
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ),
        Techcard(
          text: "MySQL Workbench",
          width: MediaQuery.of(context).size.width * 0.2,
          color: Color(0xffDAAAA7),
        ),
        Techcard(
          text: " MySQL Workbench",
          width: 120,
          color: Color(0xffA7DAAC),
        ),
        Techcard(
          text: "Microsoft SQL Server Management Studio (SSMS)",
          width: 220,
          color: Color(0xffFBC4AB),
        ),
      ],
    );
  }
}
