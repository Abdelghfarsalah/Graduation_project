// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
// import 'package:graduation_project/feature/Community/data/models/groupsmodel.dart';
// import 'package:graduation_project/feature/Community/domain/modelCommunity/MessageModel.dart';
// import 'package:graduation_project/feature/Community/presentation/pages/widgets/ShimmerLoadingMessages.dart';
// import 'package:graduation_project/feature/Community/presentation/pages/widgets/messagetile.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class Communitybody extends StatefulWidget {
//   const Communitybody({super.key, required this.group, required this.socket});
//   final Group group;
//   final IO.Socket socket;
//   @override
//   State<Communitybody> createState() => _CommunitybodyState();
// }

// class _CommunitybodyState extends State<Communitybody> {
//   final TextEditingController _controller = TextEditingController();
//   final ScrollController _scrollController = ScrollController();

//   void scrollToBottom() {
//     if (_scrollController.hasClients) {
//       _scrollController.animateTo(
//         _scrollController.position.maxScrollExtent,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeOut,
//       );
//     }
//   }

//   List<MessageModel> messages = [];
//   File? selectedImage;

//   final Dio dio = Dio();

//   @override
//   void initState() {
//     super.initState();
//     JoinGroup(widget.group.id);
//     fetchAllMessages().then((_) {
//       scrollToBottom(); // ✅ دلوقتي هيشتغل بعد ما الرسائل تتحمّل
//     });
//   }

//   void JoinGroup(String groupId) {
//     widget.socket.emit("joinGroup", groupId);
//     log("${groupId} ++++++++++++++++last++++++++++++++++++++++++");
//     widget.socket.on('newMessage', (data) {
//       if (!mounted) return;
//       setState(() {
//         messages.insert(0, MessageModel.fromJson(data));
//       });
//     });
//   }

//   Future<void> sendMessage(String groupId) async {
//     try {
//       final text = _controller.text.trim();
//       if (text.isEmpty && selectedImage == null) return;

//       final userId = await SharedPreferencesDemo.getUserId();

//       String? base64Image;
//       if (selectedImage != null) {
//         final bytes = await selectedImage!.readAsBytes();
//         base64Image = "data:image/jpeg;base64,${base64Encode(bytes)}";
//       }

//       widget.socket.emit("sendMessage", {
//         'senderId': userId,
//         'groupId': groupId, // <== هنا تمرر الـ groupId
//         'content': text,
//         if (base64Image != null) 'imageBase64': base64Image,
//       });

//       _controller.clear();
//       setState(() {
//         selectedImage = null;
//       });

//       log("✅ Message sent via socket${groupId}");
//     } catch (e, stackTrace) {
//       print("❌ Error sending message: $e");
//       print("🧱 StackTrace: $stackTrace");
//     }
//   }

//   String? lastMessageId;
//   Future<void> fetchAllMessages() async {
//     List<MessageModel> allMessages = [];
//     String? lastMessageId;
//     const int limit = 20; // ممكن تزود الرقم حسب ما السيرفر يسمح
//     try {
//       var authToken = await SharedPreferencesDemo.getToken();
//       while (true) {
//         final response = await dio.get(
//           "http://164.128.130.9:2530/api/v1/message",
//           queryParameters: {
//             'groupId': widget.group.id, // <-- أضف الـ groupId هنا
//             'limit': 20,
//             if (lastMessageId != null) 'lastMessageId': lastMessageId,
//           },
//           options: Options(
//             headers: {
//               'Authorization': 'Bearer $authToken',
//             },
//           ),
//         );
//         if (response.statusCode == 200) {
//           final List<dynamic> jsonMessages = response.data['data']['messages'];
//           final List<MessageModel> fetchedMessages =
//               jsonMessages.map((json) => MessageModel.fromJson(json)).toList();
//           if (fetchedMessages.isEmpty) break;
//           allMessages.addAll(fetchedMessages);
//           lastMessageId = fetchedMessages[fetchedMessages.length - 1].id;
//           if (fetchedMessages.length < limit) break;
//         } else {
//           print("❌ Error fetching messages: ${response.statusCode}");
//           break;
//         }
//       }
//       if (!mounted) return;
//       setState(() {
//         messages = allMessages;
//       });

//       print("✅ Total messages fetched: ${allMessages.length}");
//     } catch (e, s) {
//       print("❗ Exception while fetching all messages: $e\n$s");
//     }
//   }

//   Future<void> pickImage() async {
//     final picker = ImagePicker();
//     final picked = await picker.pickImage(source: ImageSource.gallery);
//     if (picked != null) {
//       setState(() => selectedImage = File(picked.path));
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(
//               fit: BoxFit.fill,
//               image: AssetImage(
//                   "assets/community/d36bcceceaa1d390489ec70d93154311.jpg"))),
//       child: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               controller: _scrollController,
//               reverse: true,
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 if (index == messages.length) {
//                   return ShimmerLoadingMessages();
//                 }
//                 return Messagetile(msg: messages[index]);
//               },
//             ),
//           ),
//           if (selectedImage != null)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20.r),
//                     bottomRight: Radius.circular(20.r),
//                     bottomLeft: Radius.circular(20.r),
//                     topRight: Radius.circular(20.r),
//                   ),
//                   child: Image.file(
//                     selectedImage!,
//                     width: MediaQuery.sizeOf(context).width * 0.6,
//                     height: MediaQuery.sizeOf(context).height * 0.3,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     setState(() {
//                       selectedImage = null;
//                     });
//                   },
//                   icon: Icon(
//                     Icons.delete,
//                     size: 30,
//                     color: Colors.red,
//                   ),
//                 )
//               ],
//             ),
//           Padding(
//             padding: EdgeInsets.only(bottom: 5.h, left: 10.w),
//             child: Row(
//               children: [
//                 Container(
//                   height: 60.h,
//                   decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 43, 51, 56),
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(20.r),
//                         bottomLeft: Radius.circular(20.r),
//                       )),
//                   child: IconButton(
//                     icon: const Icon(
//                       Icons.image,
//                       color: Colors.white,
//                     ),
//                     onPressed: pickImage,
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     height: 60.h,
//                     decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 43, 51, 56),
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(20.r),
//                           bottomRight: Radius.circular(20.r),
//                         )),
//                     child: TextField(
//                       style: TextStyle(color: Colors.white),
//                       cursorColor: Colors.white,
//                       controller: _controller,
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.all(5),
//                         hintText: "Write a message...",
//                         hintStyle:
//                             TextStyle(color: Colors.white, fontSize: 15.sp),
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     FontAwesomeIcons.paperPlane,
//                     color: Color(0xffE3FFEA),
//                   ),
//                   onPressed: () {
//                     sendMessage(widget.group.id);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/feature/Community/data/models/groupsmodel.dart';
import 'package:graduation_project/feature/Community/domain/modelCommunity/MessageModel.dart';
import 'package:graduation_project/feature/Community/presentation/pages/widgets/ShimmerLoadingMessages.dart';
import 'package:graduation_project/feature/Community/presentation/pages/widgets/messagetile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Communitybody extends StatefulWidget {
  const Communitybody({super.key, required this.group, required this.socket});
  final Group group;
  final IO.Socket socket;

  @override
  State<Communitybody> createState() => _CommunitybodyState();
}

class _CommunitybodyState extends State<Communitybody> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<MessageModel> messages = [];
  File? selectedImage;
  final Dio dio = Dio();

  String? lastMessageId;
  bool isLoadingMore = false;
  bool hasMoreMessages = true;

  @override
  void initState() {
    super.initState();
    JoinGroup(widget.group.id);
    fetchMessages(); // أول مرة تحميل
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent - 50 &&
        !isLoadingMore &&
        hasMoreMessages) {
      fetchMessages(); // تحميل بيانات جديدة
    }
  }

  void scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0.0, // لأن reverse: true
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void JoinGroup(String groupId) {
    widget.socket.emit("joinGroup", groupId);
    widget.socket.on('newMessage', (data) {
      if (!mounted) return;
      setState(() {
        messages.insert(0, MessageModel.fromJson(data));
      });
    });
  }

  Future<void> sendMessage(String groupId) async {
    try {
      final text = _controller.text.trim();
      if (text.isEmpty && selectedImage == null) return;

      final userId = await SharedPreferencesDemo.getUserId();
      String? base64Image;

      if (selectedImage != null) {
        final bytes = await selectedImage!.readAsBytes();
        base64Image = "data:image/jpeg;base64,${base64Encode(bytes)}";
      }

      widget.socket.emit("sendMessage", {
        'senderId': userId,
        'groupId': groupId,
        'content': text,
        if (base64Image != null) 'imageBase64': base64Image,
      });

      _controller.clear();

      if (!mounted) return;
      setState(() => selectedImage = null);
    } catch (e, stackTrace) {
      print("❌ Error sending message: $e\n$stackTrace");
    }
  }

  Future<void> fetchMessages() async {
    isLoadingMore = true;

    const int limit = 20;

    try {
      var authToken = await SharedPreferencesDemo.getToken();
      final response = await dio.get(
        "http://164.128.130.9:2530/api/v1/message",
        queryParameters: {
          'groupId': widget.group.id,
          'limit': limit,
          if (lastMessageId != null) 'lastMessageId': lastMessageId,
        },
        options: Options(headers: {'Authorization': 'Bearer $authToken'}),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonMessages = response.data['data']['messages'];
        final List<MessageModel> fetched =
            jsonMessages.map((json) => MessageModel.fromJson(json)).toList();

        if (!mounted) return;
        if (fetched.isNotEmpty) {
          lastMessageId = fetched.last.id;
          setState(() {
            messages.addAll(fetched);
            print("====================================================");
            print(messages.length);
          });
        }
        if (fetched.length < limit) hasMoreMessages = false;
      } else {
        print("❌ Error fetching messages: ${response.statusCode}");
      }
    } catch (e, s) {
      print("❗ Error loading messages: $e\n$s");
    }

    isLoadingMore = false;
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      if (!mounted) return;
      setState(() => selectedImage = File(picked.path));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                  "assets/community/d36bcceceaa1d390489ec70d93154311.jpg"))),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                if (index == messages.length && messages.length != 0) {
                  return ShimmerLoadingMessages();
                }
                return Messagetile(msg: messages[index]);
              },
            ),
          ),
          if (selectedImage != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.file(
                    selectedImage!,
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  onPressed: () => setState(() => selectedImage = null),
                  icon: Icon(Icons.delete, size: 30, color: Colors.red),
                )
              ],
            ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.h, left: 10.w),
            child: Row(
              children: [
                Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 43, 51, 56),
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20.r),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.image, color: Colors.white),
                    onPressed: pickImage,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 43, 51, 56),
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(20.r),
                      ),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      controller: _controller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        hintText: "Write a message...",
                        hintStyle:
                            TextStyle(color: Colors.white, fontSize: 15.sp),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.paperPlane,
                    color: Color(0xffE3FFEA),
                  ),
                  onPressed: () => sendMessage(widget.group.id),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
