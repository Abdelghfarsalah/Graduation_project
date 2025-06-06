import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class CyberSecurityPage extends StatefulWidget {
  const CyberSecurityPage({super.key});

  @override
  State<CyberSecurityPage> createState() => _CyberSecurityPageState();
}

class _CyberSecurityPageState extends State<CyberSecurityPage> {
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
                "assets/tredingTracks/CyberSecurity/image1.png", // Replace with your cybersecurity header image
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
                      title: "Cybersecurity Importance",
                      content:
                          "Protection of sensitive information and trust in digital systems are essentially the reasons for the cybersecurity demand. Therefore, cybersecurity needs to be beefed up, especially in the case of those industries like finance, healthcare, and government, where the consequence might be fairly adverse if there is a data-breach concern.",
                    ),

                    SizedBox(height: 8.h),
                    Text(
                      "Key cybersecurity facts:",
                      style: TextStyle(
                        fontSize: 15.sp,
                        height: 1.6,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    _buildBulletPoint(
                        "AI-driven threat detection systems can raise alarms in time before threats spread"),
                    _buildBulletPoint(
                        "Cyber attacks cost countries significant financial losses annually"),
                    _buildBulletPoint(
                        "Egypt's cybersecurity market is projected to reach \$444 million by 2030"),
                    // Divider
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),
                    Text(
                      "Cyber attacks cost countries a lot of losses ",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        height: 1.6,
                        color: Colors.black,
                      ),
                    ),
                    // // Divider
                    // SizedBox(height: 24.h),
                    // Divider(color: Colors.grey[300], height: 1),
                    // SizedBox(height: 24.h),
                    // // Divider
                    // SizedBox(height: 24.h),
                    // Divider(color: Colors.grey[300], height: 1),
                    // SizedBox(height: 24.h),
                    Image(
                        image: AssetImage(
                            "assets/tredingTracks/CyberSecurity/image2.png")),
                    // Egypt Cybersecurity Section
                    _buildSection(
                      title: "Cybersecurity in Egypt",
                      content:
                          "Egypt keeps pace with global development in cybersecurity. The Egypt Cybersecurity Market size is estimated at USD 247.64 million in 2025, and is expected to reach USD 444.08 million by 2030, at a CAGR of 12.39% during the forecast period (2025-2030).",
                    ),

                    SizedBox(height: 8.h),
                    _buildBulletPoint(
                        "Government initiatives like the Egyptian Supreme Cybersecurity Council bolster national defenses"),
                    _buildBulletPoint(
                        "Programs such as 'Our Future is Digital' and ICT Strategy 2030 strengthen digital infrastructure"),
                    _buildBulletPoint(
                        "High-demand sectors: BFSI, IT & Telecom, and government"),

                    // Divider
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),

                    // Events Section
                    Text(
                      "Featured Cybersecurity Events",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Event 1 - CyberX Global
                    _buildHackathonCard(
                      image: "assets/tredingTracks/CyberSecurity/image3.png",
                      title: "CyberX Global",
                      organizer: "CyberX",
                      description:
                          "A platform connecting cybersecurity professionals in Egypt with global experts and opportunities.",
                      prize: "Networking with industry leaders",
                      url: "https://egypt.cyberxglobal.com/",
                    ),

                    // Event 2 - CDIS Hackathon
                    _buildHackathonCard(
                      image: "assets/tredingTracks/CyberSecurity/image4.png",
                      title: "CDIS Hackathon",
                      organizer: "CDIS Egypt",
                      description:
                          "A thrilling three-day event designed to spur innovation, foster learning, and enhance skills within the cybersecurity realm.",
                      prize: "Exposure to industry experts",
                      url: "https://cdis-egypt.com/hackathon/",
                    ),

                    // Event 3 - EG-CTF Contest
                    _buildHackathonCard(
                      image: "assets/tredingTracks/CyberSecurity/image5.png",
                      title: "EG-CTF Contest",
                      organizer: "EG-CERT",
                      description:
                          "Egypt's first official national cybersecurity Capture The Flag (CTF) competition with challenges in web exploitation, reverse engineering, cryptography, and more.",
                      prize: "Prize pool of over 200,000 EGP",
                      url: "https://ctftime.org/stats/",
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
                  "Organized by: $organizer",
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
                      Icon(Icons.emoji_events_outlined,
                          color: Colors.amber[700], size: 20.w),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          "Prize: $prize",
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
