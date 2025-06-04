import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Initiatives/presentation/widgets/customappBar.dart';

class Egyptdigitalpioneersinitiative extends StatelessWidget {
  const Egyptdigitalpioneersinitiative({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarInitiative(
        title: "Egypt Digital Pioneers Initiative",
        image: 'assets/Initiatives/image1.png',
      ),
    );
  }
}
