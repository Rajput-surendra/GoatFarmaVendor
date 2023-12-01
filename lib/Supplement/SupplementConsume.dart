import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

import '../Helper/AppBtn.dart';
import '../Helper/CustomText.dart';
import '../Helper/session.dart';
import '../helper/appbar.dart';


class SupplementConsume extends StatefulWidget {
  const SupplementConsume({Key? key}) : super(key: key);

  @override
  State<SupplementConsume> createState() => _SupplementConsumeState();
}

class _SupplementConsumeState extends State<SupplementConsume> {
  final _formKey= GlobalKey<FormState>();
  final _weight=TextEditingController();
  String? Category;
  String? Breed;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar(text: '${getTranslated(context, "SUPPLEMENT_CONSUME")}', isTrue: true, context: context),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Custom_Text(text: '${getTranslated(context, "CATEGORIES")}'),
                        Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                            child:
                            Container(
                              width: MediaQuery.of(context).size.width/2.3,
                              color: Colors.white,
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                value:Category,
                                //elevation: 5,
                                style: TextStyle(color: Colors.black87),

                                items: <String>[
                                  'Sheep',
                                  'Chickens',
                                  'Pigs',
                                  'Goat',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),

                                hint: Text(
                                  "${getTranslated(context, "SELECTED_CATEGORY")}",
                                ),
                                onChanged: (String? value)  {
                                  setState(() {
                                    Category = value!;
                                  });
                                },

                                underline: Container(  // Use a container with zero height to remove the underline
                                  height: 0,
                                  color: Colors.white,
                                ),
                              ),
                            ))
                      ],
                    ),
                    Column(
                      children: [
                        Custom_Text(text: '${getTranslated(context, "BREED_TYPE")}'),
                        Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                            child:
                            Container(
                              width: MediaQuery.of(context).size.width/2.3,
                              color: Colors.white,
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                value:Breed,
                                //elevation: 5,
                                style: TextStyle(color: Colors.black87),

                                items: <String>[
                                  'Kids',
                                  'xyz',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),

                                hint: Text(
                                  "${getTranslated(context, "SELECTED_CATEGORY")}",
                                ),
                                onChanged: (String? value)  {
                                  setState(() {
                                    Breed = value!;
                                  });
                                },

                                underline: Container(  // Use a container with zero height to remove the underline
                                  height: 0,
                                  color: Colors.white,
                                ),
                              ),
                            ))
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(' ${getTranslated(context, "TOTAL_KIDS")}:45'),
                    Text('  ${getTranslated(context, "TOTAL_WEIGHT")}:315 kg  '),
                  ],
                ),
                SizedBox(height: 15,),
                Text(' ${getTranslated(context, "SUPPLEMENT_ID")}: SP001'),
                SizedBox(height: 20,),
                Custom_Text(text: ' ${getTranslated(context, "SCAN_SUPPLEMENT")}'),
                SizedBox(height: 10,),
                Card(
                  elevation: 2,
                  child: TextFormField(
                    cursorHeight: 20,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon:Container(
                          height: 10,
                          width: 10,
                          padding: EdgeInsets.all(10),
                          child: Image.asset("assets/images/Group 72309.png"),
                        ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Custom_Text(text: ' ${getTranslated(context, "SUPPLEMENT_REQUIRED")}'),
                SizedBox(height: 12,),
                Text('  ${getTranslated(context, "SUPPLEMENT_REQUIRED")}: 31.5 kg'),
                SizedBox(height: 20,),
                Custom_Text(text: '  ${getTranslated(context, "ENTER_WEIGHT")}'),
                SizedBox(height: 10,),
                Card(
                  elevation: 2,
                  child: TextFormField(
                    cursorHeight: 20,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 180,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Btn(title: ' ${getTranslated(context, "SAVE")}',height: 45,width:MediaQuery.of(context).size.width/1.2,
                    onPress: (){
                      Navigator.pop(context);
                    },)
                  ],
                )
              ],
            ),),
        ),
      ),
    );
  }
}