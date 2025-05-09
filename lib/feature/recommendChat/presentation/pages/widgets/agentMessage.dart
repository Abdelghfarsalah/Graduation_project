import 'package:flutter/widgets.dart';

class Agentmessage extends StatelessWidget {
  const Agentmessage({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.75, // أقصى عرض
          ),
          decoration: BoxDecoration(
            color: Color(0xff5EA5FF),
            borderRadius: BorderRadius.all(Radius.circular(12)),
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
      ),
    );
  }
}
