import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class FWD extends StatefulWidget {
  const FWD({super.key});

  @override
  State<FWD> createState() => _FWDState();
}

class _FWDState extends State<FWD> {
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
                "assets/Initiatives/image.png", // عدل اسم الصورة حسب الموجود عندك
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.8),
                colorBlendMode: BlendMode.darken,
              ),
              title: Text(
                "Future Work is Digital (FWD)",
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
                            "assets/Initiatives/image.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),

                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),

                    // About the Program
                    _buildSection(
                      title: "About the FWD Initiative",
                      content:
                          "Future Work is Digital (FWD) is an 18-month initiative offering multiple scholarships that provide learners and trainees with a comprehensive educational experience to develop their skills and build their capabilities. "
                          "Through the scholarship program, learners can attend courses offered by Udacity online classes, engage in practical projects reviewed by experts, participate in online support webinars, receive continuous coaching and mentoring by industry professionals, "
                          "and enhance their networking with peers via an interactive community and ongoing training and job opportunities.",
                    ),

                    _buildSection(
                      title: "Program Goals",
                      content:
                          "The FWD scholarship aims to empower learners by improving their technological and professional development skills to enable them to successfully compete for jobs in the digital business field and freelancing opportunities provided by leading tech companies worldwide.",
                    ),

                    // Benefits
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Benefits of Joining Future Work is Digital",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[900],
                          ),
                        ),
                        SizedBox(height: 12.h),
                        _buildBulletPoint(
                            "Technical training offering technology-based courses in the most in-demand fields: Web (design & development), data, business, and cloud computing, tailored for all professional levels."),
                        _buildBulletPoint(
                            "Job readiness training including full training on digital freelancing, Agile methodologies, and professional consulting."),
                        _buildBulletPoint(
                            "Access to many job opportunities, training for freelancing or employment in tech fields."),
                      ],
                    ),

                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),

                    // Important Links
                    Text(
                      "Important Links",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    _buildLinkTile(
                      icon: Icons.language,
                      title: "Official Website",
                      url:
                          "https://www.itida.gov.eg/arabic/Programs/future-work-is-digital/Pages/default.aspx",
                    ),
                    _buildLinkTile(
                      icon: Icons.play_circle_outline,
                      title: "Introductory Video",
                      url: "https://youtu.be/bwcUd8xja6A?si=l6XY3RnwTuFPDXVC",
                    ),
                    _buildLinkTile(
                      icon: Icons.play_circle_outline,
                      title: "Student Testimonials",
                      url: "https://youtu.be/n4PgOM4H2cg?si=_OKzowtBFWbSLGGY",
                    ),

                    // Apply Button
                    SizedBox(height: 32.h),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => _launchURL(
                            "https://www.itida.gov.eg/arabic/Programs/future-work-is-digital/Pages/default.aspx"),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          side: BorderSide(color: Colors.grey[800]!),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "LEARN MORE",
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
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios,
                  size: 16.w, color: Colors.grey[500]),
            ],
          ),
        ),
      ),
    );
  }
}
