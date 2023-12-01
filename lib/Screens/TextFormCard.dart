import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Helper/session.dart';
import '../Utils/Colors.dart';

class TextFormCard extends StatefulWidget {
   TextFormCard({Key? key, required this.name, required this.width,this.hint, this.Icon, this.controller, this.validString,this.onTap,this.readOnly,this.textInputType}) : super(key: key);
  final String name;
  final double width;
  final String? hint;
  IconData? Icon;
  final TextEditingController? controller;
  final String? validString;
   VoidCallback? onTap;
   bool? readOnly;
   TextInputType ? textInputType;


  @override
  State<TextFormCard> createState() => _TextFormCardState();
}

class _TextFormCardState extends State<TextFormCard> {
  @override
  Widget build(BuildContext context) {
    return (widget.validString.toString()==getTranslated(context, "MOBILE_NO."))?Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:EdgeInsets.only(left: 7) ,
          child: Text(
            widget.name,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 13
            ),
          ),
        ),
        SizedBox(height: 5,),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
              width: widget.width,
              color: Colors.white,
              alignment: Alignment.center,
              child:TextFormField(
                onTap:widget.onTap,
                readOnly: widget.readOnly ?? false,
                // maxLines: 4,
                controller: widget.controller,
                cursorHeight: 25,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10,top: 10),
                    border:InputBorder.none,
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                    fontSize: 13
                  ),hintTextDirection: TextDirection.ltr,
                  suffixIcon: Icon(widget.Icon)
                ),
                validator: (value){
                  if(value==null||value.isEmpty){
                    return "${widget.validString} ${getTranslated(context, "IS_REQUIRED")}";
                  }else if(value.length<9){
                    return '${getTranslated(context, "MOBILE_NO.")} ${getTranslated(context, "MOBILE_VALID")}';
                  }
                  return null;
                },
              )
          ),
        )
      ],
    ):Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:EdgeInsets.only(left: 7) ,
          child: Text(
            widget.name,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 13
            ),
          ),
        ),
        SizedBox(height: 5,),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
              width: widget.width,
              color: Colors.white,
              alignment: Alignment.center,
              child:TextFormField(
                onTap:widget.onTap,
                readOnly: widget.readOnly ?? false,
                // maxLines: 4,
                controller: widget.controller,
                keyboardType: widget.textInputType,
                cursorHeight: 25,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10,top: 10),
                    border:InputBorder.none,
                    hintText: widget.hint,
                    hintStyle: TextStyle(
                        fontSize: 13
                    ),hintTextDirection: TextDirection.ltr,
                    suffixIcon: Icon(widget.Icon)
                ),
                validator: (value){
                  if(value==null||value.isEmpty){
                    return "${widget.validString} ${getTranslated(context, "IS_REQUIRED")}";
                  }
                  return null;
                },
              )
          ),
        )
      ],
    );
  }
}
