import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gal/gal.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
// import 'package:image_downloader/image_downloader.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';

class DisplayImage extends StatefulWidget {
  final String imageUrl;

  const DisplayImage({super.key, required this.imageUrl});

  @override
  State<DisplayImage> createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {
  final LoadingButtonController _btnController = LoadingButtonController();
  Future<void> downloadAndSave() async {
    try {
      final response = await Dio().get(
        widget.imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );
      Uint8List imageBytes = Uint8List.fromList(response.data);

      await Gal.putImageBytes(imageBytes, name: 'downloaded_image');
      _btnController.success();
      _btnController.reset();
    } catch (e) {
      _btnController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.3),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
          ),
          title: GestureDetector(
            onTap: () {
              Share.shareUri(Uri.parse(widget.imageUrl));
            },
            child: const Icon(
              Icons.share,
              color: Colors.white,
              size: 20,
            ),
          )),
      body: Stack(
        children: [
          Center(
            child: PhotoView(
              imageProvider: CachedNetworkImageProvider(widget.imageUrl),
              backgroundDecoration: const BoxDecoration(
                color: Colors.black,
              ),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 3.0,
            ),
          ),
          Positioned(
              bottom: 50.h,
              left: MediaQuery.sizeOf(context).width * 0.2,
              child: LoadingButton(
                primaryColor: Colors.black.withOpacity(0.3),
                child: const Text('Download the image'),
                iconData: Icons.download,
                valueColor: Colors.greenAccent,
                iconColor: Colors.lightGreen,
                onPressed: () => downloadAndSave(),
                successColor: Colors.lightGreen,
                controller: _btnController,
              ))
        ],
      ),
    );
  }
}
