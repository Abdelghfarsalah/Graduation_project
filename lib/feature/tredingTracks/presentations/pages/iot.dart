import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class IoTDevelopmentPage extends StatefulWidget {
  const IoTDevelopmentPage({super.key});

  @override
  State<IoTDevelopmentPage> createState() => _IoTDevelopmentPageState();
}

class _IoTDevelopmentPageState extends State<IoTDevelopmentPage> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: 'GIfWNtMfYvk',
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
                "assets/tredingTracks/iot/image1.png",
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.darken,
              ),
              title: Text(
                "Internet of Things (IoT)",
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
                      title: "Internet of Things (IoT)",
                      content:
                          "The Internet of Things (IoT) encompasses a network of devices equipped with sensors, processing capabilities, and software, facilitating seamless communication and data exchange with other devices and systems through the Internet or communication networks. The field's development stems from the convergence of technologies such as ubiquitous computing, which integrates computing capabilities into everyday objects; readily available sensors for real-time data collection; powerful embedded systems enabling local data processing; and the integration of machine learning for adaptive and informed decision-making. This transformative paradigm enhances efficiency, automation, and decision-making across diverse industries, promising continued innovation and positive impacts on daily life.",
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
                          "To build a career in this field, you must be aware of the basics of AI and machine learning, information security, hardware interfacing, networking, data analytics, automation, and embedded systems. Some of the career options that are available in this field are:",
                    ),
                    SizedBox(height: 16.h),
                    _buildCareerCard(
                      title: "IoT Security Engineer",
                      description:
                          "Secure IoT devices, networks, and data from cyber threats.",
                      skills:
                          "Cybersecurity principles (encryption, PKI, zero-trust), IoT protocols (MQTT, CoAP, Zigbee), Vulnerability assessment & penetration testing, Secure firmware development, Compliance (NIST, ISO 27001, GDPR)",
                    ),
                    _buildCareerCard(
                      title: "IoT Platform Developer",
                      description:
                          "Develop and maintain cloud/edge platforms for IoT data processing and management.",
                      skills:
                          "Cloud platforms (AWS IoT Core, Azure IoT Hub, Google Cloud IoT), Backend development (Node.js, Python, Java), Database management (Time-series DBs like InfluxDB, MongoDB), API design (REST, WebSockets), Edge computing integration",
                    ),
                    _buildCareerCard(
                      title: "IoT Embedded Engineer",
                      description:
                          "Design and program firmware for IoT devices and sensors.",
                      skills:
                          "Embedded C/C++, RTOS (FreeRTOS, Zephyr), Microcontroller programming (ARM Cortex, ESP32, Raspberry Pi), Low-power wireless protocols (BLE, LoRaWAN, NB-IoT), Hardware debugging (JTAG, oscilloscopes), PCB basics (schematic review, power optimization)",
                    ),
                    _buildCareerCard(
                      title: "IoT Architect",
                      description:
                          "Design end-to-end IoT solutions, bridging hardware, software, and cloud systems.",
                      skills:
                          "System architecture design (scalability, fault tolerance), IoT communication protocols (MQTT, AMQP, OPC UA), Cloud/edge computing strategies, Data pipeline design (streaming, batch processing), Cross-domain knowledge (hardware, networking, security, analytics)",
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
                      image:
                          "assets/tredingTracks/iot/image2.png", // Added image
                      title: "Cairo ICT",
                      location: "Cairo, Egypt, November 2025",
                      description:
                          "A major technology event in the Middle East and Africa showcasing the latest advancements, potentially including IoT.",
                      url: "https://cairoict.com/",
                    ),
                    _buildEventCard(
                      image:
                          "assets/tredingTracks/iot/image3.png", // Added image
                      title: "FutureNet Middle East & North Africa",
                      location: "Various locations",
                      description:
                          "A network automation and AI event that discusses IoT's role in the digital world.",
                      url:
                          "https://futurenetworld.net/events/futurenet-middle-east-north-africa-2025/",
                    ),
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),
                    Text(
                      "Competitions",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    _buildCompetitionCard(
                      image:
                          "assets/tredingTracks/iot/image4.png", // Added image
                      title: "Arab IoT & AI Challenge",
                      description:
                          "A regional program for students and startups with innovative ideas in IoT and AI. Local challenges in several countries (including Egypt, Oman, Palestine, Saudi Arabia, Tunisia, and the UAE) qualify winners for the regional finals.",
                      url: "https://arabiotai.org/",
                    ),
                    _buildCompetitionCard(
                      image:
                          "assets/tredingTracks/iot/image5.png", // Added image
                      title: "Egypt IoT & AI Challenge",
                      description:
                          "Egypt IoT & AI Challenge is a Nationwide Program for Senior University Students, Startups, and STEM School Students That Have Innovative Ideas in the Area of Internet of Things (IoT), Artificial Intelligence (AI).",
                      url: "https://egypt.arabiotai.org/",
                    ),
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),
                    Text(
                      "Hackathons",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    _buildHackathonCard(
                      title: "Egypt AI Hackathon",
                      organizer: "E-Tech Summit",
                      description:
                          "A platform for university students to use AI and IoT for sustainable change.",
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
    required String image,
    required String title,
    required String location,
    required String description,
    required String url,
  }) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 16.h),
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
              height: 120.h,
              width: double.infinity,
              fit: BoxFit.cover,
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
        ],
      ),
    );
  }

  Widget _buildCompetitionCard({
    required String image,
    required String title,
    required String description,
    required String url,
  }) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 16.h),
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
              height: 120.h,
              width: double.infinity,
              fit: BoxFit.cover,
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
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[900],
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
        ],
      ),
    );
  }

  Widget _buildHackathonCard({
    required String title,
    required String organizer,
    required String description,
    required String prize,
    required String url,
  }) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 24.h),
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
              "Organized by: $organizer",
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
    );
  }
}
