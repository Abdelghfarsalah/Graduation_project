import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/feature/chat/presentation/manager/chatbloc.dart';
import 'package:graduation_project/feature/chat/presentation/manager/chatevent.dart';
import 'package:graduation_project/feature/chat/presentation/widget/stream.dart';
import 'package:graduation_project/feature/home/presentation/pages/home.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            width: 46,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xffD3D7D8).withOpacity(0.3),
                      blurRadius: 24,
                      spreadRadius: 0,
                      offset: Offset(6, 11))
                ]),
            child: IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                      (data) => false);
                },
                icon: Icon(Icons.arrow_back_ios)),
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            color: Colors.white,
            icon: Icon(
              FontAwesomeIcons.ellipsis,
              color: Colors.grey.withOpacity(0.2),
            ),
            onSelected: (String value) {
              if (value == "Option1") {
                context.read<BotBloc>().add(ClearMessages());
              } else if (value == "Option2") {
                context.read<BotBloc>().add(ScrollToStart());
              } else {
                context.read<BotBloc>().add(ScrollToEnd());
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'Option1',
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.trash,
                      color: Colors.grey.withOpacity(0.2),
                      size: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Delete chat')
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Option2',
                child: Text('Return To Start'),
              ),
              const PopupMenuItem<String>(
                value: 'Option3',
                child: Text('Scroll To Bottom'),
              ),
            ],
          ),
        ],
      ),
      body: StreamView(),
    );
  }
}
