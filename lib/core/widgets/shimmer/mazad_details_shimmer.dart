import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class MazadDetailsShimmer extends StatelessWidget {
  const MazadDetailsShimmer({super.key});

  Widget shimmerBox({
    double height = 20,
    double width = double.infinity,
    EdgeInsets? margin,
  }) {
    return Shimmer(
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            shimmerBox(
              height: 20,
              width: 180,
              margin: const EdgeInsets.symmetric(horizontal: 41, vertical: 8),
            ),

            const SizedBox(height: 8),
            Shimmer(
              child: Container(
                height: 200,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 8),
            shimmerBox(
              height: 18,
              width: 120,
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),

            const SizedBox(height: 8),
            shimmerBox(
              height: 18,
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
            const SizedBox(height: 4),
            shimmerBox(
              height: 18,
              width: 160,
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),

            const SizedBox(height: 4),
            shimmerBox(
              height: 18,
              width: 100,
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),

            const SizedBox(height: 4),
            shimmerBox(
              height: 18,
              width: 140,
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),

            const SizedBox(height: 4),
            shimmerBox(
              height: 18,
              width: 110,
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),

            const SizedBox(height: 8),
            shimmerBox(
              height: 18,
              width: 100,
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),

            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  shimmerBox(height: 18, width: 80),
                  const Spacer(),
                  Shimmer(
                    child: Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),
            shimmerBox(
              height: 20,
              width: 140,
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),

            const SizedBox(height: 12),
            shimmerBox(
              height: 20,
              width: 180,
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),

            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: List.generate(5, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: shimmerBox(height: 14),
                  );
                }),
              ),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
