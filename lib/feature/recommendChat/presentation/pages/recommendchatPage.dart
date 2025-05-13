import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/feature/recommendChat/presentation/manager/reccomend_chat_bloc_bloc.dart';
import 'package:graduation_project/feature/recommendChat/presentation/manager/reccomend_chat_bloc_event.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/widgets/recommendchatview.dart';

class Recommendchatpage extends StatefulWidget {
  const Recommendchatpage({super.key, required this.text});
  final String text;
  @override
  State<Recommendchatpage> createState() => _RecommendchatpageState();
}

class _RecommendchatpageState extends State<Recommendchatpage> {
  void initState() {
    super.initState();
    if (widget.text.length != 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<ReccomendChatBlocBloc>().add(ClearMessages());
        context.read<ReccomendChatBlocBloc>().add(Fetchroadmap(widget.text));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.text.length);
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: appColor.Primarycolor,
        automaticallyImplyLeading: false,
        title: Image.asset("assets/Icons/logo.png"),
        actions: [
          PopupMenuButton<String>(
            color: Colors.white,
            icon: Icon(
              FontAwesomeIcons.ellipsis,
              color: Colors.white,
              size: 20.sp,
            ),
            onSelected: (String value) {
              if (value == "Option1") {
                context.read<ReccomendChatBlocBloc>().add(ClearMessages());
              } else if (value == "Option2") {
                context.read<ReccomendChatBlocBloc>().add(ScrollToStart());
              } else {
                context.read<ReccomendChatBlocBloc>().add(ScrollToEnd());
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'Option1',
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidChartBar,
                      color: Colors.grey.withOpacity(0.2),
                      size: 18.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text('New RoadMap', style: TextStyle(fontSize: 14.sp))
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
      body: Recommendchatview(),
    );
  }
}
