import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class TrackDetailsLoading extends StatelessWidget {
  const TrackDetailsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.h,
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                color: Colors.grey[300],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerBox(height: 24.h, width: 180.w), // Title
                  SizedBox(height: 16.h),
                  _shimmerBox(height: 16.h, width: double.infinity),
                  SizedBox(height: 10.h),
                  _shimmerBox(height: 16.h, width: double.infinity),
                  SizedBox(height: 10.h),
                  _shimmerBox(height: 16.h, width: 250.w),
                  SizedBox(height: 32.h),
                  _shimmerBox(height: 24.h, width: 200.w), // Section title
                  SizedBox(height: 16.h),
                  ...List.generate(2, (index) => _shimmerRoadmapCard()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _shimmerBox({required double height, required double width}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }

  Widget _shimmerRoadmapCard() {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                height: 16.h,
                width: 180.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
