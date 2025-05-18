import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_downloader/image_downloader.dart';
import 'package:photo_view/photo_view.dart';

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
      // appBar: AppBar(
      //   title: const Text("عرض الصورة"),
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      // ),
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
            top: 50.h,
            left: 20.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
          // Positioned(
          //   bottom: 50.h,
          //   left: MediaQuery.of(context).size.width * 0.4,
          //   child: GestureDetector(
          //     onTap: () {
          //       _saveNetworkImage();
          //     },
          //     child: Container(
          //       height: 60.h,
          //       width: 60.w,
          //       decoration: BoxDecoration(
          //           color: Colors.grey[300],
          //           borderRadius: BorderRadius.all(Radius.circular(20))),
          //       child: const Icon(
          //         Icons.download,
          //         color: Colors.black,
          //         size: 20,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
