import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/manager/tracks/tracks_bloc.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/presentation/manager/tracks/tracks_event.dart';

class BeautifulSearchField extends StatefulWidget {
  const BeautifulSearchField({super.key});

  @override
  State<BeautifulSearchField> createState() => _BeautifulSearchFieldState();
}

class _BeautifulSearchFieldState extends State<BeautifulSearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 0, vertical: 20), // نفس تنسيق الـ UI
      child: TextField(
        controller: _controller,
        onChanged: (value) {
          context.read<TracksBloc>().add(SearchTracks(name: value));
        },
        onSubmitted: (value) {},
        style: TextStyle(
          color: Colors.blue[900],
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: "Search tracks...",
          hintStyle: TextStyle(
            color: Colors.blue[200],
            fontSize: 16,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.blue[200],
            size: 25,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.grey, // لون الحد الرمادي
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.grey, // الحد الرمادي لما يكون غير مفعل
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.blueAccent, // لون الحد عند التركيز
              width: 1.5,
            ),
          ),
        ),
        cursorColor: Colors.blueAccent,
        cursorWidth: 1.5,
        cursorRadius: const Radius.circular(2),
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r'\n')),
        ],
        textInputAction: TextInputAction.search,
      ),
    );
  }
}
