import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/Community/presentation/pages/displayImage.dart';
import 'package:shimmer/shimmer.dart';

class CustomDialogForAccountAvatar {
  static void showCustomImageDialog(BuildContext context, String imageUrl) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (context, animation, secondaryAnimation) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pop(), // إغلاق عند الضغط بالخارج
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  // خلفية ضبابية
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(color: Colors.black.withOpacity(0)),
                  ),
                  // الصورة فقط في المنتصف
                  Center(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      child: GestureDetector(
                        onTap: () {
                          Animationsforpages.navigateWithSlidepushfromcenter(
                            context,
                            DisplayImage(
                              imageUrl: imageUrl,
                            ),
                          );
                        },
                        child: ClipOval(
                          // ✅ هذا هو المهم لجعل الصورة دائرية
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: 200,
                                height: 200,
                                color: Colors.white,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error, size: 48),
                            fit: BoxFit.cover, // أفضل تغطية داخل الشكل الدائري
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
