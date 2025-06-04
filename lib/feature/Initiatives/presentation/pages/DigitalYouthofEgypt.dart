import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Initiatives/presentation/widgets/customappBar.dart';

class Digitalyouthofegypt extends StatelessWidget {
  const Digitalyouthofegypt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarInitiative(
        title: "Digital Youth of Egypt",
        image: 'assets/Initiatives/image3.png',
      ),
    );
  }
}
