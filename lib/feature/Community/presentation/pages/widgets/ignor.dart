// Future<void> fetchAllMessages() async {
//   List<MessageModel> allMessages = [];
//   String? lastMessageId;
//   const int limit = 20; // ممكن تزود الرقم حسب ما السيرفر يسمح
//   try {
//     var authToken = await SharedPreferencesDemo.getToken();
//     while (true) {
//       final response = await dio.get(
//         "http://164.128.130.9:2530/api/v1/message",
//         queryParameters: {
//           'groupId': widget.group.id, // <-- أضف الـ groupId هنا
//           'limit': 20,
//           if (lastMessageId != null) 'lastMessageId': lastMessageId,
//         },
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $authToken',
//           },
//         ),
//       );
//       print(response.data);
//       if (response.statusCode == 200) {
//         final List<dynamic> jsonMessages = response.data['data']['messages'];
//         final List<MessageModel> fetchedMessages =
//             jsonMessages.map((json) => MessageModel.fromJson(json)).toList();
//         if (fetchedMessages.isEmpty) break;
//         allMessages.addAll(fetchedMessages);
//         lastMessageId = fetchedMessages[fetchedMessages.length - 1].id;
//         // لما السيرفر يرجع عدد أقل من limit معناها وصلنا للنهاية
//         if (fetchedMessages.length < limit) break;
//       } else {
//         print("❌ Error fetching messages: ${response.statusCode}");
//         break;
//       }
//     }
//     if (!mounted) return;
//     setState(() {
//       messages = allMessages;
//     });

//     print("✅ Total messages fetched: ${allMessages.length}");
//   } catch (e, s) {
//     print("❗ Exception while fetching all messages: $e\n$s");
//   }
// }

// void connectSocket() {
//   socket = IO.io(
//     "http://164.128.130.9:2530",
//     IO.OptionBuilder()
//         .setTransports(List<String>.from(['websocket']))
//         .disableAutoConnect()
//         .build(),
//   );
//   socket.connect();
//   socket.onConnect((_) {
//     print("Connected to socket");
//   });
//   socket.on('newMessage', (data) {
//     if (!mounted) return;
//     print(data);
//     setState(() {
//       messages.insert(0, MessageModel.fromJson(data));
//     });
//   });
//   socket.onDisconnect((_) => print("Disconnected"));
// }

// Future<void> fetchMessages({bool isInitial = false}) async {
//   const int limit = 15;

//   if (isFetching || !hasMore) return;

//   if (mounted) {
//     setState(() {
//       isFetching = true;
//     });
//   }

//   try {
//     final authToken = await SharedPreferencesDemo.getToken();
//     final response = await dio.get(
//       "http://164.128.130.9:2530/api/v1/message",
//       queryParameters: {
//         'groupId': widget.group.id,
//         'limit': limit,
//         if (!isInitial && lastMessageId != null)
//           'lastMessageId': lastMessageId,
//       },
//       options: Options(headers: {
//         'Authorization': 'Bearer $authToken',
//       }),
//     );

//     if (response.statusCode == 200) {
//       final List<dynamic> jsonMessages = response.data['data']['messages'];
//       final List<MessageModel> fetchedMessages =
//           jsonMessages.map((json) => MessageModel.fromJson(json)).toList();

//       if (mounted) {
//         setState(() {
//           messages.addAll(fetchedMessages);
//           // نضيفهم في الآخر لأننا عاملين reverse
//           if (fetchedMessages.isNotEmpty) {
//             lastMessageId = fetchedMessages.last.id;
//           }
//           if (fetchedMessages.length < limit) {
//             hasMore = false; // مفيش رسائل تانية
//           }
//         });
//       }
//     }
//     print("${messages.length}");
//   } catch (e, s) {
//     print("❗ Error in pagination: $e\n$s");
//   }

//   setState(() {
//     isFetching = false;
//   });
// }

// Future<void> sendMessage() async {
//   try {
//     final text = _controller.text.trim();
//     if (text.isEmpty && selectedImage == null) return;
//     final userId = await SharedPreferencesDemo.getUserId();
//     String? base64Image;
//     if (selectedImage != null) {
//       final bytes = await selectedImage!.readAsBytes();
//       base64Image = "data:image/jpeg;base64,${base64Encode(bytes)}";
//     }
//     // 👇 ابعت الرسالة مباشرة إلى السيرفر باستخدام socket
//     socket.emit("sendMessage", {
//       'senderId': userId,
//       'content': text,
//       if (base64Image != null) 'imageBase64': base64Image,
//     });
//     _controller.clear();
//     setState(() {
//       selectedImage = null;
//     });
//     print("✅ Message sent via socket");
//   } catch (e, stackTrace) {
//     print("❌ Error sending message: $e");
//     print("🧱 StackTrace: $stackTrace");
//   }
// }
  // void connectSocket(String groupId) {
  //   try {
  //     log("${groupId} ++++++++++++++++++++++++++++++++++++++++");
  //     socket = IO.io(
  //       "http://164.128.130.9:2530",
  //       IO.OptionBuilder().setTransports(['websocket']).build(),
  //     );

  //     log("${groupId} ++++++++++++++++before connect++++++++++++++++++++++++");
  //     socket.connect();
  //     log("${groupId} ++++++++++++++++Connect++++++++++++++++++++++++");

  //     socket.onConnect((_) {
  //       socket.emit("joinGroup", groupId);
  //       log("Joined group: $groupId");
  //     });

  //     log("${groupId} ++++++++++++++++last++++++++++++++++++++++++");
  //     socket.on('newMessage', (data) {
  //       if (!mounted) return;
  //       print(data);
  //       setState(() {
  //         messages.insert(0, MessageModel.fromJson(data));
  //       });
  //     });

  //     socket.onDisconnect((_) => log("Disconnected"));
  //   } on Exception catch (e) {
  //     log(e.toString());
  //   }
  // }
