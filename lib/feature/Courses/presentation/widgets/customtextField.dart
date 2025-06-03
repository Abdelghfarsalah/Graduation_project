import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/get_couses_bloc/get_couses_bloc_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/get_couses_bloc/get_couses_bloc_event.dart';

class CustomTextFieldSearch extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final int maxLines;
  final TextEditingController? controller;

  const CustomTextFieldSearch({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: (value) {
        context.read<GetCousesBlocBloc>().add(SrearchforCourses(text: value));
      },
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(fontSize: 16, color: Colors.grey[800]),
    );
  }
}
