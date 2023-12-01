import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';

import '../Helper/AppBtn.dart';
import '../Utils/Colors.dart';
import '../helper/appbar.dart';

class DownloadReport extends StatefulWidget {
  const DownloadReport({Key? key}) : super(key: key);

  @override
  State<DownloadReport> createState() => _DownloadReportState();
}

class _DownloadReportState extends State<DownloadReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: customAppBar(isTrue:true,text: getTranslated(context, "DOWNLOAD_REPORT"),onTaped: (){},context: context,),
        // appBar: getAppbar(context: context, text:"Goat ", isTrue: true, ),
        backgroundColor:colors.grad1Color,
        body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 70,
                              child: Text("Tag Id: F002",
                                style: TextStyle(
                                    fontSize: 12
                                ),
                                overflow: TextOverflow.ellipsis,),
                            ),
                            Container(
                              width: 70,
                              child: Text("Breed : Sirohi",
                                style: TextStyle(
                                    fontSize: 12
                                ),),
                            ),
                            Container(
                              width: 70,
                              child: Text("Gender : Male",
                                style: TextStyle(
                                    fontSize: 12
                                ),),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width:70,
                              child: Text("Birth Date:01/02/2023",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Text("Age : 6 month",
                              style: TextStyle(
                                  fontSize: 12
                              ),),
                            Text("Weight : 25 kg",
                              style: TextStyle(
                                  fontSize: 12
                              ),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Father : G001(Osmanabad)",
                              style: TextStyle(
                                  fontSize: 12
                              ),),
                            Text("Mother : G002(Sirohi)",
                              style: TextStyle(
                                  fontSize: 12
                              ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(getTranslated(context, "VACCINATION"),style: TextStyle(color: colors.darkBlue,fontWeight: FontWeight.w500,fontSize: 18),),
                  SizedBox(height: 15,),
                  Card(child:
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.white,
                    child:Padding(padding: EdgeInsets.all(8),
                      child: Table(
                        // Set the border property to remove cell borders
                        border: TableBorder.symmetric(
                          // inside: BorderSide.none,
                          outside: BorderSide.none,
                        ),
                        children: [
                          // Create a table row
                          TableRow(
                            children: [
                              // Create a table cell with text
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      getTranslated(context, "DATE"),
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),
                              // Create another table cell with text
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                  getTranslated(context, "VACCINE"),
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      getTranslated(context, "BATCH"),
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      getTranslated(context, "EXP_DATE"),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      getTranslated(context, "DOSE"),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),

                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              // Create a table cell with text

                              // Create another table cell with text
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('01/05/2023'),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('TTR'),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('123'),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('2025'),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('2.5 ml'),
                                ),
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),),
                  SizedBox(height: 15,),
                  Text(getTranslated(context, "WEIGHT"),style: TextStyle(color: colors.darkBlue,fontWeight: FontWeight.w500,fontSize: 18),),
                  SizedBox(height: 15,),
                  Card(child:
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.white,
                    child:Padding(padding: EdgeInsets.all(8),
                      child: Table(
                        // Set the border property to remove cell borders
                        border: TableBorder.symmetric(
                          // inside: BorderSide.none,
                          outside: BorderSide.none,
                        ),
                        children: [
                          // Create a table row
                          TableRow(
                            children: [
                              // Create a table cell with text
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      getTranslated(context, "DATE"),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),
                              // Create another table cell with text
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      getTranslated(context, "WEIGHT"),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      getTranslated(context, "MONTH"),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      getTranslated(context, "WEIGHT_GAIN"),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),

                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),

                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              // Create a table cell with text

                              // Create another table cell with text
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('01/05/2023'),
                                ),
                              ),

                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('23.5'),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('6'),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('5'),
                                ),
                              ),

                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),

                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              // Create a table cell with text

                              // Create another table cell with text
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('01/05/2023'),
                                ),
                              ),

                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('25'),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('7'),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('1.5'),
                                ),
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),),
                  SizedBox(height: 15,),
                  Text(getTranslated(context, "MATINGS_MALE_FEMALE"),style: TextStyle(color: colors.darkBlue,fontWeight: FontWeight.w500,fontSize: 18),),
                  SizedBox(height: 15,),
                  Card(child:
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.white,
                    child:Padding(padding: EdgeInsets.all(8),
                      child: Table(
                        // Set the border property to remove cell borders
                        border: TableBorder.symmetric(
                          // inside: BorderSide.none,
                          outside: BorderSide.none,
                        ),
                        children: [
                          // Create a table row
                          TableRow(
                            children: [
                              // Create a table cell with text
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      getTranslated(context, "DATE"),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),
                              // Create another table cell with text
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      'Male/Female Tag',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      getTranslated(context, "BREED"),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                     getTranslated(context, "NUG_OF_BREED"),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),

                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),

                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              // Create a table cell with text

                              // Create another table cell with text
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('01/05/2023'),
                                ),
                              ),

                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('G001'),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('Sirohi'),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('2'),
                                ),
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),),
                  SizedBox(height: 15,),
                  Text(getTranslated(context, "BREEDING(if Female)"),style: TextStyle(color: colors.darkBlue,fontWeight: FontWeight.w500,fontSize: 18),),
                  SizedBox(height: 15,),
                  Card(child:
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.white,
                    child:Padding(padding: EdgeInsets.all(8),
                      child: Table(
                        // Set the border property to remove cell borders
                        border: TableBorder.symmetric(
                          // inside: BorderSide.none,
                          outside: BorderSide.none,
                        ),
                        children: [
                          // Create a table row
                          TableRow(
                            children: [
                              // Create a table cell with text
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      getTranslated(context, "DATE"),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),
                              // Create another table cell with text
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      getTranslated(context, "TAG"),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      getTranslated(context, "GENDER"),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      getTranslated(context, "WEIGHT"),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),

                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),

                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              // Create a table cell with text

                              // Create another table cell with text
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('01/05/2023',),
                                ),
                              ),

                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('EF002'),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('Female'),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('2.5 kg'),
                                ),
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),),
                  SizedBox(height: 15,),
                  Text(getTranslated(context, "SALE_DETAIL"),style: TextStyle(color: colors.darkBlue,fontWeight: FontWeight.w500,fontSize: 18),),
                  SizedBox(height: 15,),
                  Card(child:
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.white,
                    child:Padding(padding: EdgeInsets.all(8),
                      child: Table(
                        // Set the border property to remove cell borders
                        border: TableBorder.symmetric(
                          // inside: BorderSide.none,
                          outside: BorderSide.none,
                        ),
                        children: [
                          // Create a table row
                          TableRow(
                            children: [
                              // Create a table cell with text
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      getTranslated(context, "DATE"),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),
                              // Create another table cell with text
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      getTranslated(context, "RATE_PER_KG"),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      getTranslated(context, "WEIGHT"),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Text(
                                      getTranslated(context, "PRICE"),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                  ),
                                ),
                              ),

                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),

                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                              TableCell(
                                child: Divider(
                                  color: Colors.grey,  // Customize the line color
                                  thickness: 1,  // Set the thickness of the line
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              // Create a table cell with text

                              // Create another table cell with text
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('01/05/2023'),
                                ),
                              ),

                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('450'),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('27'),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('12150'),
                                ),
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),),
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Btn(title: getTranslated(context, "DOWNLOAD"),height: 45,width:MediaQuery.of(context).size.width/1.2,)
                    ],
                  )

                ],
              )
            ],
          ),
        )
    );
  }
}
