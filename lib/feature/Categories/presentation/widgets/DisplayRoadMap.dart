import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/helper.dart';
import 'package:graduation_project/feature/Search/presentation/widgets/searchCard.dart';

class Displayroadmap extends StatelessWidget {
  const Displayroadmap({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding:
          EdgeInsets.symmetric(horizontal: 20, vertical: 0), // تحديد الهوامش
      sliver: SliverGrid.builder(
        itemCount: Helper.searchresult.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) => Searchcard(
          model: Helper.searchresult[index],
        ),
      ),
    );
  }
}
