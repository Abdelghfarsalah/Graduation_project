import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BioinformaticsPage extends StatefulWidget {
  const BioinformaticsPage({super.key});

  @override
  State<BioinformaticsPage> createState() => _BioinformaticsPageState();
}

class _BioinformaticsPageState extends State<BioinformaticsPage> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: 'qhoDiwEX8mI',
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
                "assets/tredingTracks/Bioinformatics/image1.png",
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.darken,
              ),
              title: Text(
                "Bioinformatics",
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
                      title: "Bioinformatics",
                      content:
                          "Bioinformatics is fundamental to much biological research and involves biologists who learn programming, or computer programmers, mathematicians or database managers who learn the foundations of biology. Bioinformatics enables us to handle the huge amounts of data involved and make sense of them.",
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Bioinformatics involves processing, storing and analysing biological data. This might include:",
                      style: TextStyle(
                        fontSize: 15.sp,
                        height: 1.6,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    _buildBulletPoint(
                        "Creating databases to store experimental data"),
                    _buildBulletPoint(
                        "Predicting the way that proteins fold up"),
                    _buildBulletPoint(
                        "Modelling how all the chemical reactions in a cell interact with each other"),
                    SizedBox(height: 8.h),
                    Text(
                      "Bioinformatics is a broad field and needs a diverse range of people with diverse skill sets. Programmers to write the computer programs to analyse all this data, database administrators to organise storing it all, biological scientists and statisticians to analyse the data, and web designers to produce sites and apps that scientists can use to search all this data.",
                      style: TextStyle(
                        fontSize: 15.sp,
                        height: 1.6,
                        color: Colors.grey[700],
                      ),
                    ),
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
                          "Bioinformatics offers diverse career paths at the intersection of biology and computer science. Here are some of the key roles in this field:",
                    ),
                    SizedBox(height: 16.h),
                    _buildCareerCard(
                      title: "Bioinformatics Scientist",
                      description:
                          "Analyze biological data using software tools and algorithms.",
                      skills:
                          "Programming (Python, R), data analysis, knowledge of molecular biology",
                    ),
                    _buildCareerCard(
                      title: "Computational Biologist",
                      description:
                          "Use computational techniques to model biological systems and processes.",
                      skills:
                          "Strong background in biology and programming, statistical analysis",
                    ),
                    _buildCareerCard(
                      title: "Genomics Data Analyst",
                      description:
                          "Analyze genomic data to identify genetic variants and their implications.",
                      skills:
                          "Experience with genomic databases, data visualization tools, and statistical software",
                    ),
                    _buildCareerCard(
                      title: "Bioinformatics Software Developer",
                      description:
                          "Develop software applications for biological data analysis.",
                      skills:
                          "Programming skills (Java, C++, Python), software development experience",
                    ),
                    _buildCareerCard(
                      title: "Clinical Bioinformatician",
                      description:
                          "Work in healthcare settings to analyze patient data for personalized medicine.",
                      skills:
                          "Knowledge of clinical workflows, experience with EHR systems, and bioinformatics tools",
                    ),
                    _buildCareerCard(
                      title: "Research Scientist (Bioinformatics)",
                      description:
                          "Conduct research in academic or industrial laboratories using bioinformatics methods.",
                      skills:
                          "Strong research background, ability to publish findings, collaboration skills",
                    ),
                    _buildCareerCard(
                      title: "Pharmaceutical Bioinformatician",
                      description:
                          "Work in drug discovery and development, analyzing data from clinical trials.",
                      skills:
                          "Understanding of pharmacogenomics, data analysis, and regulatory knowledge",
                    ),
                    _buildCareerCard(
                      title: "Data Scientist (Bioinformatics)",
                      description:
                          "Utilize data science techniques to extract insights from biological data.",
                      skills:
                          "Machine learning, statistics, and programming expertise",
                    ),
                    _buildCareerCard(
                      title: "Bioinformatics Consultant",
                      description:
                          "Provide expertise to organizations on bioinformatics projects and strategies.",
                      skills:
                          "Strong communication skills, project management, and technical knowledge",
                    ),
                    _buildCareerCard(
                      title: "Academic Positions",
                      description:
                          "Teach and conduct research in bioinformatics at universities.",
                      skills:
                          "PhD in a relevant field, strong publication record, teaching experience",
                    ),
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),
                    Text(
                      "Events & Conferences",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    _buildEventCard(
                      title:
                          "International Conference on Bioinformatics, Biomedicine, Biotechnology and Computational Biology (EUIC3BCB)",
                      location: "Suez, Egypt | November 12-13, 2025",
                      description:
                          "A forum for presentation and discussion on Bioinformatics, Biomedicine, Biotechnology and Computational Biology.",
                      url: "http://eurasiaweb.com/Conference/50483/EUIC3BCB/",
                    ),
                    _buildEventCard(
                      title:
                          "International Conference on Bioinformatics and Biomedical Science",
                      location: "Alexandria, Egypt | September 9, 2025",
                      description:
                          "Opportunity for global participants to share their ideas and experience.",
                      url: "https://www.allconferencealert.com/event/1598255",
                    ),
                    _buildEventCard(
                      title:
                          "International Conference on Bioinformatics, Computational Biology and Bioengineering",
                      location: "Cairo, Egypt | December 25, 2025",
                      description:
                          "A platform for researchers and practitioners from academia and industry to share developments in the field.",
                      url:
                          "https://allconferencealert.net/zh/eventdetails.php?id=3298752",
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
    required String title,
    required String location,
    required String description,
    required String url,
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
            SizedBox(height: 4.h),
            Text(
              location,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              description,
              style: TextStyle(
                fontSize: 14.sp,
                height: 1.5,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 12.h),
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
    );
  }
}
