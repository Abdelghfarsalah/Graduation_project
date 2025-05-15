import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Community/domain/modelCommunity/MessageModel.dart';
import 'package:graduation_project/feature/Community/presentation/pages/widgets/messagetile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Communitypage extends StatefulWidget {
  const Communitypage({super.key});

  @override
  State<Communitypage> createState() => _ChatPageState();
}

class _ChatPageState extends State<Communitypage> {
  final String authToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2ODE2NjExNTczNTRkYTMxZmJjY2EyMzIiLCJlbWFpbCI6ImFiZGVsZ2hmYXJzYWxhaDhAZ21haWwuY29tIiwiaWF0IjoxNzQ3MzIzOTM4LCJleHAiOjE3Nzg4ODE1Mzh9.5qnc8EeWwf1mLl_8PFtiDi8eKXH6cZ-x7b9TygB7-CY";
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
      final text = _controller.text.length != 0 ? _controller.text : "";

      FormData formData = FormData.fromMap({
        'message': text,
        if (selectedImage != null)
          'image': await MultipartFile.fromFile(
            selectedImage!.path,
            filename: selectedImage!.path.split('/').last,
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

  final String userId = "681661157354da31fbcca232";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900, // خلفية داكنة أكثر لجو عصري
        elevation: 2, // ظل خفيف لإبراز الـ AppBar
        centerTitle: false, // عنوان على اليسار لأسلوب محادثة أكثر
        title: Text(
          "AI Community", // اسم عام للمجموعة
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.blue.shade300),
        actions: [
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.search), // أيقونة بحث
            onPressed: () {
              // وظيفة البحث
            },
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.more_vert), // أيقونة المزيد
            onPressed: () {
              // وظائف إضافية
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: _scrollController,
              reverse: true,
              padding: const EdgeInsets.all(8),
              children: messages.map((msg) => Messagetile(msg: msg)).toList(),
            ),
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
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
