import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';

class Customappbarsearch extends StatelessWidget {
  const Customappbarsearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      // centerTitle: true,
      title: Text(
        "Search",
        style: TextStyle(
            color: appColor.Primarycolor,
            fontFamily: appFonts.Poppins,
            fontWeight: FontWeight.w400,
            fontSize: 20),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Center(
            child: Image.asset(
              "assets/Icons/ri_search-line.png",
              fit: BoxFit.none,
            ),
          ),
        )
      ],
    );
  }
}
