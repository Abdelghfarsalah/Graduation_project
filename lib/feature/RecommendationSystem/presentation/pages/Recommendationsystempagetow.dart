import 'package:flutter/material.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/widgets/RecommendationsystemappBar.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/widgets/Recommendationsystempagetowbody.dart';

class Recommendationsystempagetow extends StatelessWidget {
  const Recommendationsystempagetow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: RecommendationsystemappBar(),
      body: Recommendationsystempagetowbody(),
    );
  }
}
