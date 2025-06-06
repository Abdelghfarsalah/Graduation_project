import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class DigitalTwinsPage extends StatefulWidget {
  const DigitalTwinsPage({super.key});

  @override
  State<DigitalTwinsPage> createState() => _DigitalTwinsPageState();
}

class _DigitalTwinsPageState extends State<DigitalTwinsPage> {
  void _launchURL(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
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
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/tredingTracks/DigitalTwins/image1.png", // Replace with your digital twin header image
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.darken,
              ),
              title: Text(
                "Digital Twins",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
            ),
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.grey[900],
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Digital Twins Introduction
                    _buildSection(
                      title: "Digital Twins Technology",
                      content:
                          "Digital twins are virtual replicas of physical objects, systems, or processes that allow for real-time simulation and analysis. By using sensors and data, digital twins mirror the real-world entities they represent, enabling businesses to monitor performance, predict maintenance needs, and optimise operations.",
                    ),

                    // Divider
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),

                    // Events Section
                    Text(
                      "Featured Digital Twin Events",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Event 1 - Egypt Digital Twin Summit
                    _buildEventCard(
                      image: "assets/tredingTracks/DigitalTwins/image2.png",
                      title: "Egypt Digital Twin 2025 Summit & Hackathon",
                      description:
                          "Focus on Smart cities, infrastructure, and AI-driven digital twins for urban development.",
                      url: "https://youtu.be/wsuuTzNfLt8?si=zCswJfF0WXe-B2lN",
                      isVideo: true,
                    ),

                    // Event 2 - Digital Twin Awards
                    _buildEventCard(
                      image: "assets/tredingTracks/DigitalTwins/image3.png",
                      title: "Digital Twin Awards 2025 (Global, incl. Egypt)",
                      description:
                          "Egyptian Winner: NAV3D (Cairo-based) won 'People’s Choice' for digitally preserving Abu Simbel Temple with Matterport scans\n\n"
                          "Best Digital Twin for Historical Preservation 2025 - People's Choice Winner",
                      url: "https://www.digitaltwinawards.com/",
                      isVideo: false,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[900],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            content,
            style: TextStyle(
              fontSize: 15.sp,
              height: 1.6,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard({
    required String image,
    required String title,
    required String description,
    required String url,
    required bool isVideo,
  }) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 24.h),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              height: 180.h,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[900],
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 15.sp,
                    height: 1.5,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => _launchURL(url),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      side: BorderSide(color: Colors.grey[700]!),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isVideo ? Icons.play_circle_outline : Icons.link,
                          color: Colors.grey[700],
                          size: 20.w,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          isVideo ? "WATCH VIDEO" : "VISIT WEBSITE",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
