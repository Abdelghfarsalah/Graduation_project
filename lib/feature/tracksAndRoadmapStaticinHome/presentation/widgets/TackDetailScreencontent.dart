import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/data/models/SingelTrackMode.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackDetailsScreen extends StatelessWidget {
  final SingleTrackModel trackData;

  const TrackDetailsScreen({super.key, required this.trackData});

  Future<void> _launchRoadmapUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.h,
            floating: false,
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                trackData.data.track.title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              background: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: CachedNetworkImage(
                      imageUrl: trackData.data.track.icon,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Container(
                        color: Colors.grey[300],
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.black87,
                        child: Icon(Icons.music_note,
                            size: 60.w, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(color: Colors.black.withOpacity(0.3)),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(color: Colors.black26),
                  ),
                ],
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30.w),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Track Overview",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Html(
                      data: trackData.data.track.body,
                      style: {
                        "body": Style(
                          fontSize: FontSize(16),
                          lineHeight: const LineHeight(1.5),
                          color: Colors.black, // نص أسود
                        ),
                        "strong": Style(
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // نص أسود غامق
                        ),
                      },
                    ),
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1.h),
                    SizedBox(height: 24.h),
                    Text(
                      "Recommended Roadmaps",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    ...trackData.data.roadmaps
                        .map((roadmap) => _buildRoadmapCard(
                              roadmap: roadmap,
                              onTap: () => _launchRoadmapUrl(roadmap.link),
                            ))
                        .toList(),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildRoadmapCard({
    required Roadmap roadmap,
    required VoidCallback onTap,
  }) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 16.h),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[300]!, width: 1),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  roadmap.icon,
                  height: 120.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 120.h,
                    color: Colors.grey[200],
                    child: Icon(Icons.map, size: 40.w, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                roadmap.title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.h),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: onTap,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    side: BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "VIEW ROADMAP",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
