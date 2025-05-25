import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

class Downloadavatarimge extends StatefulWidget {
  const Downloadavatarimge({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  State<Downloadavatarimge> createState() => _DownloadavatarimgeState();
}

class _DownloadavatarimgeState extends State<Downloadavatarimge> {
  final LoadingButtonController _btnController = LoadingButtonController();

  Future<void> downloadAndSave() async {
    try {
      final response = await Dio().get(
        widget.imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );
      Uint8List imageBytes = Uint8List.fromList(response.data);

      await Gal.putImageBytes(imageBytes, name: '');
      _btnController.success();
      _btnController.reset();
    } catch (e) {
      _btnController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.2,
      child: LoadingButton(
        primaryColor: Colors.white,
        // child: const Text('Download the image'),
        iconData: Icons.download,
        valueColor: appColor.Primarycolor,
        iconColor: Colors.black,
        onPressed: () => downloadAndSave(),
        successColor: Colors.white,
        controller: _btnController,
      ),
    );
  }
}
