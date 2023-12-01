import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';

import '../Helper/AppBtn.dart';
import '../Helper/CustomText.dart';
import '../Utils/Colors.dart';
import '../helper/appbar.dart';

class AddMedicineSchedule extends StatefulWidget {
  const AddMedicineSchedule({Key? key}) : super(key: key);

  @override
  State<AddMedicineSchedule> createState() => _AddMedicineScheduleState();
}

class _AddMedicineScheduleState extends State<AddMedicineSchedule> {
  @override

  final _formKey = GlobalKey<FormState>();
  final _tagId = TextEditingController();
  final _fromDays = TextEditingController();
  final _toDays = TextEditingController();
  final _orderQty = TextEditingController();
  final _PayMode = TextEditingController();
  final _Delivery = TextEditingController();
  final _ScanProd = TextEditingController();
  final _qty = TextEditingController();
  final _Curier = TextEditingController();
  final _trackingId = TextEditingController();
  final _remark = TextEditingController();

  String? Schedule;
  String? Disease;
  String? Medicine;
  String? Period;
  String? Time;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: 'Add Medicine Schedule', isTrue: true, context: context),
      body: SingleChildScrollView(
        child:Form(
          key: _formKey,
          child:Padding(padding: EdgeInsets.all(15),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custom_Text(text: 'Schedule'),
                SizedBox(height: 10,),
                Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                    child:
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        value:Schedule,
                        //elevation: 5,
                        style: TextStyle(color: Colors.black87),

                        items: <String>[
                          'aaa',
                          'bbb',
                          'ccc',
                          'ddd',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),


                        onChanged: (String? value)  {
                          setState(() {
                            Schedule= value!;
                          });
                        },
                        icon: Icon(Icons.keyboard_arrow_down),
                        underline: Container(  // Use a container with zero height to remove the underline
                          height: 0,
                          color: Colors.white,
                        ),
                      ),
                    )),
                SizedBox(height: 15,),
                Custom_Text(text: 'Tag ID*'),
                SizedBox(height: 10,),
                Card(
                  elevation: 2,
                  child:  TextFormField(
                    controller: _tagId,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.document_scanner_outlined,color: colors.black54,)
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(' Tag ID:f002',style: TextStyle(fontSize:12),),
                    Text('Breed:Sirohi',style: TextStyle(fontSize:12)),
                    Text('Age:4 (Month)',style: TextStyle(fontSize:12)),
                    Text('Weight: 35 kg ',style: TextStyle(fontSize:12)),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(text: " Disease"),
                        Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                            child:
                            Container(
                              width: MediaQuery.of(context).size.width/2.3,
                              color: Colors.white,
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                value:Disease,
                                //elevation: 5,
                                style: TextStyle(color: Colors.black87),

                                items: <String>[
                                  'aaa',
                                  'bbb',
                                  'ccc',
                                  'ddd',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),


                                onChanged: (String? value)  {
                                  setState(() {
                                    Disease= value!;
                                  });
                                },
                                icon: Icon(Icons.keyboard_arrow_down_sharp),
                                underline: Container(  // Use a container with zero height to remove the underline
                                  height: 0,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                        SizedBox(height: 10,),
                        Text(' Medicine ID : SP0104',style: TextStyle(fontWeight: FontWeight.w500),),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(text: " Medicine"),
                        Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                            child:
                            Container(
                              width: MediaQuery.of(context).size.width/2.45,
                              color: Colors.white,
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                value:Medicine,
                                //elevation: 5,
                                style: TextStyle(color: Colors.black87),

                                items: <String>[
                                  'aaa',
                                  'bbb',
                                  'ccc',
                                  'ddd',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),


                                onChanged: (String? value)  {
                                  setState(() {
                                    Medicine= value!;
                                  });
                                },
                                icon: Icon(Icons.keyboard_arrow_down_sharp),
                                underline: Container(  // Use a container with zero height to remove the underline
                                  height: 0,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                        SizedBox(height: 10,),
                        Text(' Expire Date:16/08/2023',style: TextStyle(fontWeight: FontWeight.w500,
                        fontSize: 10),),
                        SizedBox(height: 10,),

                      ],
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomColumnTextField(controller1: _toDays, text1: 'To Days'),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Custom_Text(text: " Time"),
                          SizedBox(height:5,),
                          Row(
                            children: [
                              Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                                  child:
                                  Container(
                                    width: MediaQuery.of(context).size.width/3.6,
                                    // color: Colors.white,
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      value:Time,
                                      //elevation: 5,
                                      style: TextStyle(color: Colors.black87),

                                      items: <String>[
                                        '10:00 AM',
                                        '12:00 PM',
                                        '05:00 PM',
                                        '08:00 PM',
                                      ].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),


                                      onChanged: (String? value)  {
                                        setState(() {
                                          Time= value!;
                                        });
                                      },
                                      icon: Icon(Icons.keyboard_arrow_down_sharp),
                                      underline: Container(  // Use a container with zero height to remove the underline
                                        height: 0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                              Card(
                                  color: colors.darkBlue,
                                  child: IconButton(
                                    onPressed:(){},
                                    icon: Icon(Icons.add,color: Colors.white,),)
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          // Text(' Medicine ID : SP0104',style: TextStyle(fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ]),
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
                                    'Medicine',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                ),
                              ),
                            ),
                            // Create another table cell with text
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child:  Text(
                                    'Period',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child:  Text(
                                    'From',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child:  Text(
                                    'Days',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child:  Text(
                                    'Time',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: colors.darkBlue)
                                ),
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
                                child: Text('PPR'),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Continous'),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('365'),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('1'),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Morning'),
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
                                child: Text('Caflog'),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('One Time'),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('1'),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('3'),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Mor & Evn'),
                              ),
                            ),
                          ],
                        ),
                        // Divider(color: ,),
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
                                child: Text('Albomar'),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Continous'),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('180'),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('1'),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Morning'),
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
                    Btn(title: 'Save',height: 45,width:MediaQuery.of(context).size.width/1.2,
                    onPress: (){
                      Navigator.pop(context);
                    },)
                  ],
                )
              ],
            ) ,
          ),

        ),
      ),
    );
  }
}