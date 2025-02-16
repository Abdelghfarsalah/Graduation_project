import 'package:flutter/material.dart';

class Techcard extends StatelessWidget {
  const Techcard(
      {super.key,
      required this.text,
      required this.color,
      required this.width});
  final String text;
  final Color color;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        height: 51,
        width: width,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
