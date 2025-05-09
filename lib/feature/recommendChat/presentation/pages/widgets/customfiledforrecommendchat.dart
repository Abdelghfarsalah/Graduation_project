import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/feature/recommendChat/presentation/manager/reccomend_chat_bloc_bloc.dart';
import 'package:graduation_project/feature/recommendChat/presentation/manager/reccomend_chat_bloc_event.dart';

class customfiledforrecommendchat extends StatefulWidget {
  const customfiledforrecommendchat({super.key});

  @override
  State<customfiledforrecommendchat> createState() => _TextfiledcustomState();
}

class _TextfiledcustomState extends State<customfiledforrecommendchat> {
  String value = "";

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
        child: TextField(
          controller: context.read<ReccomendChatBlocBloc>().controller,
          onChanged: (v) => value = v,
          cursorColor: Colors.black,
          decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffE8EBF0),
              suffixIcon: IconButton(
                onPressed: () {
                  if (value.isNotEmpty) {
                    if (context.read<ReccomendChatBlocBloc>().track.length !=
                            0 &&
                        context.read<ReccomendChatBlocBloc>().roadmap.length !=
                            0) {
                      context
                          .read<ReccomendChatBlocBloc>()
                          .add(FetchroadmapwithQuestion(Question: value));
                    } else {
                      context
                          .read<ReccomendChatBlocBloc>()
                          .add(Fetchroadmap(value));
                    }
                    // widget.bloc.add(AddMessage(MessageSend(text: value)));
                    // widget.bloc.add(FetchData(value));
                    context.read<ReccomendChatBlocBloc>().controller.clear();
                  }
                },
                icon: Icon(Icons.send_rounded,
                    size: 25.w, color: appColor.Primarycolor),
              ),
              hintText: "Type your message here...",
              hintStyle: const TextStyle(
                color: Color(0xffA1A1A1),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    const BorderSide(width: 0, color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    const BorderSide(width: 1, color: Colors.transparent),
              )),
        ),
      ),
    );
  }
}
