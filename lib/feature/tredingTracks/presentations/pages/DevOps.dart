import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DevOpsPage extends StatefulWidget {
  const DevOpsPage({super.key});

  @override
  State<DevOpsPage> createState() => _DevOpsPageState();
}

class _DevOpsPageState extends State<DevOpsPage> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: 'UbtB4sMaaNM',
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
                "assets/tredingTracks/DevOps/image1.png",
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.darken,
              ),
              title: Text(
                "DevOps Technology",
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
                      title: "DevOps Technology",
                      content:
                          "DevOps technology is used for software development and IT operations, focusing on collaboration, automation, and a culture of continuous improvement. It integrates development and operations teams, encouraging shared responsibilities and breaking down categories.",
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Automation plays a major role, from continuous integration and deployment to infrastructure management through code. Keeping track of production continuously provides valuable suggestions for continuous development. DevOps involves techniques like containerization, microservice architecture, and DevSecOps that guarantee agility, scalability, and security. It enables organizations to deliver high-quality software more efficiently, with faster time-to-market and reduced risks.",
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
                          "The field of DevOps technology offers a wide range of career opportunities as organizations increasingly adopt DevOps practices to improve their software development and operations processes. Some popular career options in DevOps include:",
                    ),

                    SizedBox(height: 16.h),
                    _buildCareerCard(
                      title: "DevOps Engineer",
                      description:
                          "Bridge development and operations by automating workflows.",
                      skills:
                          "CI/CD, Docker/Kubernetes, scripting (Bash/Python), cloud platforms (AWS/Azure/GCP)",
                    ),

                    _buildCareerCard(
                      title: "Site Reliability Engineer (SRE)",
                      description:
                          "Ensure system reliability, scalability, and performance.",
                      skills:
                          "Monitoring (Prometheus/Grafana), incident response, infrastructure as code (Terraform), SLAs/SLOs",
                    ),

                    _buildCareerCard(
                      title: "Release Manager",
                      description: "Oversee software releases and deployments.",
                      skills:
                          "Version control (Git), deployment strategies, risk management, coordination across teams",
                    ),

                    _buildCareerCard(
                      title: "Automation Architect",
                      description:
                          "Design and implement large-scale automation solutions.",
                      skills:
                          "Infrastructure as Code (IaC), configuration management (Ansible/Puppet), system design, scripting",
                    ),

                    _buildCareerCard(
                      title: "CI/CD Engineer",
                      description:
                          "Build and maintain continuous integration/deployment pipelines.",
                      skills:
                          "Jenkins/GitLab CI, artifact management, testing frameworks, cloud-native tooling",
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
                      image: "assets/tredingTracks/DevOps/image2.png",
                      title: "DevOpsDays Cairo",
                      organizer: "The Nile Ritz-Carlton, Cairo",
                      description:
                          "A worldwide series of technical conferences covering software development, IT infrastructure operations, and the intersection between them. DevOpsDays Cairo is the sole city in the Arab region organizing it since 2018. It brings DevOps practitioners together to discuss automation, agile processes, and cloud solutions.",
                      prize: "September 27-28, 2025",
                      url: "https://devopsdays.org/events/2025-cairo/welcome/",
                    ),

                    // Event 2
                    _buildHackathonCard(
                      image: "assets/tredingTracks/DevOps/image3.png",
                      title: "Exito DevOps Summit",
                      organizer: "Shangri-La Dubai",
                      description:
                          "An international event uniting leaders and professionals to discover the latest DevOps innovations and best practices. The summit focuses on collaboration across teams, agile delivery, quality, and security.",
                      prize: "Various dates in 2025",
                      url:
                          "https://www.securitymiddleeastmag.com/event/explore-the-next-era-of-devops-at-exitos-devops-summit-in-dubai/",
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
