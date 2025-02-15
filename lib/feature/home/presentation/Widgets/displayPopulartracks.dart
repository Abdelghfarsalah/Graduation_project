import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/helper.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/Populartracksitem.dart';

class Displaypopulartracks extends StatelessWidget {
  const Displaypopulartracks({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: Helper.Populartracks.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => Populartracksitem(
              model: Helper.Populartracks[index],
            ));
  }
}
