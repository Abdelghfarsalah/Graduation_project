import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DigitalTwinsPage extends StatefulWidget {
  const DigitalTwinsPage({super.key});

  @override
  State<DigitalTwinsPage> createState() => _DigitalTwinsPageState();
}

class _DigitalTwinsPageState extends State<DigitalTwinsPage> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: '2hnoGo27uf8',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: true,
        loop: false,
        isLive: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  void _launchURL(String url) async {
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
                "assets/tredingTracks/DigitalTwins/image1.png",
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
                      title: "Digital Twins",
                      content:
                          "Digital twins are virtual replicas of physical objects, systems, or processes that allow for real-time simulation and analysis. By using sensors and data, digital twins mirror the real-world entities they represent, enabling businesses to monitor performance, predict maintenance needs, and optimise operations.",
                    ),

                    SizedBox(height: 24.h),
                    // Video Player Section
                    YoutubePlayer(
                      controller: _youtubeController,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.blueAccent,
                      progressColors: const ProgressBarColors(
                        playedColor: Colors.blue,
                        handleColor: Colors.blueAccent,
                      ),
                      onReady: () {
                        _youtubeController.addListener(() {});
                      },
                    ),
                    // Career Opportunities Section
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),

                    _buildSection(
                      title: "Career Opportunities",
                      content:
                          "Digital twins technology is going to be an important technology in the future. Therefore, there are many career opportunities in this field. Some of them are:",
                    ),

                    SizedBox(height: 16.h),
                    _buildCareerCard(
                      title: "Digital Twin Engineers and Manufacturers",
                      description:
                          "Design, build, and maintain digital twin models of physical assets (e.g., machines, factories, or products)",
                      skills:
                          "IoT and sensor integration, CAD/3D modeling (e.g., Siemens NX, AutoCAD), Cloud platforms (AWS, Azure), Knowledge of Industry 4.0 standards",
                    ),

                    _buildCareerCard(
                      title: "Digital Twin Simulation Data Analysts",
                      description:
                          "Analyze real-time and historical data from digital twins to optimize performance and predict failures",
                      skills:
                          "Data analytics (Python, SQL), Predictive maintenance algorithms, Machine learning basics, Visualization tools (Tableau, Power BI)",
                    ),

                    _buildCareerCard(
                      title: "Product and System Simulation Developers",
                      description:
                          "Develop software to simulate how products/systems behave under different conditions using digital twins",
                      skills:
                          "Simulation tools (ANSYS, MATLAB), Programming (C++, Python), Physics/engineering principles, AI-driven scenario testing",
                    ),

                    // Events Section
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),

                    Text(
                      "Featured Digital Twins Events",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Event 1
                    _buildEventCard(
                      image: "assets/tredingTracks/DigitalTwins/image2.png",
                      title: "Egypt Digital Twin 2025 Summit & Hackathon",
                      description:
                          "Focus on Smart cities, infrastructure, and AI-driven digital twins for urban development.",
                      videoUrl:
                          "https://youtu.be/wsuuTzNfLt8?si=zCswJfF0WXe-B2lN",
                    ),

                    // Event 2
                    _buildEventCard(
                      image: "assets/tredingTracks/DigitalTwins/image3.png",
                      title: "Digital Twin Awards 2025 (Global, incl. Egypt)",
                      description:
                          "Egyptian Winner: NAV3D (Cairo-based) won 'People's Choice' for digitally preserving Abu Simbel Temple with Matterport scans - Best Digital Twin for Historical Preservation 2025",
                      url:
                          "https://www.digitaltwinawards.com/2025/entry/732/32",
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

  Widget _buildCareerCard({
    required String title,
    required String description,
    required String skills,
  }) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 16.h),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey[200]!, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey[900],
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Role: $description",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Skills Required: $skills",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[700],
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard({
    required String image,
    required String title,
    required String description,
    String? url,
    String? videoUrl,
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
                Row(
                  children: [
                    if (videoUrl != null)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => _launchURL(videoUrl),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            side: BorderSide(color: Colors.blue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.play_arrow,
                                  color: Colors.blue, size: 20.w),
                              SizedBox(width: 8.w),
                              Text(
                                "WATCH VIDEO",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (videoUrl != null && url != null) SizedBox(width: 16.w),
                    if (url != null)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => _launchURL(url),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            side: BorderSide(color: Colors.grey[700]!),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "VISIT WEBSITE",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
