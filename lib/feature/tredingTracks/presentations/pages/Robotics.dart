import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RPAPage extends StatefulWidget {
  const RPAPage({super.key});

  @override
  State<RPAPage> createState() => _RPAPageState();
}

class _RPAPageState extends State<RPAPage> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: '6S1etS5cLYI',
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
                "assets/tredingTracks/Robotics/image1.png",
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.darken,
              ),
              title: Text(
                "Robotics Process Automation",
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
                    // RPA Introduction
                    _buildSection(
                      title: "Robotics Process Automation",
                      content:
                          "Robotic process automation is a type of business process automation that is based on artificial intelligence agents or software robots. As RPA technology develops, it is expected to become more important in automating tasks in several industries, freeing up human resources for more valuable tasks.",
                    ),

                    SizedBox(height: 8.h),
                    Text(
                      "For example:",
                      style: TextStyle(
                        fontSize: 15.sp,
                        height: 1.6,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    _buildBulletPoint(
                        "Tasks such as data entry, report generation, or handling customer service inquiries are typically automated by RPA"),
                    _buildBulletPoint(
                        "This allows human resources to focus on more strategic and value-added activities"),
                    _buildBulletPoint(
                        "RPA can integrate APIs into enterprise applications, connect to ITSM systems, and even perform AI tasks like image recognition"),

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
                          "Some highly reputed companies, including WorkFusion, Blue Prism, Pega Systems, Automation Anywhere, and UiPath, hire professionals in this field for various job roles. Some of those job roles are listed below:",
                    ),

                    SizedBox(height: 16.h),
                    _buildCareerCard(
                      title: "Process Consultant",
                      description:
                          "Analyzes business processes to identify automation opportunities",
                      skills:
                          "Process mapping, business analysis, communication",
                    ),

                    _buildCareerCard(
                      title: "RPA Analyst",
                      description:
                          "Evaluates and documents processes suitable for automation; assists in designing RPA solutions",
                      skills:
                          "Analytical thinking, understanding of RPA tools, documentation skills",
                    ),

                    _buildCareerCard(
                      title: "RPA Solution Architect",
                      description:
                          "Designs the overall architecture of RPA solutions to ensure they meet business needs",
                      skills:
                          "Technical expertise in RPA platforms, system integration, architecture design",
                    ),

                    _buildCareerCard(
                      title: "RPA Developer",
                      description:
                          "Develops, tests, and deploys RPA bots based on specified requirements",
                      skills:
                          "Programming (e.g., UiPath, Automation Anywhere), debugging, problem-solving",
                    ),

                    // Events Section
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),

                    Text(
                      "Featured RPA Events",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Event 1
                    _buildEventCard(
                      image: "assets/tredingTracks/Robotics/image2.png",
                      title: "Cairo ICT",
                      description:
                          "A major technology conference and exhibition in the Middle East and Africa. It showcases the latest advancements in technology, including AI and automation solutions. It serves national objectives, businesses, development, and human resources.",
                      location:
                          "Egypt International Exhibition Center, Cairo, Egypt",
                      dates: "November 16 - 19, 2025",
                      url: "https://cairoict.com/",
                    ),

                    // Event 2
                    _buildEventCard(
                      image: "assets/tredingTracks/Robotics/image3.png",
                      title: "GITEX Technology Week",
                      description:
                          "A large technology event in the Middle East, North Africa & South Asia. It showcases advancements in AI, 5G, cloud computing, big data, cybersecurity, blockchain, and more. It attracts industry leaders, startups, and government entities.",
                      location: "Dubai World Trade Centre, Dubai, UAE",
                      dates: "October 13 - 17, 2025",
                      url: "https://www.gitex.com/",
                    ),

                    // Robotics Competitions
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),

                    _buildSection(
                      title: "Robotics Competitions for Students in Egypt",
                      content:
                          "Several robotics competitions are held annually for young people in Egypt, including:",
                    ),

                    SizedBox(height: 8.h),
                    _buildBulletPoint("First Lego League Junior (ages 6-10)"),
                    _buildBulletPoint("FIRST Tech Challenge (FTC)"),
                    _buildBulletPoint("FIRST LEGO League (FLL)"),
                    _buildBulletPoint("RoboCupJunior Egypt"),
                    _buildBulletPoint("ROV Competition"),
                    _buildBulletPoint("The World Robot Olympiad (WRO)"),
                    _buildBulletPoint("The VEX Robotics Competition"),

                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => _launchURL(
                            "https://egyptinnovate.com/en/articles/top-7-robotics-competitions-students-egypt"),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          side: BorderSide(color: Colors.grey[700]!),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "LEARN MORE ABOUT COMPETITIONS",
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

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6.h, right: 12.w),
            child: Icon(Icons.circle, size: 8.w, color: Colors.grey[700]),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15.sp,
                height: 1.5,
                color: Colors.grey[700],
              ),
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
              "Key Skills: $skills",
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
    required String location,
    required String dates,
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
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(Icons.location_on,
                        size: 16.w, color: Colors.grey[600]),
                    SizedBox(width: 4.w),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      child: Text(
                        location,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.calendar_today,
                        size: 16.w, color: Colors.grey[600]),
                    SizedBox(width: 4.w),
                    Text(
                      dates,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
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
