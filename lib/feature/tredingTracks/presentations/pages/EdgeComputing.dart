import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EdgeComputingPage extends StatefulWidget {
  const EdgeComputingPage({super.key});

  @override
  State<EdgeComputingPage> createState() => _EdgeComputingPageState();
}

class _EdgeComputingPageState extends State<EdgeComputingPage> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: 'cEOUeItHDdo',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
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
                "assets/tredingTracks/EdgeComputing/image1.png",
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.darken,
              ),
              title: Text(
                "Edge Computing",
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
                    _buildSection(
                      title: "Edge Computing Technology",
                      content:
                          "By processing data close to its source, edge computing technology reduces latency and maximizes real-time processing capabilities. Edge computing reduces the requirement for centralized cloud processing by distributing computing resources closer to the edge of the network.",
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Applications like IoT, driverless cars, and healthcare that demand low latency can benefit from this strategy. By processing sensitive data locally, edge computing improves privacy and security while providing scalability, flexibility, and bandwidth optimization. Edge computing is a valuable addition to traditional cloud computing in several sectors where quick decisions and real-time data processing are necessary.",
                      style: TextStyle(
                        fontSize: 15.sp,
                        height: 1.6,
                        color: Colors.grey[700],
                      ),
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
                          "The field of edge computing offers a variety of career opportunities across various sectors. Professionals with expertise in edge computing technologies are in demand. Some of the career opportunities in edge computing include:",
                    ),

                    SizedBox(height: 16.h),
                    _buildCareerCard(
                      title: "Edge Computing Engineer",
                      description:
                          "Design and deploy edge computing solutions to process data closer to the source.",
                      skills:
                          "Networking (5G, MEC), IoT protocols (MQTT, CoAP), edge frameworks (LF Edge), containerization (Docker, Kubernetes), programming (Python, C++)",
                    ),

                    _buildCareerCard(
                      title: "Edge Cloud Developer",
                      description:
                          "Develop hybrid edge-cloud applications for seamless data processing.",
                      skills:
                          "Cloud platforms (AWS Greengrass, Azure IoT Edge), distributed computing, serverless edge architectures, data streaming (Kafka, Flink), DevOps for edge",
                    ),

                    _buildCareerCard(
                      title: "Edge Infrastructure Manager",
                      description:
                          "Oversee edge computing infrastructure, ensuring reliability and scalability.",
                      skills:
                          "Edge hardware management, network security, orchestration tools (KubeEdge, OpenYurt), monitoring (Prometheus, Grafana), automation (Ansible, Terraform)",
                    ),

                    _buildCareerCard(
                      title: "Edge Computing Researcher",
                      description:
                          "Explore new algorithms and architectures to advance edge computing technology.",
                      skills:
                          "Research in distributed systems, AI/ML for edge, optimization techniques, familiarity with academic tools (NS-3, OMNeT++), strong publication record",
                    ),
                    Image.asset(
                      "assets/tredingTracks/EdgeComputing/image2.png",
                    ),
                    Image.asset(
                      "assets/tredingTracks/EdgeComputing/image3.png",
                    ),
                    // Divider
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),

                    // Applications Section
                    Text(
                      "Examples of  Edge Computing Applications",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 16.h),

                    _buildApplicationCard(
                      icon: Icons.location_city,
                      title: "Smart Cities",
                      description: "Traffic management, public safety systems",
                    ),

                    _buildApplicationCard(
                      icon: Icons.factory,
                      title: "Industrial IoT",
                      description:
                          "Real-time data analytics in oil & gas, manufacturing, and energy sectors",
                    ),

                    _buildApplicationCard(
                      icon: Icons.medical_services,
                      title: "Healthcare",
                      description:
                          "Real-time data processing and enhanced patient care systems",
                    ),

                    _buildApplicationCard(
                      icon: Icons.shopping_cart,
                      title: "Retail",
                      description:
                          "Improved shopping experiences with digital signage and personalized offers",
                    ),

                    // Middle East Adoption Section
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),

                    _buildSection(
                      title: "Edge Computing in the Middle East",
                      content:
                          "Edge computing is gaining traction in the Middle East due to digital transformation initiatives, smart city projects (UAE's National Artificial Intelligence Strategy 2031, Saudi Arabia's Vision 2030 and Digital Egypt), and the need for low latency applications.",
                    ),

                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => _launchURL(
                            "https://www.kenresearch.com/industry-reports/middle-east-africa-edge-computing-market"),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          side: BorderSide(color: Colors.grey[700]!),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "LEARN MORE ABOUT MIDDLE EAST EDGE COMPUTING MARKET",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
              "Skills: $skills",
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

  Widget _buildApplicationCard({
    required IconData icon,
    required String title,
    required String description,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 24.w, color: Colors.blue[700]),
            SizedBox(width: 16.w),
            Expanded(
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
                  SizedBox(height: 4.h),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
