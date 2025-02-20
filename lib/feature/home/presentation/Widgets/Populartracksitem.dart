import 'package:flutter/material.dart';
import 'package:graduation_project/feature/home/domain/Entities/PopularTracksmode.dart';

class Populartracksitem extends StatelessWidget {
  const Populartracksitem({super.key, required this.model});
  final Populartracksmodel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(model.Image),
        SizedBox(
          height: 10,
        ),
        Text(model.title),
      ],
    );
  }
}
