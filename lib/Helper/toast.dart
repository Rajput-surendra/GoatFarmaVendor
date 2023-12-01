
import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/Colors.dart';

 void showSnackbarMessage(BuildContext context, String msg){
  final snackBar = SnackBar(
    content: Center(child: Text(msg,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
    backgroundColor: colors.primary,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30)
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}