import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/AppBtn.dart';

import '../Helper/Appbar.dart';
import '../Helper/Colors.dart';
import '../Helper/toast.dart';

class Supplement extends StatefulWidget {
  const Supplement({Key? key}) : super(key: key);

  @override
  State<Supplement> createState() => _SupplementState();
}

class _SupplementState extends State<Supplement> {
  String? catValue ;
  final List<String> catValueitems = ['Categories', 'breed Categories1', 'breed Categories2'];

  String? supplementValue ;
  final List<String> supplementValueitems = ['Categories', 'breed Categories1', 'breed Categories2'];

  String? typeValue ;
  final List<String> typeValueitems = ['Categories', 'breed Categories1', 'breed Categories2'];

  String? weightValue ;
  final List<String> weightValueitems = ['45 kg', '48 kg', '30 kg'];

  String? supplementSelectValue ;
  final List<String> supplementSelectValueitems = ['MAKKA', 'GENHU', 'CHANA'];

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.grad1Color,
        appBar: customAppBar(context: context, text:"Breed", isTrue: true, ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
               children: [
                 Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Supplement ID",style: TextStyle(color: colors.blacktextColor),),
                       Card(
                         child: Container(
                           height: 55,
                           child: TextFormField(
                             decoration: InputDecoration(
                                 contentPadding: EdgeInsets.only(left: 10),
                                 border: InputBorder.none
                             ),
                             validator: (value) {
                               if (value == null || value.isEmpty) {
                                 return 'Please Enter 2nd onwards';
                               }
                               return null;
                             },
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
                 Card(
                   margin: EdgeInsets.only(top: 15),
                   child: Container(
                     height: 55,
                      width: 60,
                     child:Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Icon(Icons.delete,color: colors.red,),
                     )
                   ),
                 ),
               ],
             ),
              SizedBox(height: 10,),
              Row(

                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Category",style: TextStyle(
                                  color: colors.blacktextColor
                              ),),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 3,bottom: 3),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: const Padding(
                                        padding: EdgeInsets.only(bottom: 0),
                                        child: Text("Select Category",
                                          style: TextStyle(
                                              color: colors.blackTemp,fontWeight: FontWeight.normal,fontSize: 13
                                          ),),
                                      ),
                                      // dropdownColor: colors.primary,
                                      value: catValue,
                                      icon:  const Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Icon(Icons.keyboard_arrow_down_rounded,  color: colors.secondary,size: 30,),
                                      ),
                                      // elevation: 16,
                                      style:  TextStyle(color: colors.secondary,fontWeight: FontWeight.bold),
                                      underline: Padding(
                                        padding: const EdgeInsets.only(left: 0,right: 0),
                                        child: Container(
                                          // height: 2,
                                          color:  colors.whiteTemp,
                                        ),
                                      ),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          catValue = value!;

                                        });
                                      },

                                      items: catValueitems
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child:
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Text(value,style: const TextStyle(color: colors.textColor,fontWeight: FontWeight.normal),),
                                              ),
                                            ],
                                          ),
                                        );

                                      }).toList(),

                                    ),

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),

                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Supplement Name",style: TextStyle(
                                  color: colors.blacktextColor
                              ),),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 3,bottom: 3),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: const Padding(
                                        padding: EdgeInsets.only(bottom: 0),
                                        child: Text("Supplement Name",
                                          style: TextStyle(
                                              color: colors.blackTemp,fontWeight: FontWeight.normal,fontSize: 13
                                          ),),
                                      ),
                                      // dropdownColor: colors.primary,
                                      value: supplementValue,
                                      icon:  const Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Icon(Icons.keyboard_arrow_down_rounded,  color: colors.secondary,size: 30,),
                                      ),
                                      // elevation: 16,
                                      style:  TextStyle(color: colors.secondary,fontWeight: FontWeight.bold),
                                      underline: Padding(
                                        padding: const EdgeInsets.only(left: 0,right: 0),
                                        child: Container(
                                          // height: 2,
                                          color:  colors.whiteTemp,
                                        ),
                                      ),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          supplementValue = value!;

                                        });
                                      },

                                      items: supplementValueitems
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child:
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Text(value,style: const TextStyle(color: colors.textColor,fontWeight: FontWeight.normal),),
                                              ),
                                            ],
                                          ),
                                        );

                                      }).toList(),

                                    ),

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),

                      ],
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10,),
              Row(

                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Select Type",style: TextStyle(
                                  color: colors.blacktextColor
                              ),),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 3,bottom: 3),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: const Padding(
                                        padding: EdgeInsets.only(bottom: 0),
                                        child: Text("Type",
                                          style: TextStyle(
                                              color: colors.blackTemp,fontWeight: FontWeight.normal,fontSize: 13
                                          ),),
                                      ),
                                      // dropdownColor: colors.primary,
                                      value: typeValue,
                                      icon:  const Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Icon(Icons.keyboard_arrow_down_rounded,  color: colors.secondary,size: 30,),
                                      ),
                                      // elevation: 16,
                                      style:  TextStyle(color: colors.secondary,fontWeight: FontWeight.bold),
                                      underline: Padding(
                                        padding: const EdgeInsets.only(left: 0,right: 0),
                                        child: Container(
                                          // height: 2,
                                          color:  colors.whiteTemp,
                                        ),
                                      ),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          typeValue = value!;

                                        });
                                      },

                                      items: typeValueitems
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child:
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Text(value,style: const TextStyle(color: colors.textColor,fontWeight: FontWeight.normal),),
                                              ),
                                            ],
                                          ),
                                        );

                                      }).toList(),

                                    ),

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),

                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Weight",style: TextStyle(
                                  color: colors.blacktextColor
                              ),),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 3,bottom: 3),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: const Padding(
                                        padding: EdgeInsets.only(bottom: 0),
                                        child: Text("Select Weight",
                                          style: TextStyle(
                                              color: colors.blackTemp,fontWeight: FontWeight.normal,fontSize: 13
                                          ),),
                                      ),
                                      // dropdownColor: colors.primary,
                                      value: weightValue,
                                      icon:  const Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Icon(Icons.keyboard_arrow_down_rounded,  color: colors.secondary,size: 30,),
                                      ),
                                      // elevation: 16,
                                      style:  TextStyle(color: colors.secondary,fontWeight: FontWeight.bold),
                                      underline: Padding(
                                        padding: const EdgeInsets.only(left: 0,right: 0),
                                        child: Container(
                                          // height: 2,
                                          color:  colors.whiteTemp,
                                        ),
                                      ),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          weightValue = value!;

                                        });
                                      },

                                      items: weightValueitems
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child:
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Text(value,style: const TextStyle(color: colors.textColor,fontWeight: FontWeight.normal),),
                                              ),
                                            ],
                                          ),
                                        );

                                      }).toList(),

                                    ),

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),

                      ],
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10,),
              Text("Select Supplemen",style: TextStyle(
                  color: colors.blacktextColor
              )),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 3,bottom: 3),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: const Padding(
                        padding: EdgeInsets.only(bottom: 0),
                        child: Text("Select Supplement",
                          style: TextStyle(
                              color: colors.blackTemp,fontWeight: FontWeight.normal,fontSize: 13
                          ),),
                      ),
                      // dropdownColor: colors.primary,
                      value: supplementSelectValue,
                      icon:  const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(Icons.keyboard_arrow_down_rounded,  color: colors.secondary,size: 30,),
                      ),
                      // elevation: 16,
                      style:  TextStyle(color: colors.secondary,fontWeight: FontWeight.bold),
                      underline: Padding(
                        padding: const EdgeInsets.only(left: 0,right: 0),
                        child: Container(
                          // height: 2,
                          color:  colors.whiteTemp,
                        ),
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          supplementSelectValue = value!;

                        });
                      },

                      items: supplementSelectValueitems
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child:
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(value,style: const TextStyle(color: colors.textColor,fontWeight: FontWeight.normal),),
                              ),
                            ],
                          ),
                        );

                      }).toList(),

                    ),

                  ),
                ),
              ),
              SizedBox(height: 10,),
              Btn(
                onPress: (){
                   if(_formKey.currentState!.validate()){

                   } else{
                     showSnackbarMessage(context,"sdsdsdsdsf");
                   }
                },
                height: 45,
                title: "add",)
            ],
          ),
        ),
      ),
    );
  }
}
