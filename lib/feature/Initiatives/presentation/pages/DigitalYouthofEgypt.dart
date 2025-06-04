import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/feature/Initiatives/presentation/widgets/widgettoplayVideo.dart';
import 'package:url_launcher/url_launcher.dart';

class DigitalYouthOfEgypt extends StatefulWidget {
  const DigitalYouthOfEgypt({super.key});

  @override
  State<DigitalYouthOfEgypt> createState() => _DigitalYouthOfEgyptState();
}

class _DigitalYouthOfEgyptState extends State<DigitalYouthOfEgypt> {
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
            expandedHeight: 180.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/Initiatives/image3.png",
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.8),
                colorBlendMode: BlendMode.darken,
              ),
              title: Text(
                "Digital Youth of Egypt",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
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
                    // Initiative Logo
                    Center(
                      child: Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.grey[300]!, width: 1),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/Initiatives/image3.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),

                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),

                    // About the Initiative
                    _buildSection(
                      title: "About the Initiative",
                      content:
                          "A fully-funded four-month scholarship targeting the qualification of 2,500 fresh graduates from Egyptian universities across the country. The initiative offers training in diverse digital fields, with a strong focus on electronics and embedded systems, aligning with the presidential initiative \"Egypt Makes Electronics.\"\n\n"
                          "It aims to boost youth employment and entrepreneurship opportunities, bridge the skills gap between graduates and market demands, and develop both technical and personal skills through a comprehensive methodology covering a wide range of digital competencies to serve various career paths.",
                    ),

                    // Benefits Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Program Structure",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[900],
                          ),
                        ),
                        SizedBox(height: 12.h),
                        _buildBulletPoint(
                            "Three-month technical training in digital skills."),
                        _buildBulletPoint(
                            "Training on personal development and English language."),
                        _buildBulletPoint(
                            "One-month on-the-job training provided by 60+ partner companies."),
                        _buildBulletPoint(
                            "Covers tracks like: electronics and embedded systems, network infrastructure, cybersecurity, DevOps, and telecom engineering."),
                      ],
                    ),

                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),
                    Text(
                      "Introductory Video",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    CustomVideoPlayer(
                      assetPath: 'assets/Initiatives/videos/DYI1.mp4',
                    ),
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),
                    // Links Section
                    // Text(
                    //   "Important Links",
                    //   style: TextStyle(
                    //     fontSize: 18.sp,
                    //     fontWeight: FontWeight.w600,
                    //     color: Colors.grey[900],
                    //   ),
                    // ),
                    // SizedBox(height: 16.h),
                    // _buildLinkTile(
                    //   icon: Icons.language,
                    //   title: "Official Website",
                    //   url: "https://www.nti.sci.eg/",
                    // ),
                    // _buildLinkTile(
                    //   icon: Icons.ondemand_video,
                    //   title: "Introductory Video",
                    //   url: "https://www.facebook.com/watch/?v=954974122304829",
                    // ),

                    SizedBox(height: 32.h),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => _launchURL("https://www.nti.sci.eg/"),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          side: BorderSide(color: Colors.grey[800]!),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "APPLY NOW",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[900],
                            letterSpacing: 1.2,
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
            child: Container(
              width: 6.w,
              height: 6.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[700],
              ),
            ),
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

  Widget _buildLinkTile({
    required IconData icon,
    required String title,
    required String url,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!, width: 1),
        ),
      ),
      child: InkWell(
        onTap: () => _launchURL(url),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Row(
            children: [
              Icon(icon, color: Colors.grey[600], size: 22.w),
              SizedBox(width: 16.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey[800],
                ),
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios,
                  size: 16.w, color: Colors.grey[500]),
            ],
          ),
        ),
      ),
    );
  }
}
