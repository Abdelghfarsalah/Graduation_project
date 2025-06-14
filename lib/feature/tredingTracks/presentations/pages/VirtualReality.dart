import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/recommendchatPage.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/widgets/createRoadmapBotton.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VirtualRealityPage extends StatefulWidget {
  const VirtualRealityPage({super.key});

  @override
  State<VirtualRealityPage> createState() => _AIHackathonsPageState();
}

class _AIHackathonsPageState extends State<VirtualRealityPage> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: 'Z_0iFPRYAbI',
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
                "assets/tredingTracks/VirtualReality/image1.png",
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.darken,
              ),
              title: Text(
                "Virtual Reality",
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
                      title: "Virtual Reality",
                      content:
                          "Virtual reality (VR) technology has experienced an increase in popularity, creating computer generated environments that closely resemble the real world. In the gaming industry, VR offers a transformative experience by transporting players into immersive virtual worlds. Virtual reality headsets, such as the Oculus Quest 2 and HP Reverb G2, have gained popularity because of their way of enhancing user engagement and providing a sense of being present in the virtual world.",
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Apart from entertainment, virtual reality is becoming popular in the field of medical education. Healthcare professionals can utilize VR simulations to practice and improve their skills in a risk-free and controlled environment. For example, surgeons can perform virtual surgeries to practice their techniques before operating on real patients. This not only improves the proficiency of medical practitioners but also promotes patient safety. The potential applications across industries are expected to grow as VR hardware and software continue to advance, opening up new possibilities for training, education, and entertainment.",
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
                          "Building a career in this field does not require specialized knowledge. One can start with a basic knowledge of programming. Some of the career options in the field of this technology are:",
                    ),

                    SizedBox(height: 16.h),
                    _buildCareerCard(
                      title: "Virtual Reality (VR) Developer",
                      description:
                          "Create 3D virtual environments and experiences",
                      skills:
                          "Unity/Unreal Engine, C# programming, 3D modeling basics, VR hardware knowledge (Oculus, HTC Vive)",
                    ),

                    _buildCareerCard(
                      title: "Unity Developer",
                      description:
                          "Build games and applications using Unity engine",
                      skills:
                          "Unity development, C# programming, Physics and animation systems, Multiplatform deployment",
                    ),

                    _buildCareerCard(
                      title: "Augmented Reality (AR) Developer",
                      description:
                          "Develop apps that overlay digital content on the real world",
                      skills:
                          "ARKit (iOS) or ARCore (Android), Unity/Unreal development, Mobile development (Swift, Kotlin), Computer vision basics",
                    ),

                    _buildCareerCard(
                      title: "AR Cloud Developer",
                      description:
                          "Build persistent AR experiences shared across devices",
                      skills:
                          "Cloud computing (AWS, Azure), Spatial computing, Multi-user synchronization, SLAM (Simultaneous Localization and Mapping) technology",
                    ),

                    // Divider
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),

                    // VR Experiences Section
                    Text(
                      "VR Experiences",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Experience 1
                    _buildHackathonCard(
                      image: "assets/tredingTracks/VirtualReality/image2.png",
                      title:
                          "Virtual Reality Shows of Ancient Egypt by Sound and Light Show Company",
                      organizer: "Sound and Light Show Company",
                      description:
                          "Immersive VR experiences bringing ancient Egyptian wonders to life.",
                      prize: "Various hotel booths in Egypt",
                      url:
                          "https://www.soundandlight.show/en/virtual-reality-show",
                    ),

                    // Experience 2
                    _buildHackathonCard(
                      image: "assets/tredingTracks/VirtualReality/image3.png",
                      title:
                          "Horizon of Khufu: An Immersive VR Expedition to Ancient Egypt",
                      organizer: "Fever",
                      description:
                          "A VR experience that takes you back to ancient Egypt to explore the Great Pyramid of Giza",
                      prize: "London, New York, Montreal, Calgary",
                      url: "https://feverup.com/m/151257",
                    ),

                    // Divider
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),

                    // Competitions Section
                    Text(
                      "Competitions",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Competition 1
                    _buildHackathonCard(
                      image: "assets/tredingTracks/VirtualReality/image4.png",
                      title: "Games of the Future 2025",
                      organizer: "Abu Dhabi National Exhibition Center",
                      description:
                          "Features phygital sporting competitions with virtual reality immersive fan engagement zones.",
                      prize:
                          "December 18-23, 2025 at Abu Dhabi National Exhibition Center (ADNEC)",
                      url:
                          "https://www.prnewswire.com/ae/news-releases/abu-dhabi-confirmed-as-host-city-for-games-of-the-future-2025-302468087.html",
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
                text: "Virtual Reality",
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

  // Widget _buildBulletPoint(String text) {
  //   return Padding(
  //     padding: EdgeInsets.only(bottom: 8.h),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.only(top: 6.h, right: 12.w),
  //           child: Icon(Icons.circle, size: 8.w, color: Colors.grey[700]),
  //         ),
  //         Expanded(
  //           child: Text(
  //             text,
  //             style: TextStyle(
  //               fontSize: 15.sp,
  //               height: 1.5,
  //               color: Colors.grey[700],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
                          "Location/Dates: $prize",
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
