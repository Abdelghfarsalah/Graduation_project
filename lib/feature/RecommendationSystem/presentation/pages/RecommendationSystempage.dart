import 'package:flutter/material.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/widgets/RecommendationsystemappBar.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/widgets/Recommendationsystembody.dart';

class Recommendationsystempage extends StatelessWidget {
  const Recommendationsystempage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: RecommendationsystemappBar(),
      body: Recommendationsystembody(),
    );
  }
}
