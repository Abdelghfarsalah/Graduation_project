import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Initiatives/presentation/widgets/customappBar.dart';

class Iti3 extends StatelessWidget {
  const Iti3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarInitiative(
        title: "Ministry of Communications ITI 3-month scholarship",
        image: 'assets/Initiatives/image5.png',
      ),
    );
  }
}
