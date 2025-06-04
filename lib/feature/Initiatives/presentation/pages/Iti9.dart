import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Initiatives/presentation/widgets/customappBar.dart';

class Iti9 extends StatelessWidget {
  const Iti9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarInitiative(
        title: "Ministry of Communications ITI 9-month scholarship",
        image: 'assets/Initiatives/image4.png',
      ),
    );
  }
}
