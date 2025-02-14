import 'package:flutter/material.dart';

class Cardinhomepage extends StatelessWidget {
  const Cardinhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 245,
      width: double.infinity,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/HomeImage/HomeImage.png")),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 20,
              spreadRadius: 0,
              color: Color.fromARGB(184, 235, 236, 234))
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(33),
        ),
      ),
    );
  }
}
