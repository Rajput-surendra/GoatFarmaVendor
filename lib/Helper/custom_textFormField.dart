
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  // final TextEditingController controller;
  final String hintText;

  CustomTextFormField({
    // required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // maxLines: 4,
      cursorHeight: 25,
      // controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        // border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14
          )
      ),
    );
  }
}