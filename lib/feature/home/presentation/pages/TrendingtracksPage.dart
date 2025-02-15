import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/TrendingTrackspageTitle.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/TrendingtrackspageDisplayTracks.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/TrendingtrackspagetextField.dart';

class Trendingtrackspage extends StatelessWidget {
  const Trendingtrackspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.Primarycolor,
      body: Center(
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: appColor.Primarycolor,
              ),
              Trendingtrackspagetitle(),
              Trendingtrackspagetextfield(),
              Trendingtrackspagedisplaytracks(),
            ],
          ),
        ),
      ),
    );
  }
}
