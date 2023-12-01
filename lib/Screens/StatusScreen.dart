import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Helper/Appbar.dart';
import '../Helper/session.dart';
import '../Utils/colors.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  bool showvalue = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.grad1Color,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height*1.3,
          child:Stack(
              children:[ Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/2.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)
                        ),
                        color:colors.yellow
                    ),
                  ),

                ],
              ),
                Positioned(
                  top: 50,
                  left: 0,
                  right: 0,
                  child: Column(

                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(onTap:(){
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                        child: Icon(Icons.arrow_back_ios_new_outlined,color: colors.secondary,)),
                            Text(getTranslated(context, "STATUS"),
                              style: TextStyle(
                                  color: colors.secondary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                            SizedBox(width: 20,),
                          ],
                        ),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 20,top: 10,bottom: 100),
                      ),

                      Container(
                        height: MediaQuery.of(context).size.height/1.1,
                        margin: EdgeInsets.all(20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Column(
                            children: [
                              SizedBox(height:80 ,),
                              Container(
                                child: Text(getTranslated(context, "SCAN_TAG_ID"),
                                  style:TextStyle(
                                      color: colors.darkBlue,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: colors.whiteTemp,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: colors.black54.withOpacity(0.3), // Specify your desired border color here
                                      width: 1.0, // Adjust the border width
                                    ),
                                  ),),
                                padding: EdgeInsets.all(15),
                                // margin: EdgeInsets.only(left: 15,right: 15),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Ushmanabadi(Female)|Weight:25kg | Age :15 | Status :Pregnant",
                                          style:TextStyle(
                                              color: colors.blackTemp,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12
                                          ),
                                        overflow: TextOverflow.ellipsis,),


                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: colors.whiteTemp,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: colors.black54.withOpacity(0.3), // Specify your desired border color here
                                      width: 1.0, // Adjust the border width
                                    ),
                                  ),),
                                padding: EdgeInsets.all(15),
                                // margin: EdgeInsets.only(left: 15,right: 15),
                                child: Column(
                                  children: [
                                    Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(getTranslated(context, "WEIGHT_RECORD"),
                                          style:TextStyle(
                                              color: colors.blackTemp.withOpacity(0.5),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13
                                          ),),
                                        SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${getTranslated(context, "LAST_WEIGHT")} : 25 kg",
                                              style:TextStyle(
                                                  color: colors.darkBlue,
                                                  fontWeight: FontWeight.w500,
                                                fontSize: 13
                                              ),
                                            ),
                                            Text("${getTranslated(context, "DATE")} : 25/05/2023",
                                              style:TextStyle(
                                                  color: colors.darkBlue,
                                                  fontWeight: FontWeight.w500,
                                                fontSize: 13
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: colors.whiteTemp,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: colors.black54.withOpacity(0.3), // Specify your desired border color here
                                      width: 1.0, // Adjust the border width
                                    ),
                                  ),),
                                padding: EdgeInsets.all(15),
                                // margin: EdgeInsets.only(left: 15,right: 15),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${getTranslated(context, "VACCINATION_RECORD")}",
                                          style:TextStyle(
                                              color: colors.blackTemp.withOpacity(0.5),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13
                                          ),),
                                        SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${getTranslated(context, "VACCINE")} : PPR",
                                              style:TextStyle(
                                                  color: colors.darkBlue,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13
                                              ),
                                            ),
                                            Text("${getTranslated(context, "DUE_ON")} : 01/06/2023",
                                              style:TextStyle(
                                                  color: colors.darkBlue,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${getTranslated(context, "VACCINE")} : FMD",
                                              style:TextStyle(
                                                  color: colors.darkBlue,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13
                                              ),
                                            ),
                                            Text("${getTranslated(context, "DUE_ON")} : 01/06/2023",
                                              style:TextStyle(
                                                  color: colors.darkBlue,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: colors.whiteTemp,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: colors.black54.withOpacity(0.3), // Specify your desired border color here
                                      width: 1.0, // Adjust the border width
                                    ),
                                  ),),
                                padding: EdgeInsets.all(15),
                                // margin: EdgeInsets.only(left: 15,right: 15),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${getTranslated(context, "MATTING_RECORD")}",
                                          style:TextStyle(
                                              color: colors.blackTemp.withOpacity(0.5),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13
                                          ),),
                                        SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/2.3,
                                              child: Text("${getTranslated(context, "LAST_DELIVERY")} On 05/02/2023",
                                                style:TextStyle(
                                                    color: colors.darkBlue,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width/3,
                                              child: Text("${getTranslated(context, "EMPTY_SINCE")} : 145 days",
                                                style:TextStyle(
                                                    color: colors.darkBlue,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: colors.whiteTemp,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: colors.black54.withOpacity(0.3), // Specify your desired border color here
                                      width: 1.0, // Adjust the border width
                                    ),
                                  ),),
                                padding: EdgeInsets.all(15),
                                // margin: EdgeInsets.only(left: 15,right: 15),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${getTranslated(context, "BREEDING_RECORD")}",
                                          style:TextStyle(
                                              color: colors.blackTemp.withOpacity(0.5),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13
                                          ),),
                                        SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/2.5,
                                              child: Text("${getTranslated(context, "MATTING_DATE")} : 01/02/2023",
                                                style:TextStyle(
                                                    color: colors.darkBlue,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width/3,
                                              child: Text("${getTranslated(context, "EXP._DATE")} : 01/06/2023",
                                                style:TextStyle(
                                                    color: colors.darkBlue,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),


                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: colors.whiteTemp,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: colors.black54.withOpacity(0.3), // Specify your desired border color here
                                      width: 1.0, // Adjust the border width
                                    ),
                                  ),),
                                padding: EdgeInsets.all(15),
                                // margin: EdgeInsets.only(left: 15,right: 15),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${getTranslated(context, "MILK_RECORD")}",
                                          style:TextStyle(
                                              color: colors.blackTemp.withOpacity(0.5),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13
                                          ),),
                                        SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/2.5,
                                              child: Text("${getTranslated(context, "LAST_MILK_RECORD")}  25/06/2023",
                                                style:TextStyle(
                                                    color: colors.darkBlue,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width/3,
                                              child: Text("${getTranslated(context, "TOTAL_MILK")} : 15L",
                                                style:TextStyle(
                                                    color: colors.darkBlue,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),


                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right:110,
                  left: 110,
                  top: 150,
                  child: Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width/19,
                      height: MediaQuery.of(context).size.height/6.5,
                      padding: EdgeInsets.all(20),
                      child: Image.asset("assets/images/Group 72309.png",
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                )

              ]
          ) ,
        ),
      ),
    );
  }
}
