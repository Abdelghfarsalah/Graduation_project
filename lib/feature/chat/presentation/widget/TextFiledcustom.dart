import 'package:flutter/material.dart';
import 'package:graduation_project/feature/chat/presentation/manager/chatbloc.dart';
import 'package:graduation_project/feature/chat/presentation/manager/chatevent.dart';
import 'package:graduation_project/feature/chat/presentation/widget/messenger.dart';

class Textfiledcustom extends StatefulWidget {
  const Textfiledcustom({super.key, required this.bloc});
  final BotBloc bloc;

  @override
  State<Textfiledcustom> createState() => _TextfiledcustomState();
}

class _TextfiledcustomState extends State<Textfiledcustom> {
  String value = "";

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
        child: TextField(
          controller: widget.bloc.controller,
          onChanged: (v) => value = v,
          cursorColor: Colors.black,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              suffixIcon: IconButton(
                  onPressed: () {
                    if (value.isNotEmpty) {
                      widget.bloc.add(AddMessage(MessageSend(text: value)));
                      widget.bloc.add(FetchData(value));
                      widget.bloc.controller.clear();
                    }
                  },
                  icon: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black),
                    child: Center(
                        child: Icon(Icons.send_rounded,
                            size: 14, color: Colors.white)),
                  )),
              hintText: "Send a message.",
              hintStyle: const TextStyle(
                color: Color(0xffA1A1A1),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(width: 1, color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(width: 1, color: Colors.black),
              )),
        ),
      ),
    );
  }
}
