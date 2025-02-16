import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/DisplayRoadMap.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/customappbatfromroadmap.dart';

class Roadmaps extends StatelessWidget {
  const Roadmaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          Customappbarroadmap(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          Displayroadmap()
        ],
      ),
    );
  }
}
