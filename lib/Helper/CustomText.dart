import 'package:flutter/material.dart';
class Custom_Text extends StatelessWidget {
  Custom_Text({Key? key,required this.text,}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.grey
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
   final TextEditingController? controller;
  final String hintText;

  CustomTextFormField({
     this.controller,
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

class CustomRowTextField extends StatelessWidget {
  final TextEditingController controller1;
  final TextEditingController controller2;
  final String text1;final String text2;


  CustomRowTextField({
    required this.controller1,
    required this.text1,
    required this.text2,
    required this.controller2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( ' $text1',style: TextStyle(color: Colors.grey),),
            SizedBox(height: 5,),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
              child: Container(
                height: MediaQuery.of(context).size.height/17,
                width: MediaQuery.of(context).size.width/2.3,
                // color: Colors.white,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child:  TextFormField(
                  // maxLines: 4,
                  cursorHeight: 25,
                  controller: controller1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      // border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                      // hintText: hintText,
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14
                      )
                  ),
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return 'field is required';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(' $text2',style: TextStyle(color: Colors.grey),),
            SizedBox(height: 5,),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
              child: Container(
                height: MediaQuery.of(context).size.height/17,
                width: MediaQuery.of(context).size.width/2.3,
                // color: Colors.white,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3))
                ),
                child:  TextFormField(
                  // maxLines: 4,
                  cursorHeight: 25,
                  controller: controller2,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(10),
                    // hintText: hintText,
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14
                    ),
                  ),
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return 'field is required';
                    }
                    return null;
                  },
                ),
              ),
            )
          ],
        ),

      ],
    );






  }
}



class CustomColumnTextField extends StatelessWidget {
  final TextEditingController controller1;
  // final TextEditingController controller2;
  final String text1;


  CustomColumnTextField({
    required this.controller1,
    required this.text1,
  });

  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text( ' $text1',style: TextStyle(color: Colors.grey),),
          SizedBox(height: 5,),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
            child: Container(
              height: MediaQuery.of(context).size.height/17,
              width: MediaQuery.of(context).size.width/2.3,
              // color: Colors.white,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child:  TextFormField(
                // maxLines: 4,
                cursorHeight: 25,
                controller: controller1,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    // border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(10),
                    // hintText: hintText,
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14
                    )
                ),
                validator: (value){
                  if(value==null||value.isEmpty){
                    return 'field is required';
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      );
  }
}