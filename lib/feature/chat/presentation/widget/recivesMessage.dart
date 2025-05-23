import 'package:flutter/material.dart';

class messagefrombot extends StatelessWidget {
  const messagefrombot({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.75, // أقصى عرض
        ),
        decoration: const BoxDecoration(
          color: Color(0xffEEEEEE),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 73, 73, 73),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
