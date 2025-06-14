import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/recommendchatPage.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/widgets/createRoadmapBotton.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CyberSecurityPage extends StatefulWidget {
  const CyberSecurityPage({super.key});

  @override
  State<CyberSecurityPage> createState() => _CyberSecurityPageState();
}

class _CyberSecurityPageState extends State<CyberSecurityPage> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: '4CuXNs6SboU',
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
                "assets/tredingTracks/CyberSecurity/image1.png", // تأكد من وجود هذه الصورة في مجلد assets
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.darken,
              ),
              title: Text(
                "Cybersecurity",
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
                    // Cybersecurity Introduction
                    _buildSection(
                      title: "Cybersecurity",
                      content:
                          "Protection of sensitive information and trust in digital systems are essentially the reasons for the cybersecurity demand. Therefore, cybersecurity needs to be beefed up, especially in the case of those industries like finance, healthcare, and government, where the consequence might be fairly adverse if there is a data-breach concern.",
                    ),

                    SizedBox(height: 8.h),
                    Text(
                      "For instance:",
                      style: TextStyle(
                        fontSize: 15.sp,
                        height: 1.6,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    _buildBulletPoint(
                        "AI-driven threat detection systems can raise alarms in time before such threats spread out"),
                    _buildBulletPoint(
                        "Detect potential cyber threats and protect against those, minimizing the chance of data being taken away"),

                    SizedBox(height: 24.h),
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
                    Text(
                      "Cyber attacks cost countries a lot of losses : ",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Image.asset(
                      "assets/tredingTracks/CyberSecurity/image2.png",
                    ),
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),
                    _buildSection(
                      title: "Career Opportunities",
                      content:
                          "This technology is becoming more popular day by day; therefore, there are ample opportunities to build a career in this field. The career opportunities available in the field of cyber security include:",
                    ),

                    SizedBox(height: 16.h),
                    _buildCareerCard(
                      title: "Malware Analyst",
                      description:
                          "Investigate malicious software to understand its behavior and develop defenses",
                      skills:
                          "Reverse engineering, debugging tools, malware detection techniques",
                    ),

                    _buildCareerCard(
                      title: "Security Engineer",
                      description:
                          "Build and maintain security systems to protect organizations",
                      skills:
                          "Firewalls, encryption, vulnerability assessment, security protocols",
                    ),

                    _buildCareerCard(
                      title: "Ethical Hacker",
                      description:
                          "Legally hack systems to find vulnerabilities before criminals do",
                      skills:
                          "Penetration testing, hacking tools, security certifications (CEH)",
                    ),

                    _buildCareerCard(
                      title: "Chief Security Officer (CSO)",
                      description:
                          "Oversee an organization's entire security strategy",
                      skills:
                          "Risk management, security policies, leadership, compliance",
                    ),

                    SizedBox(height: 16.h),
                    Text(
                      "Common Requirements:",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    _buildBulletPoint("Cybersecurity fundamentals"),
                    _buildBulletPoint("Problem-solving skills"),
                    _buildBulletPoint("Continuous learning mindset"),
                    _buildBulletPoint(
                        "Technical certifications (CISSP, OSCP, etc.)"),

                    // Egypt Cybersecurity Market
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),

                    _buildSection(
                      title: "Egypt Cybersecurity Market",
                      content:
                          "Egypt keeps pace with global development and progress in the field of cybersecurity. The Egypt Cybersecurity Market size is estimated at USD 247.64 million in 2025, and is expected to reach USD 444.08 million by 2030, at a CAGR of 12.39% during the forecast period (2025-2030).",
                    ),

                    SizedBox(height: 8.h),
                    _buildBulletPoint(
                        "Government initiatives like The establishment of the Egyptian Supreme Cybersecurity Council are bolstering national defenses"),
                    _buildBulletPoint(
                        "Programs such as 'Our Future is Digital' and the ICT Strategy 2030 aim to strengthen digital infrastructure and literacy"),
                    _buildBulletPoint(
                        "High-demand sectors including BFSI, IT & Telecom, and government are leading cybersecurity investments"),

                    // Events Section
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),

                    Text(
                      "Featured Cybersecurity Events",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Event 1
                    _buildEventCard(
                      image: "assets/tredingTracks/CyberSecurity/image3.png",
                      title: "CyberX Global",
                      description:
                          "A series of seminars and conferences dedicated to IT & OT Professionals and cyber security technology innovators globally. Events have taken place in Saudi, Qatar, UAE, Oman, Kuwait, Egypt and India.",
                      url: "https://egypt.cyberxglobal.com/",
                    ),

                    // Event 2
                    _buildEventCard(
                      image: "assets/tredingTracks/CyberSecurity/image4.png",
                      title: "CDIS Hackathon",
                      description:
                          "A thrilling three-day event designed to spur innovation, foster learning, and enhance skills within the cybersecurity realm. By bringing together interested participants, this hackathon serves as a dynamic platform for promoting secure coding practices.",
                      url: "https://cdis-egypt.com/hackathon/",
                    ),

                    // Event 3
                    _buildEventCard(
                      image: "assets/tredingTracks/CyberSecurity/image5.png",
                      title: "EG-CTF Contest",
                      description:
                          "Egypt's first official national cybersecurity Capture The Flag (CTF) competition organized by EG-CERT. Talented security enthusiasts compete for the fame and a prize pool of over 200,000 Egyptian pounds.",
                      url: "https://ctftime.org/stats/",
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
      floatingActionButton: CreateRadmapButton(
        onPressed: () {
          Animationsforpages.navigateWithSlidepush(
              context,
              Recommendchatpage(
                text: "Cybersecurity",
              ));
        },
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
              "What they do: $description",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Key skills: $skills",
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
