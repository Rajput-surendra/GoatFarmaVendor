import 'dart:ui';

import 'package:flutter/material.dart';

import '../Utils/Colors.dart';
class Btn extends StatelessWidget {
  final String? title;
  final VoidCallback? onPress;
  double? height;
  double? width;
  double? fSize;
  IconData? icon;
  Color? color;
  Btn({Key? key,
    this.title, this.onPress, this.height, this.width, this.fSize, this.icon,this.color
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(

        decoration: BoxDecoration(
          color:Color(0xFF41B328),
    borderRadius: BorderRadius.circular(3)
        ),
        height: 50,
        width: width,
        child: Center(
          child: Text(
            "$title",
            style:  TextStyle(
              color:colors.whiteTemp,
              fontSize: fSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
