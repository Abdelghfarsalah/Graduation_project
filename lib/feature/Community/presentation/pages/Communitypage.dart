import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/feature/Community/domain/modelCommunity/MessageModel.dart';
import 'package:graduation_project/feature/Community/presentation/pages/widgets/customappbar.dart';
import 'package:graduation_project/feature/Community/presentation/pages/widgets/messagetile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Communitypage extends StatefulWidget {
  const Communitypage({super.key});

  @override
  State<Communitypage> createState() => _ChatPageState();
}

class _ChatPageState extends State<Communitypage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // بعد إضافة رسالة جديدة، نعمل scroll لآخر رسالة
  void scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  List<MessageModel> messages = [];
  File? selectedImage;
  late IO.Socket socket;

  final Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    connectSocket();
    fetchAllMessages();
    scrollToBottom();
  }

  void connectSocket() {
    socket = IO.io(
      "http://164.128.130.9:2530",
      IO.OptionBuilder()
          .setTransports(List<String>.from(['websocket']))
          .disableAutoConnect()
          .build(),
    );

    socket.connect();

    socket.onConnect((_) {
      print("Connected to socket");
    });

    socket.on('newMessage', (data) {
      if (!mounted) return; // ✅ تأكد إن الشاشة لسه موجودة

      setState(() {
        messages.insert(0, MessageModel.fromJson(data));
      });
    });

    socket.onDisconnect((_) => print("Disconnected"));
  }

  String? lastMessageId;

  Future<void> fetchAllMessages() async {
    List<MessageModel> allMessages = [];
    String? lastMessageId;
    const int limit = 20; // ممكن تزود الرقم حسب ما السيرفر يسمح

    try {
      var authToken = await SharedPreferencesDemo.getToken();
      while (true) {
        final response = await dio.get(
          "http://164.128.130.9:2530/api/v1/message",
          queryParameters: {
            'limit': limit,
            if (lastMessageId != null) 'lastMessageId': lastMessageId,
          },
          options: Options(
            headers: {'Authorization': authToken},
          ),
        );
        if (response.statusCode == 200) {
          final List<dynamic> jsonMessages = response.data['data']['messages'];
          final List<MessageModel> fetchedMessages =
              jsonMessages.map((json) => MessageModel.fromJson(json)).toList();

          if (fetchedMessages.isEmpty) break;

          allMessages.addAll(fetchedMessages);
          lastMessageId = fetchedMessages[fetchedMessages.length - 1].id;

          // لما السيرفر يرجع عدد أقل من limit معناها وصلنا للنهاية
          if (fetchedMessages.length < limit) break;
        } else {
          print("❌ Error fetching messages: ${response.statusCode}");
          break;
        }
      }

      setState(() {
        messages = allMessages;
      });

      print("✅ Total messages fetched: ${allMessages.length}");
    } catch (e, s) {
      print("❗ Exception while fetching all messages: $e\n$s");
    }
  }

  Future<void> sendMessage() async {
    try {
      if (selectedImage != null) {
        print("Path: ${selectedImage!.path}");
        print("File exists: ${await File(selectedImage!.path).exists()}");
        print("Size: ${(await selectedImage!.length())} bytes");
      }
      final text = _controller.text.length != 0 ? _controller.text : "";
      var authToken = await SharedPreferencesDemo.getToken();
      String fileName = path.basename(selectedImage!.path);

      FormData formData = FormData.fromMap({
        'message': text,
        if (selectedImage != null)
          'image': await MultipartFile.fromFile(
            selectedImage!.path,
            filename: fileName,
          ),
      });

      final response = await dio.post(
        "http://164.128.130.9:2530/api/v1/message",
        data: formData,
        options: Options(
          headers: {
            'Authorization': authToken,
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      var userId = await SharedPreferencesDemo.getUserId();
      if (response.statusCode == 201) {
        _controller.clear();
        socket.emit("sendMessage", {
          'senderId': userId,
          'content': text,
          'imageBase64': selectedImage != null
              ? base64Encode(await selectedImage!.readAsBytes())
              : null,
        });

        print("✅ Message sent and added to UI");
      } else {
        print("Error sending message: ${response.statusCode}");
        print("Response body: ${response.data}");
      }
    } catch (e, stackTrace) {
      print("Exception occurred while sending message: $e");
      print("StackTrace: $stackTrace");
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => selectedImage = File(picked.path));
    }
  }

  @override
  @override
  void dispose() {
    socket.off('newMessage'); // ✅ افصل الاستماع لعدم حدوث setState بعد الخروج
    socket.disconnect(); // ✅ اقفل الاتصال
    _controller.dispose(); // ✅ تنظيف كنترولر النص
    _scrollController.dispose(); // ✅ تنظيف ScrollController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomappbarforCoummunity(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                    "assets/community/whatsapp-chat-rmzlyx15fhausbaf.jpg"))),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                controller: _scrollController,
                reverse: true,
                padding: const EdgeInsets.all(8),
                children: messages.map((msg) => Messagetile(msg: msg)).toList(),
              ),
            ),
            if (selectedImage != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r),
                      bottomLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                    child: Image.file(
                      selectedImage!,
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectedImage = null;
                      });
                    },
                    icon: Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.image),
                    onPressed: pickImage,
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: "Write a message...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.paperPlane,
                      color: appColor.Primarycolor,
                    ),
                    onPressed: sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
