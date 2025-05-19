import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
  // _saveNetworkImage() async {
  //   try {
  //     // Saved with this method.
  //     var imageId = await ImageDownloader.downloadImage(
  //         "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter.png");
  //     if (imageId == null) {
  //       return;
  //     }

  //     // Below is a method of obtaining saved image information.
  //     var fileName = await ImageDownloader.findName(imageId);
  //     var path = await ImageDownloader.findPath(imageId);
  //     var size = await ImageDownloader.findByteSize(imageId);
  //     var mimeType = await ImageDownloader.findMimeType(imageId);
  //   } on PlatformException catch (error) {
  //     print(error);
  //   }
  // }

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
      body: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          // height: MediaQuery.sizeOf(context).height * 0.5,
          child: Center(
            child: PhotoView(
              imageProvider: CachedNetworkImageProvider(widget.imageUrl),
              backgroundDecoration: const BoxDecoration(
                color: Colors.black,
              ),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 3.0,
            ),
          ),
        ),
      ),
    );
  }
}
