import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/recommendChat/domain/RoadmapModel%20.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown(
      {super.key,
      required this.mdoel,
      required this.indedx,
      required this.selectedItem});
  final Roadmapmodel mdoel;
  final int indedx;
  final String selectedItem;
  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool _isExpanded = false;
  // String _selectedItem = 'اختر عنصراً';
  // final List<String> _items = [
  //   'العنصر الأول',
  //   'العنصر الثاني',
  //   'العنصر الثالث'
  // ];

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
    return Column(
      children: [
        // الزر المخصص
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 60.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              // borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: Text(
                    widget.selectedItem,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                  ),
                ),
                AnimatedRotation(
                  turns: _isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(Icons.keyboard_arrow_down, size: 28),
                )
              ],
            ),
          ),
        ),

        // القائمة المنسدلة

        AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: ClipRect(
            child: _isExpanded
                ? TimelineTile(
                    hasIndicator: true,
                    indicatorStyle: IndicatorStyle(
                      indicator: Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text("${widget.indedx + 1}"),
                        ),
                      ),
                      color: Colors.black,
                    ),
                    alignment: TimelineAlign.manual,
                    lineXY: 0.3,
                    endChild: Column(
                      children: [
                        Text(widget.mdoel.steps![widget.indedx].description ??
                            ""),
                        SizedBox(height: 8),
                        if (widget.mdoel.steps![widget.indedx].categories !=
                                null &&
                            widget.mdoel.steps![widget.indedx].categories!
                                .isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget
                                .mdoel.steps![widget.indedx].categories!
                                .map((category) {
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
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                    ...?category.items
                                        ?.asMap()
                                        .entries
                                        .map((item) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12, top: 2),
                                            child: Text(
                                              "${item.key + 1} - ${item.value.title ?? ""}",
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                fontFamily: appFonts.Poppins,
                                                fontWeight: FontWeight.w900,
                                              ),
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
                                              child: Text(
                                                "Click Here",
                                                style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                      ],
                    ),
                    startChild: Text(
                      "${widget.mdoel.steps![widget.indedx].stepTitle ?? ""}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: appFonts.Poppins,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  )
                : SizedBox.shrink(), // لما تكون مش Expanded
          ),
        ),
      ],
    );
  }
}
