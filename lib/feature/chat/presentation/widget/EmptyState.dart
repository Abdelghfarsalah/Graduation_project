import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';

class Emptystatepage extends StatelessWidget {
  const Emptystatepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                ),
                Text("SmartTalk",
                    style: TextStyle(
                        color: Color(0xff757575),
                        fontFamily: appFonts.Urbanist,
                        fontSize: 40,
                        fontWeight: FontWeight.w500)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: 85,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color(0xffF7F7F8),
                        borderRadius: BorderRadius.circular(17)),
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        child: Text(
                            "Remembers what user said earlier in the conversation",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff757575),
                                fontFamily: appFonts.Urbanist,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: 85,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color(0xffF7F7F8),
                        borderRadius: BorderRadius.circular(17)),
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        child: Text(
                            "Allows user to provide.follow-up corrections With Ai",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff757575),
                                fontFamily: appFonts.Urbanist,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: 85,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color(0xffF7F7F8),
                        borderRadius: BorderRadius.circular(17)),
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        child: Text(
                            "Limited knowledge of world and events after 2021",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff757575),
                                fontFamily: appFonts.Urbanist,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
