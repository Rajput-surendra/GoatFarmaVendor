import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';

import '../Helper/AppBtn.dart';
import '../Helper/Appbar.dart';
import '../Utils/Colors.dart';
import 'TextFormCard.dart';

class AddNewMating extends StatefulWidget {
  const AddNewMating({Key? key}) : super(key: key);

  @override
  State<AddNewMating> createState() => _AddNewMatingState();
}

class _AddNewMatingState extends State<AddNewMating> {
  String? mating;
  String? matingStatus;
  List<String> matingType=['A','B','C'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "ADD_NEW_MATING"),
        isTrue: true,
      ),
      backgroundColor: colors.grad1Color,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 5,),
                            Text(getTranslated(context, "Tag_ID"),style: TextStyle(color: colors.blackTemp),),
                            Text("*",style: TextStyle(color: colors.red)),
                          ],
                        ),
                        Card(
                          child: Container(
                            height: 55,
                            child: Center(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    suffixIcon:Container(
                                      height: 10,
                                      width: 10,
                                      padding: EdgeInsets.all(10),
                                      child: Image.asset("assets/images/Group 72309.png"),
                                    ),
                                    contentPadding: EdgeInsets.only(left: 10),
                                    border: InputBorder.none
                                ),

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
             SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Breed : Sroahi",
                      style: TextStyle(
                          fontSize: 14
                      ),
                      overflow: TextOverflow.ellipsis,),
                    Text("Age: 15(Month)",
                      style: TextStyle(
                          fontSize: 14
                      ),),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Weight : 35 kg",
                      style: TextStyle(
                          fontSize: 14
                      ),
                      overflow: TextOverflow.ellipsis,),
                    Text("Last Breeder: Osmanabad",
                      style: TextStyle(
                          fontSize: 14
                      ),),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:EdgeInsets.only(left: 7) ,
                        child: Text(
                          "Mating Type",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 13
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Card(
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width/2.3,
                          color: colors.whiteTemp,
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            value:mating,
                            //elevation: 5,
                            style: TextStyle(color: Colors.black87),

                            items: <String>[
                              'A',
                              'B',
                              'C',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),

                            hint: Text(
                              "Select",style: TextStyle(fontSize: 15),
                            ),
                            onChanged: (String? value)  {
                              setState(() {
                                mating = value!;
                              });
                            },
                            // icon: Icon(Icons.keyboard_arrow_down),
                            underline: Container(  // Use a container with zero height to remove the underline
                              height: 0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextFormCard(
                    name:"Breeding ",
                    hint: "Cross/blood line",
                    width: MediaQuery.of(context).size.width/2.3,
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  TextFormCard(
                    name:"Male ID ",
                    hint: "Breed",
                    Icon: Icons.document_scanner_outlined,
                    width: MediaQuery.of(context).size.width/2.3,
                  ),
                  TextFormCard(
                    name:"Breed ",
                    hint: "Osmanabad",
                    width: MediaQuery.of(context).size.width/2.3,
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  TextFormCard(
                    name:"Semen ",
                    width: MediaQuery.of(context).size.width/2.3,
                  ),
                  TextFormCard(
                    name:"Dose ",
                    width: MediaQuery.of(context).size.width/2.3,
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:EdgeInsets.only(left: 7) ,
                    child: Text(
                      "Mating Status",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 13
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      color: colors.whiteTemp,
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        value:matingStatus,
                        //elevation: 5,
                        style: TextStyle(color: Colors.black87),

                        items: <String>[
                          'Not Successful',
                          'Pregnant',
                          'Miscarriage',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),

                        hint: Text(
                          "Select",style: TextStyle(fontSize: 15),
                        ),
                        onChanged: (String? value)  {
                          setState(() {
                            matingStatus = value!;
                          });
                        },
                        // icon: Icon(Icons.keyboard_arrow_down),
                        underline: Container(  // Use a container with zero height to remove the underline
                          height: 0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                child: Text("Expected Delivery Due Date : 04/10/2023"),
              ),
              SizedBox(height: 15,),
              TextFormCard(
                name:"Remark" ,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 25,),
              Btn(
                title:getTranslated(context, "SAVE"),
                height: MediaQuery.of(context).size.width/8,
                width:MediaQuery.of(context).size.width/1.2 ,
                onPress: (){
                  Navigator.pop(context);
                },
              ),



            ],
          ),
        ),


      )
    );
  }
}
