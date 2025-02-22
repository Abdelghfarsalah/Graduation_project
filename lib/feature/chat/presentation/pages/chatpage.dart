import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/feature/chat/presentation/manager/chatbloc.dart';
import 'package:graduation_project/feature/chat/presentation/manager/chatevent.dart';
import 'package:graduation_project/feature/chat/presentation/widget/stream.dart';

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
          padding: EdgeInsets.all(8.0.w),
          child: Container(
            height: 40.h,
            width: 46.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13.r),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xffD3D7D8).withOpacity(0.3),
                      blurRadius: 24.r,
                      spreadRadius: 0,
                      offset: Offset(6.w, 11.h))
                ]),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, size: 18.sp)),
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            color: Colors.white,
            icon: Icon(
              FontAwesomeIcons.ellipsis,
              color: Colors.grey.withOpacity(0.2),
              size: 20.sp,
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
                      size: 18.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text('Delete chat', style: TextStyle(fontSize: 14.sp))
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'Option2',
                child:
                    Text('Return To Start', style: TextStyle(fontSize: 14.sp)),
              ),
              PopupMenuItem<String>(
                value: 'Option3',
                child:
                    Text('Scroll To Bottom', style: TextStyle(fontSize: 14.sp)),
              ),
            ],
          ),
        ],
      ),
      body: StreamView(),
    );
  }
}
