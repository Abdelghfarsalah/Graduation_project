import 'package:flutter/material.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/Leftcolumntodisplaytracks.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/rightcolumntodisplaytracks.dart';

class Trendingtrackspagedisplaytracks extends StatelessWidget {
  const Trendingtrackspagedisplaytracks({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Leftcolumntodisplaytracks(),
                Spacer(),
                Rightcolumntodisplaytracks(),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
