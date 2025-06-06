import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class AIHackathonsPage extends StatefulWidget {
  const AIHackathonsPage({super.key});

  @override
  State<AIHackathonsPage> createState() => _AIHackathonsPageState();
}

class _AIHackathonsPageState extends State<AIHackathonsPage> {
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
                "assets/tredingTracks/AiAndML/image.png", // Replace with your AI header image
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.darken,
              ),
              title: Text(
                " AI and  ML",
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
                    // AI/ML Introduction
                    _buildSection(
                      title: "AI & Machine Learning",
                      content:
                          "AI and ML technologies enable machines to learn from data and make autonomous decisions. These transformative technologies are being applied across various domains from voice assistants to autonomous vehicles, predictive analytics, and fraud detection .",
                    ),

                    SizedBox(height: 8.h),
                    Text(
                      "AI is transforming industries like healthcare, finance, and entertainment. For instance:",
                      style: TextStyle(
                        fontSize: 15.sp,
                        height: 1.6,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    _buildBulletPoint(
                        "Large language models (LLMs) like ChatGPT are revolutionizing human-computer interaction"),
                    _buildBulletPoint(
                        "18% of computer science papers now use AI tools for research assistance"),
                    _buildBulletPoint(
                        "Global AI market projected to reach \$1.8 trillion by 2030"),

                    // Divider
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),

                    // Hackathons Section
                    Text(
                      "Featured AI Hackathons",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Hackathon 1
                    _buildHackathonCard(
                      image: "assets/tredingTracks/AiAndML/image1.png",
                      title: "Global AI Hackathon",
                      organizer: "MIT RAISE & App Inventor Foundation",
                      description:
                          "Free, open to all ages virtual hackathon encouraging people worldwide to build AI apps for social causes.",
                      prize:
                          "All-expenses-paid trip to MIT's AI & Education Summit",
                      url:
                          "https://raise.mit.edu/events/global-ai-hackathon-2025/",
                    ),

                    // Hackathon 2
                    _buildHackathonCard(
                      image: "assets/tredingTracks/AiAndML/image3.png",
                      title: "AI Agent Hackathon",
                      organizer: "Microsoft",
                      description:
                          "Virtual event with expert-led sessions focused on building AI agents using Semantic Kernel, Autogen, and Azure AI.",
                      prize:
                          "Up to \$20,000 for 'Best Overall Agent' + language-specific prizes",
                      url: "https://microsoft.github.io/AI_Agents_Hackathon/",
                    ),

                    // Hackathon 3
                    _buildHackathonCard(
                      image: "assets/tredingTracks/AiAndML/image2.png",
                      title: "Orange Egypt AI Hackathon",
                      organizer: "Orange Egypt",
                      description:
                          "Two-day event bringing together top tech talents from Egyptian universities under the theme 'Where Ideas Spark'.",
                      prize:
                          "Career opportunities and recognition in Egypt's tech ecosystem",
                      url: "",
                    ),

                    // Hackathon 4
                    _buildHackathonCard(
                      image: "assets/tredingTracks/AiAndML/image4.png",
                      title: "Egypt AI Hackathon",
                      organizer: "E-Tech Summit",
                      description:
                          "Focused on 'AI and IoT Technologies towards a Sustainable Future', promoting environmental and economic sustainability.",
                      prize: "Funding opportunities and industry recognition",
                      url: "https://etechsummit.com/egypt-ai-hackathon/",
                    ),

                    // Apply Button
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
