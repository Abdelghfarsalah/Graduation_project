import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';

class Customappbarroadmap extends StatelessWidget {
  const Customappbarroadmap({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: appColor.Primarycolor,
          )),
      centerTitle: true,
      title: Text(
        "Roadmaps",
        style: TextStyle(
            color: appColor.Primarycolor,
            fontFamily: appFonts.Poppins,
            fontWeight: FontWeight.w400,
            fontSize: 20),
      ),
    );
  }
}
