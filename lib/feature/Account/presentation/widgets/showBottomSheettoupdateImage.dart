import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/feature/Account/presentation/manager/update_avatar/update_avatar_bloc.dart';
import 'package:graduation_project/feature/Account/presentation/manager/update_avatar/update_avatar_event.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Custom_button.dart';
import 'package:image_picker/image_picker.dart';

class Showbottomsheettoupdateimage extends StatefulWidget {
  const Showbottomsheettoupdateimage({super.key});

  @override
  State<Showbottomsheettoupdateimage> createState() =>
      _ShowbottomsheettoupdateimageState();
}

class _ShowbottomsheettoupdateimageState
    extends State<Showbottomsheettoupdateimage> {
  XFile? _selectedImage;

  Future<void> pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _selectedImage = image; // تخزين الصورة هنا
      });
    }
  }

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image; // تخزين الصورة هنا
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 5,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[300]),
              ),
            ),
          ),
          SizedBox(
            height: 5.w,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 5.w,
              ),
              // Text(
              //   "Select image",
              //   style: TextStyle(
              //     fontSize: 12, // حجم خط أكبر
              //     fontWeight: FontWeight.bold, // خط عريض
              //     color: Colors.blueAccent, // لون أزرق جذاب
              //     letterSpacing: 1.2, // تباعد بين الحروف
              //     shadows: [
              //       // ظل بسيط للنص
              //       Shadow(
              //         offset: Offset(1, 1),
              //         blurRadius: 3.r,
              //         color: Colors.black26,
              //       ),
              //     ],
              //   ),
              //   textAlign: TextAlign.center, // توسيط النص
              // ),
              // Spacer(),
              GestureDetector(
                onTap: () async {
                  await pickImageFromGallery();
                },
                child: Container(
                  height: 35.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.w,
                        color: Colors.blue.withOpacity(0.5),
                      ),
                      // color: Colors.blue.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Icon(
                      Icons.photo,
                      color: Colors.greenAccent,
                      size: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              GestureDetector(
                onTap: () async {
                  await pickImageFromCamera();
                },
                child: Container(
                  height: 35.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.w,
                        color: Colors.blue.withOpacity(0.5),
                      ),
                      // color: Colors.blue.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.camera,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Spacer(),
          _selectedImage == null
              ? Container(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: appColor.Primarycolor),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[100]),
                  child: Center(
                    child: Text("Select image to appear here"),
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(
                    File(_selectedImage!.path),
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
          Spacer(),
          CustomButton(
              onTap: () async {
                Navigator.pop(context);
                context
                    .read<UpdateAvatarBloc>()
                    .add(updateAvatar(imageFile: File(_selectedImage!.path)));
              },
              color: appColor.Primarycolor,
              width: MediaQuery.sizeOf(context).width * 0.9,
              text: "Update Image",
              endcolor: appColor.Primarycolor,
              borderRadius: 20),
          Spacer(),
        ],
      ),
    );
  }
}
