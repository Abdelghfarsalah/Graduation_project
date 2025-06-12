import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProgressShimmerPage extends StatelessWidget {
  const ProgressShimmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "Your Progress" title
            Container(height: 24, width: 120, color: Colors.grey),
            const SizedBox(height: 16),

            // Circle + percent
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 16, width: 160, color: Colors.grey),
                      const SizedBox(height: 8),
                      Container(height: 16, width: 120, color: Colors.grey),
                      const SizedBox(height: 8),
                      Container(
                          height: 40,
                          width: double.infinity,
                          color: Colors.grey),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // "Sections Progress" title
            Container(height: 24, width: 160, color: Colors.grey),
            const SizedBox(height: 16),

            // Fake bars (5 sections)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                return Container(
                  height: 100,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              }),
            ),
            const SizedBox(height: 32),
            Container(
              height: 60,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 32),
            Container(
              height: 60,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
