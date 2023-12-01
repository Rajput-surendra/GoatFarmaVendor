import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/Colors.dart';

import '../Helper/AppBtn.dart';
import '../Helper/Appbar.dart';
import 'BreedScreen.dart';
import 'madhu_farm.dart';

class GoatFarmaScreen extends StatefulWidget {
  const GoatFarmaScreen({Key? key}) : super(key: key);

  @override
  State<GoatFarmaScreen> createState() => _GoatFarmaScreenState();
}

class _GoatFarmaScreenState extends State<GoatFarmaScreen> {
  final _formKey = GlobalKey<FormState>();

  String? goatValue ;
  final List<String> items = ['Goat', 'Goat Male', 'Goat FeMale'];
  String? breedValue ;
  final List<String> breedValueitems = ['breed', 'breed Male', 'breed FeMale'];
  String? vaccineValue ;
  final List<String> vaccineValueitems = ['Categories', 'breed Categories', 'breed Categories'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, text:"Goat", isTrue: true, ),
      backgroundColor: colors.grad1Color,
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Categories",style: TextStyle(
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
                          child: Text("Select Goat",
                            style: TextStyle(
                                color: colors.blackTemp,fontWeight: FontWeight.normal
                            ),),
                        ),
                        // dropdownColor: colors.primary,
                        value: goatValue,
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
                            goatValue = value!;

                          });
                        },

                        items: items
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
                Text("Breed",style: TextStyle(
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
                          child: Text("Select Breed",
                            style: TextStyle(
                                color: colors.blackTemp,fontWeight: FontWeight.normal
                            ),),
                        ),
                        // dropdownColor: colors.primary,
                        value: breedValue,
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
                            breedValue = value!;

                          });
                        },

                        items: breedValueitems
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
                Text("Gestation Period",style: TextStyle(
                    color: colors.blacktextColor
                ),),
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
                          return 'Please Enter Gestation Period';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text("1st Matting",style: TextStyle(
                    color: colors.blacktextColor
                ),),
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
                          return 'Please Enter 1st Matting';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text("2nd onwards",style: TextStyle(
                    color: colors.blacktextColor
                ),),
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
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Select Vaccine",style: TextStyle(
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
                                   child: Text("Select Vaccine",
                                     style: TextStyle(
                                         color: colors.blackTemp,fontWeight: FontWeight.normal,fontSize: 13
                                     ),),
                                 ),
                                 // dropdownColor: colors.primary,
                                 value: vaccineValue,
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
                                     vaccineValue = value!;

                                   });
                                 },

                                 items: vaccineValueitems
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Card(
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
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15),
                 child: Column(
                   children: [
                     Btn(
                       onPress: (){
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BreedScreen())) ;
                         if(_formKey.currentState!.validate()){

                         }
                       },
                       title:"Add",
                       height: MediaQuery.of(context).size.width/8,
                     ),
                     SizedBox(height: 15,),
                     Btn(
                       onPress: (){
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MadhuFarmScreen())) ;
                         if(_formKey.currentState!.validate()){

                         }
                       },
                       title:"Save",
                       height: MediaQuery.of(context).size.width/8,
                     ),
                   ],
                 ),
               )



              ],
            ),
          ),
        ),
      ),
    );
  }
}
