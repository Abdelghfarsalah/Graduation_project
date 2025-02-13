import 'package:flutter/material.dart';

class ContinueWithAccountWidget extends StatelessWidget {
  const ContinueWithAccountWidget(
      {super.key, required this.onTap, required this.icon});
  final void Function() onTap;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(255, 207, 227, 244),
              offset: Offset(0, 1),
              blurRadius: 2,
              spreadRadius: 0.1)
        ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Center(child: icon),
      ),
    );
  }
}
