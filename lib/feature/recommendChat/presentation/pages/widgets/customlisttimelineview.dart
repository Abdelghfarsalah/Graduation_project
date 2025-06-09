import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/recommendChat/domain/models/RoadmapModel%20.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/widgets/GetIconType.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class Customlisttimelineview extends StatefulWidget {
  const Customlisttimelineview({super.key, required this.mdoel});
  final Roadmapmodel2 mdoel;

  @override
  State<Customlisttimelineview> createState() => _CustomlisttimelineviewState();
}

class _CustomlisttimelineviewState extends State<Customlisttimelineview> {
  List<Color> blueWhiteGradientColors = [
    // White
    Color(0xFFF0F8FF), // Alice Blue (very light blue)
    Color(0xFFE0F7FA), // Light Cyan
    Color(0xFFB3E5FC), // Light Blue 100
    Color(0xFF81D4FA), // Light Blue 200
    Color(0xFFF0F8FF), // Alice Blue (very light blue)
    Color(0xFFE0F7FA), // Light Cyan
    Color(0xFFB3E5FC), // Light Blue 100
    Color(0xFF81D4FA), // Light Blue 200
    Color(0xFFF0F8FF), // Alice Blue (very light blue)
    Color(0xFFE0F7FA), // Light Cyan
    Color(0xFFB3E5FC), // Light Blue 100
    Color(0xFF81D4FA), // Light Blue 200
    // Color(0xFF4FC3F7), // Light Blue 300
    // Color(0xFF29B6F6), // Light Blue 400
    // Color(0xFF03A9F4), // Blue 500 (Base Blue)
    // Color(0xFF0288D1), // Blue 700 (Dark)
    // Color(0xFF01579B), // Blue 900 (Very dark)
  ];

  Future<void> _launchURL(String link) async {
    final uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.mdoel.steps!.length,
      itemBuilder: (context, index) => Container(
        color: blueWhiteGradientColors[index],
        child: TimelineTile(
          hasIndicator: true,
          indicatorStyle: IndicatorStyle(
              indicator: Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Center(
                  child: Text("${index + 1}"),
                ),
              ),
              color: Colors.black),
          alignment: TimelineAlign.manual,
          lineXY: 0.3,
          endChild: Column(
            children: [
              Text(widget.mdoel.steps![index].description ?? ""),
              SizedBox(height: 8),
              if (widget.mdoel.steps![index].categories != null &&
                  widget.mdoel.steps![index].categories!.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      widget.mdoel.steps![index].categories!.map((category) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category.categoryTitle ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.blueAccent),
                          ),
                          ...?category.items?.asMap().entries.map((item) =>
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 12, top: 2),
                                    child: Text(
                                      "${item.key + 1} - ${item.value.title ?? ""}",
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: appFonts.Poppins,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _launchURL(item.value.link ??
                                          "https://www.figma.com/design/LIyLwTzP0FkIdzlVO72Cuo/GP_Smart-Path?node-id=0-1&p=f&t=m7qkcy9d9aSb0d3l-0");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, top: 2, bottom: 15),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Click ",
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 13,
                                            ),
                                          ),
                                          getIconForType(
                                              item.value.typeOfLink!),
                                          Text(
                                            "  |   ${item.value.duration} ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    );
                  }).toList(),
                )
            ],
          ),
          startChild: Text(
            "${widget.mdoel.steps![index].stepTitle ?? ""}",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 13.sp,
                fontFamily: appFonts.Poppins,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
