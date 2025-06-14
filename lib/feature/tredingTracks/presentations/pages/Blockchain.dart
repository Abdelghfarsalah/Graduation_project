import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/recommendchatPage.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/widgets/createRoadmapBotton.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BlockchainPage extends StatefulWidget {
  const BlockchainPage({super.key});

  @override
  State<BlockchainPage> createState() => _BlockchainPageState();
}

class _BlockchainPageState extends State<BlockchainPage> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: 'QphJEO9ZX6s',
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
                "assets/tredingTracks/Blockchain/image1.png",
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.darken,
              ),
              title: Text(
                "Blockchain Technology",
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
                      title: "Blockchain Technology",
                      content:
                          "Blockchain technology is a structure that stores transactional records, also called block, of the public in several databases, known as the 'chain,' in a network connected through peer-to-peer nodes. We cannot change or take away the data; we can only add to it. It is a method of recording information that makes hacking or manipulation of the systems impossible.",
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "This is a secure technology that is used in systems like cryptocurrency and bitcoin. Today, industry giants like Mastercard and IBM are adopting blockchain for supply chains and payments. Blockchain expands its application to voting, healthcare, and the metaverse while focusing on sustainability. From AI integration to Central Bank Digital Currencies (CBDCs), the future of blockchain technology is tied to useful real-world solutions and a wide range of other applications.",
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
                          "This field offers plenty of career opportunities with high salary packages. For example, a blockchain developer can earn a salary of up to Rs 20 lakh per year. Some of the other career opportunities in this field include:",
                    ),
                    SizedBox(height: 16.h),
                    _buildCareerCard(
                      title: "Blockchain Developer",
                      description:
                          "Build and maintain blockchain protocols, smart contracts, and decentralized apps (DApps).",
                      skills:
                          "Solidity, Python, JavaScript, cryptography, smart contracts",
                    ),
                    _buildCareerCard(
                      title: "Blockchain Architect",
                      description:
                          "Design secure and scalable blockchain systems for businesses.",
                      skills:
                          "System design, cloud computing, consensus algorithms (PoW/PoS)",
                    ),
                    _buildCareerCard(
                      title: "Smart Contract Developer",
                      description:
                          "Write self-executing contracts for DeFi, NFTs, and DAOs.",
                      skills:
                          "Solidity, Vyper, Ethereum tools (Truffle, Hardhat)",
                    ),
                    _buildCareerCard(
                      title: "Blockchain Analyst",
                      description:
                          "Analyze blockchain data for trends, security, and business insights.",
                      skills:
                          "Data analysis, Python, SQL, blockchain explorers",
                    ),
                    _buildCareerCard(
                      title: "Crypto Community Manager",
                      description:
                          "Engage and grow online communities for blockchain projects.",
                      skills:
                          "Social media (Discord/Telegram), crypto knowledge, communication",
                    ),
                    _buildCareerCard(
                      title: "Blockchain Consultant",
                      description:
                          "Advise companies on blockchain integration and strategy.",
                      skills:
                          "Business analysis, industry-specific blockchain use cases",
                    ),
                    _buildCareerCard(
                      title: "Blockchain Security Engineer",
                      description:
                          "Protect blockchain networks from hacks and vulnerabilities.",
                      skills:
                          "Cybersecurity, penetration testing, cryptography",
                    ),
                    _buildCareerCard(
                      title: "DeFi/NFT Developer",
                      description:
                          "Build platforms for decentralized finance or NFT marketplaces.",
                      skills: "Web3.js, Ethereum, Rust (for Solana), IPFS",
                    ),
                    _buildCareerCard(
                      title: "Blockchain Project Manager",
                      description:
                          "Oversee blockchain projects from development to deployment.",
                      skills:
                          "Agile/Scrum, team coordination, blockchain basics",
                    ),
                    _buildCareerCard(
                      title: "Cryptocurrency Trader/Analyst",
                      description: "Analyze crypto markets and execute trades.",
                      skills:
                          "Financial analysis, trading tools (e.g., Coinbase Pro), risk management",
                    ),
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),
                    Text(
                      "Events & Conferences in Egypt (2025)",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    _buildHackathonCard(
                      image: "assets/tredingTracks/Blockchain/download.png",
                      title:
                          "International Conference on Blockchain Technology and Applications (ICBTA)",
                      organizer: "Alexandria, Egypt",
                      description:
                          "Focuses on blockchain technology and applications. Held on May 16th, 2025.",
                      prize: "May 16th, 2025 in Alexandria",
                      url: "https://globalconference.co/Conference/3700/ICBTA/",
                    ),
                    _buildHackathonCard(
                      image: "assets/tredingTracks/Blockchain/image2.png",
                      title:
                          "ISBCom25: 2nd International Conference on Intelligent Systems, Blockchain, and Communication Technologies",
                      organizer: "Egypt",
                      description:
                          "A platform for researchers, experts, and innovators in intelligent systems, blockchain, and communication technologies.",
                      prize: "Various dates in 2025",
                      url: "https://www.isbcomtech.com/",
                    ),
                    _buildHackathonCard(
                      image: "assets/tredingTracks/Blockchain/image3.png",
                      title: "Blockchain Summit Code-a-Thon",
                      organizer: "American University in Cairo",
                      description:
                          "A competition where students developed their own blockchain applications.",
                      prize: "Cairo, Egypt (American University in Cairo)",
                      url:
                          "https://www.aucegypt.edu/news/blockchain-competition-and-implementation",
                    ),
                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey[300], height: 1),
                    SizedBox(height: 24.h),
                    Text(
                      "Future Blockchain Events",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    _buildHackathonCard(
                      image: "assets/tredingTracks/Blockchain/image4e.png",
                      title: "Future Blockchain Summit",
                      organizer: "GITEX Global",
                      description:
                          "One of the largest blockchain events in the Middle East, featuring top projects and government-backed Web3 initiatives.",
                      prize: "October 2025 in Dubai, UAE",
                      url: "https://www.bitcoin.com/conferences/middle-east/",
                    ),
                    _buildHackathonCard(
                      image: "assets/tredingTracks/Blockchain/image5e.png",
                      title: "Global Blockchain Congress",
                      organizer: "UAE Blockchain Foundation",
                      description:
                          "An exclusive, by-invitation-only congress connecting blockchain innovators with pre-qualified investors.",
                      prize: "October 30th & 31st, 2025 in Dubai, UAE",
                      url: "https://www.gbc-uae.com/",
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
                text: "Blockchain Technology",
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
              "Role: $description",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Skills: $skills",
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
                  "Location: $organizer",
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
                      Icon(Icons.calendar_today,
                          color: Colors.blue[700], size: 20.w),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          "Dates: $prize",
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
