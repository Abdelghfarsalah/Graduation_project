import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';

class Courseappbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color foregroundColor;
  final double elevation;

  const Courseappbar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      scrolledUnderElevation: 0,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontFamily: appFonts.Poppins,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
