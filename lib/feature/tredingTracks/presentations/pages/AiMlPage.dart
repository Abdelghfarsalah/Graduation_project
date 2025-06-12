import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AIHackathonsPage extends StatefulWidget {
  const AIHackathonsPage({super.key});

  @override
  State<AIHackathonsPage> createState() => _AIHackathonsPageState();
}

class _AIHackathonsPageState extends State<AIHackathonsPage> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: 'qYNweeDHiyU',
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
                "assets/tredingTracks/AiAndML/image.png",
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.darken,
              ),
              title: Text(
                "AI and ML",
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
                      title:
                          "Artificial Intelligence (AI) and Machine Learning (ML)",
                      content:
                          "AI and ML refer to technologies that enable machines to learn from data and also take decisions autonomously. These large technologies through this way have been applied in different areas, from voice assistants to autonomous vehicles, predictive analytics, and detection methods against fraud.",
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "AI is no longer just a buzzword; it's transforming industries like healthcare, finance, and entertainment. For instance:",
                      style: TextStyle(
                        fontSize: 15.sp,
                        height: 1.6,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    _buildBulletPoint(
                        "Large language models (LLMs) like ChatGPT are revolutionizing how we interact with technology"),
                    _buildBulletPoint(
                        "AI is even being used to assist in writing research papers (18% of computer science papers now use AI tools)"),
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
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),
                    _buildSection(
                      title: "Career Opportunities",
                      content:
                          "Machine learning and AI are used in various industries, such as finance, healthcare, manufacturing, agriculture, education, and many others. Some of the career opportunities available in the fields of AI and ML include:",
                    ),
                    SizedBox(height: 16.h),
                    _buildCareerCard(
                      title: "AI Engineer",
                      description:
                          "Build and deploy AI systems for real-world applications",
                      skills:
                          "Python, TensorFlow/PyTorch, cloud AI services, model deployment",
                    ),
                    _buildCareerCard(
                      title: "AI Architect",
                      description:
                          "Design the overall AI system infrastructure and strategy",
                      skills:
                          "System design, cloud platforms, AI pipelines, scalability planning",
                    ),
                    _buildCareerCard(
                      title: "AI Research Scientist",
                      description:
                          "Develop new AI algorithms and advance the field",
                      skills:
                          "Advanced math (linear algebra, calculus), research papers, experimental design",
                    ),
                    _buildCareerCard(
                      title: "Machine Learning Engineer",
                      description:
                          "Develop and optimize ML models for production",
                      skills:
                          "Data preprocessing, model training, ML frameworks, MLOps",
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
                    _buildBulletPoint("Strong programming (Python)"),
                    _buildBulletPoint(
                        "Understanding of algorithms and data structures"),
                    _buildBulletPoint("Math/statistics knowledge"),
                    _buildBulletPoint("Problem-solving skills"),
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),
                    Text(
                      "Featured AI Hackathons",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    _buildHackathonCard(
                      image: "assets/tredingTracks/AiAndML/image1.png",
                      title: "Global AI Hackathon",
                      organizer: "MIT RAISE & App Inventor Foundation",
                      description:
                          "A free, open to all ages and virtual hackathon hosted by MIT RAISE and the App Inventor Foundation that encourages people of all ages around the world to build AI apps for a cause.",
                      prize:
                          "All-expenses-paid trip to MIT's AI & Education Summit for winners",
                      url:
                          "https://raise.mit.edu/events/global-ai-hackathon-2025/",
                    ),
                    _buildHackathonCard(
                      image: "assets/tredingTracks/AiAndML/image3.png",
                      title: "AI Agent Hackathon",
                      organizer: "Microsoft",
                      description:
                          "Virtual, with expert-led live sessions. Focus on Building AI agents using frameworks like Semantic Kernel, Autogen, and Azure AI organized by Microsoft.",
                      prize:
                          "Up to \$20,000 for 'Best Overall Agent,' with language-specific prizes (Python, C#, Java, etc.).",
                      url: "https://microsoft.github.io/AI_Agents_Hackathon/",
                    ),
                    _buildHackathonCard(
                      image: "assets/tredingTracks/AiAndML/image2.jpeg",
                      title: "Orange Egypt AI Hackathon",
                      organizer: "Orange Egypt",
                      description:
                          "Orange Egypt has launched the Orange Egypt Artificial Intelligence Hackathon 2025 at its headquarters in Smart Village. The two-day event brought together top tech talents from leading Egyptian universities, supported by experts in technology and entrepreneurship under the theme 'Where Ideas Spark'.",
                      prize:
                          "Career opportunities and recognition in Egypt's tech ecosystem",
                      url:
                          "https://www.orange.eg/en/about/media-center/press-kit/orange-egypt-launches-ai-hackathon-2025-862-event",
                    ),
                    _buildHackathonCard(
                      image: "assets/tredingTracks/AiAndML/image4.png",
                      title: "Egypt AI Hackathon",
                      organizer: "E-Tech Summit",
                      description:
                          "The hackathon revolves around the theme of 'AI and IoT Technologies towards a Sustainable Future.' This theme invites you to envision how these transformative technologies can be harnessed to create solutions that promote environmental, social, and economic sustainability.",
                      prize: "Funding opportunities and industry recognition",
                      url: "https://etechsummit.com/egypt-ai-hackathon/",
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
