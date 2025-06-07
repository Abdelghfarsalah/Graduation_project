import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CloudComputingPage extends StatefulWidget {
  const CloudComputingPage({super.key});

  @override
  State<CloudComputingPage> createState() => _CloudComputingPageState();
}

class _CloudComputingPageState extends State<CloudComputingPage> {
  late YoutubePlayerController _youtubeController;
  late YoutubePlayerController _conferenceYoutubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: '27vJg3v9AqM',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: true,
        loop: false,
        isLive: false,
      ),
    );

    _conferenceYoutubeController = YoutubePlayerController(
      initialVideoId: 'hVfT0XLiHSo',
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
    _conferenceYoutubeController.dispose();
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
                "assets/tredingTracks/CloudComputing/image1.png",
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.darken,
              ),
              title: Text(
                "Cloud Computing",
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
                      title: "Cloud Computing Technology",
                      content:
                          "Cloud computing technology has changed the way computing resources are delivered and managed. It uses a network of remote servers hosted on the internet to store, manage, and process data.",
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "We can have access to a wide range of computing services, including storage, processing power, and applications, without the need for users to invest in and maintain physical infrastructure. Cloud computing provides scalability, allowing businesses to easily scale up or down based on their needs. It promotes flexibility, collaboration, and cost-efficiency as users pay for only the resources they consume.",
                      style: TextStyle(
                        fontSize: 15.sp,
                        height: 1.6,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "With models such as Infrastructure as a Service (IaaS), Platform as a Service (PaaS), and Software as a Service (SaaS), cloud computing has become integral to modern IT architectures, supporting a myriad of applications and services for businesses, individuals, and organizations worldwide.",
                      style: TextStyle(
                        fontSize: 15.sp,
                        height: 1.6,
                        color: Colors.grey[700],
                      ),
                    ),

                    SizedBox(height: 24.h),
                    // Main Video Player Section
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
                          "The field of cloud computing offers diverse career paths as organizations increasingly adopt cloud solutions. Here are some key roles in this domain:",
                    ),

                    SizedBox(height: 16.h),
                    _buildCareerCard(
                      title: "Cloud Solutions Architect",
                      description:
                          "Design and oversee cloud infrastructure and solutions.",
                      skills:
                          "Cloud platforms (AWS/Azure/GCP), architecture design, scalability, security",
                    ),

                    _buildCareerCard(
                      title: "Cloud Engineer",
                      description:
                          "Implement and manage cloud services and deployments.",
                      skills:
                          "Infrastructure as Code (Terraform, CloudFormation), CI/CD, cloud networking",
                    ),

                    _buildCareerCard(
                      title: "Cloud Developer",
                      description:
                          "Build and optimize cloud-native applications.",
                      skills:
                          "Serverless computing, APIs, programming (Python/Node.js/Java), databases",
                    ),

                    _buildCareerCard(
                      title: "DevOps Engineer",
                      description:
                          "Automate and streamline cloud deployments and operations.",
                      skills:
                          "CI/CD pipelines, Docker/Kubernetes, scripting, monitoring (Prometheus, Grafana)",
                    ),

                    _buildCareerCard(
                      title: "Cloud Administrator",
                      description: "Manage and maintain cloud environments.",
                      skills:
                          "Cloud resource management, troubleshooting, backup/recovery, security basics",
                    ),

                    _buildCareerCard(
                      title: "Cloud Consultant",
                      description:
                          "Advise businesses on cloud strategy and migration.",
                      skills:
                          "Cloud cost optimization, vendor comparison, compliance, best practices",
                    ),

                    _buildCareerCard(
                      title: "Cloud Network Engineer",
                      description:
                          "Design and manage cloud networking and connectivity.",
                      skills:
                          "VPNs, VPCs, load balancing, firewalls, hybrid cloud setups",
                    ),

                    // Divider
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),

                    // Events & Conferences Section
                    Text(
                      "Events & Conferences",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Event 1
                    _buildHackathonCard(
                      image: "assets/tredingTracks/CloudComputing/image2.png",
                      title: "AIDC-Expo (AI, Data Centers & Cloud Conference)",
                      organizer: "Cairo, Egypt",
                      description:
                          "Focuses on AI, Data Centers, and Cloud technologies in the MENA region.",
                      prize: "November 16-19, 2025",
                      url: "https://aidc-expo.com/",
                      hasVideo: true,
                      videoController: _conferenceYoutubeController,
                    ),

                    // Event 2
                    _buildHackathonCard(
                      image: "assets/tredingTracks/CloudComputing/image3.png",
                      title:
                          "Datacentre & Cloud Summit :: Innovation Series | EGYPT",
                      organizer: "Egypt",
                      description:
                          "Gathering of industry leaders to discuss the future of data centers in Egypt and the MENA region, including cloud computing and AI-driven infrastructure.",
                      prize: "Various dates in 2025",
                      url: "https://dcis.traiconevents.com/egypt/",
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

  Widget _buildHackathonCard({
    required String image,
    required String title,
    required String organizer,
    required String description,
    required String prize,
    required String url,
    bool hasVideo = false,
    YoutubePlayerController? videoController,
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
                SizedBox(height: 4.h),
                Text(
                  "Location: $organizer",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
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
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today,
                          color: Colors.blue[700], size: 20.w),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          "Dates: $prize",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Conference video if available
                if (hasVideo && videoController != null) ...[
                  SizedBox(height: 16.h),
                  Text(
                    "Conference Preview:",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[900],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  YoutubePlayer(
                    controller: videoController,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blueAccent,
                    progressColors: const ProgressBarColors(
                      playedColor: Colors.blue,
                      handleColor: Colors.blueAccent,
                    ),
                    width: double.infinity,
                    aspectRatio: 16 / 9,
                  ),
                ],

                SizedBox(height: 16.h),
                if (url.isNotEmpty)
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
          ),
        ],
      ),
    );
  }
}
