import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/SearchinPopularTracks.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/displayPopulartracks.dart';

class Populartracks extends StatelessWidget {
  const Populartracks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: appColor.Primarycolor,
              ),
            ),
            title: Text(
              "Popular Tracks",
              style: TextStyle(
                  color: appColor.Primarycolor,
                  fontFamily: appFonts.Poppins,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          Searchinpopulartracks(),
          Displaypopulartracks()
        ],
      ),
    );
  }
}
