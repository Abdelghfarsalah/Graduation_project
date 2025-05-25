import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/DownloadAvatarImge.dart';
import 'package:graduation_project/feature/Community/presentation/pages/displayImage.dart';
import 'package:share_plus/share_plus.dart';
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
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: GestureDetector(
                        onTap: () {
                          Animationsforpages.navigateWithSlidepushfromcenter(
                            context,
                            DisplayImage(
                              imageUrl: imageUrl,
                            ),
                          );
                        },
                        child: CachedNetworkImage(
                          fit: BoxFit.contain,
                          imageUrl: imageUrl,
                          imageBuilder: (context, imageProvider) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                    maxHeight:
                                        MediaQuery.sizeOf(context).height * 0.5,
                                    maxWidth:
                                        MediaQuery.sizeOf(context).width * 0.8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      final text = imageUrl;
                                      Share.share(text);
                                    },
                                    child: Icon(
                                      Icons.share,
                                      size: 30.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Downloadavatarimge(imageUrl: imageUrl),
                                ],
                              )
                            ],
                          ),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              width: 200,
                              height: 200,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error, size: 48),
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
