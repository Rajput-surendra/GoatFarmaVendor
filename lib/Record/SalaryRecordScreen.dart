import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';

import '../../Helper/Appbar.dart';
import '../../Utils/Colors.dart';

class SalaryRecord extends StatefulWidget {
  const SalaryRecord({Key? key}) : super(key: key);

  @override
  State<SalaryRecord> createState() => _SalaryRecordState();
}

class _SalaryRecordState extends State<SalaryRecord> {
  int year=2023;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "SALARY_RECORD"),
        isTrue: true,
      ),
      backgroundColor: colors.grad1Color,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.white,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            year=year-1;
                          });
                        },
                        child: Icon(Icons.arrow_back_ios_new_outlined,color: colors.darkBlue,
                        size: 19),
                      ),
                      Text("${year}",style: TextStyle(
                        color: colors.darkBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            year=year+1;
                          });
                        },
                        child: Icon(Icons.arrow_forward_ios_outlined,color: colors.darkBlue,
                        size: 19,),
                      ),
                    ],
                  )
              ),
            ),
          ),
          Container(
          margin: EdgeInsets.only(left: 15,right: 15),
            child: Column(
              children: [
                Container(

                  padding: EdgeInsets.all(18),
                  // margin: EdgeInsets.only(left: 15,right: 15),
                  decoration: BoxDecoration(
                    color: colors.whiteTemp,
                    border: Border(
                      bottom: BorderSide(
                        color: colors.black54.withOpacity(0.3), // Specify your desired border color here
                        width: 1.0, // Adjust the border width
                      ),
                    ),),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Jul-23",
                                style:TextStyle(
                                    color: colors.darkBlue,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text("Total Days : 31",
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(getTranslated(context, "PAID_ON"),
                                style:TextStyle(
                                    color: colors.darkBlue,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text("Net Pay : 12500 /-",
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
                  padding: EdgeInsets.all(18),
                  // margin: EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Jun-23",
                                style:TextStyle(
                                    color: colors.darkBlue,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text("Total Days : 15",
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Paid On",
                                style:TextStyle(
                                    color: colors.darkBlue,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text("Net Pay : 6200 /-",
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
                  padding: EdgeInsets.all(18),
                  // margin: EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("May-23",
                                style:TextStyle(
                                    color: colors.darkBlue,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text("Total Days : 31",
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Paid On",
                                style:TextStyle(
                                    color: colors.darkBlue,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text("Net Pay : 12500 /-",
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
                  padding: EdgeInsets.all(18),
                  // margin: EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Apr-23",
                                style:TextStyle(
                                    color: colors.darkBlue,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text("Total Days : 28",
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Paid On",
                                style:TextStyle(
                                    color: colors.darkBlue,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text("Net Pay : 10500 /-",
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
          )

        ],
      ),
    );
  }
}
