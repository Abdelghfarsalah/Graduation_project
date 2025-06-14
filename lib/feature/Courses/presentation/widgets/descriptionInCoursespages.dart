import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Descriptionincoursespages extends StatefulWidget {
  const Descriptionincoursespages({super.key, required this.dse});
  final String dse;

  @override
  State<Descriptionincoursespages> createState() =>
      _DescriptionincoursespagesState();
}

class _DescriptionincoursespagesState extends State<Descriptionincoursespages> {
  bool showmore = true;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Description",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 7.h),
          Divider(
            color: Colors.grey[300],
            height: 1,
            endIndent: 20,
            indent: 20,
          ),
          SizedBox(height: 7.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Html(
              data: widget.dse,
              style: {
                "body": Style(
                  fontSize: FontSize(14.0),
                  color: Colors.grey[600],
                  maxLines: showmore ? 3 : 50,
                  textOverflow: TextOverflow.ellipsis,
                ),
              },
            ),
          ),
          showmore
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      showmore = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Show more..",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      showmore = true;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Show less",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
