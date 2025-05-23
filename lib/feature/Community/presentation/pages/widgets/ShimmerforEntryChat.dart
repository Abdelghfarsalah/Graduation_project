import 'package:flutter/material.dart';

class FullChatShimmer extends StatelessWidget {
  const FullChatShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // صورة الخلفية
          Positioned.fill(
            child: Image.asset(
              "assets/community/d36bcceceaa1d390489ec70d93154311.jpg",
              fit: BoxFit.cover,
            ),
          ),

          // طبقة شبه شفافة عشان الشيمر يبان
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),

          // المحتوى الرئيسي
          // Column(
          //   children: [
          //     // AppBar الحقيقي خارج الشيمر
          //     Container(
          //       color: const Color(0xFF0B1014),
          //       padding:
          //           EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          //       child: Container(
          //         height: 56.h,
          //         padding: EdgeInsets.symmetric(horizontal: 16.w),
          //         alignment: Alignment.centerLeft,
          //         child: Row(
          //           children: [
          //             IconButton(
          //                 onPressed: () {},
          //                 icon: Icon(
          //                   Icons.menu,
          //                   color: Colors.white,
          //                 )),
          //             Shimmer.fromColors(
          //               baseColor: Colors.grey.shade300,
          //               highlightColor: Colors.grey.shade100,
          //               child: Container(
          //                 width: 44.r, // القطر = 2 × radius
          //                 height: 44.r,
          //                 decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   shape: BoxShape.circle,
          //                 ),
          //               ),
          //             ),
          //             SizedBox(width: 12.w),
          //             Text(
          //               "Loading...",
          //               style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 16.sp,
          //                 fontWeight: FontWeight.w500,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),

          //     // الرسائل بالشيمر
          //     Expanded(
          //       child: Shimmer.fromColors(
          //           baseColor: Colors.grey.shade300.withOpacity(0.7),
          //           highlightColor: Colors.grey.shade100.withOpacity(0.7),
          //           child: ShimmerLoadingMessages()),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
