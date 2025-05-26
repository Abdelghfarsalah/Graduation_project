import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/feature/recommendChat/domain/RoadmapModel%20.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/widgets/SectionTimeline.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/widgets/customlisttimelineview.dart';
import 'package:url_launcher/url_launcher.dart';

class Displaytimeline extends StatefulWidget {
  const Displaytimeline({super.key, required this.mdoel});
  final Roadmapmodel mdoel;

  @override
  State<Displaytimeline> createState() => _DisplaytimelineState();
}

class _DisplaytimelineState extends State<Displaytimeline> {
  List<Color> blueWhiteGradientColors = [
    // White
    Color(0xFFF0F8FF), // Alice Blue (very light blue)
    Color(0xFFE0F7FA), // Light Cyan
    Color(0xFFB3E5FC), // Light Blue 100
    Color(0xFF81D4FA), // Light Blue 200
    Color(0xFF4FC3F7), // Light Blue 300
    Color(0xFF29B6F6), // Light Blue 400
    Color(0xFF03A9F4), // Blue 500 (Base Blue)
    Color(0xFF0288D1), // Blue 700 (Dark)
    Color(0xFF01579B), // Blue 900 (Very dark)
  ];
  Future<void> _launchURL(String link) async {
    final uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $link';
    }
  }

  bool timline = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          scrolledUnderElevation: 0,
          title: Container(
            height: 40.h,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        timline = true;
                      });
                    },
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                          color: timline ? Colors.grey[700] : Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          )),
                      duration: Duration(seconds: 1),
                      child: Center(
                        child: Text(
                          "timeline",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: timline ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        timline = false;
                      });
                    },
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                          color: !timline ? Colors.grey[700] : Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          )),
                      duration: Duration(seconds: 1),
                      child: Center(
                        child: Text(
                          "Section",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: !timline ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: timline
            ? Customlisttimelineview(
                mdoel: widget.mdoel,
              )
            : Sectiontimeline(
                mdoel: widget.mdoel,
              ));
  }
}
