import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/recommendChat/domain/RoadmapModel%20.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/widgets/displaytimeLine.dart';

class Agentmessage extends StatelessWidget {
  const Agentmessage({super.key, required this.text});
  final Roadmapmodel text;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.75, // أقصى عرض
          ),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
            color: Color.fromARGB(255, 244, 244, 244),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
                child: Text(
                  text.title!,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 73, 73, 73),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Animationsforpages.navigateWithSlidepush(
                      context,
                      Displaytimeline(
                        mdoel: text,
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[100],
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 3,
                ),
                child: Text(
                  'Click here to show timeline',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.3),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
