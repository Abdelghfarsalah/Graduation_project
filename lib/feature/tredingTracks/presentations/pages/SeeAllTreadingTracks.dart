import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/widgets/leftTredingTracks.dart';
import 'package:graduation_project/feature/tredingTracks/presentations/widgets/rightTredingtarcks.dart';

class AllTrendingTracks extends StatelessWidget {
  const AllTrendingTracks({super.key});

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
                "assets/tredingTracks/AiAndML/modern-abstract-template-design-meets-260nw-2464251429.jpg",
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.darken,
              ),
              title: Text(
                "Trending Tracks",
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
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24.w,
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Lefttredingtracks(), Righttredingtarcks()],
            ),
          )
        ],
      ),
    );
  }
}
