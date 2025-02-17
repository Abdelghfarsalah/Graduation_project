import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/feature/chat/presentation/manager/chatbloc.dart';

class MessageSend extends StatelessWidget {
  const MessageSend({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 8, right: 0),
      child: Row(
        children: [
          Container(
            height: 37,
            width: 37,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Bot/Snederinbot.png"))),
          ),
          SizedBox(
            width: 3,
          ),
          IntrinsicWidth(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.75, // أقصى عرض
              ),
              child: Center(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )),
            ),
          ),
          Spacer(),
          IconButton(
              onPressed: () {
                context.read<BotBloc>().controller.text = text;
              },
              icon: Icon(
                FontAwesomeIcons.penToSquare,
                size: 17,
                color: Colors.grey.withOpacity(0.5),
              ))
        ],
      ),
    );
  }
}
