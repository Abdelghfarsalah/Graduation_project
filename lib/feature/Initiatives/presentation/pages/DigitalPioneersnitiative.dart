import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Initiatives/presentation/widgets/customappBar.dart';

class Digitalpioneersnitiative extends StatelessWidget {
  const Digitalpioneersnitiative({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarInitiative(
        title: "Digital Pioneers Initiative",
        image: 'assets/Initiatives/image2.png',
      ),
    );
  }
}
