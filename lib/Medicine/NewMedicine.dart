import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/CustomButton.dart';
import 'package:madhu_farma/Helper/session.dart';
import 'package:madhu_farma/Medicine/MedicineConsume.dart';


import '../Helper/Appbar.dart';
import '../Utils/Colors.dart';


class NewMedicine extends StatefulWidget {
  const NewMedicine({Key? key}) : super(key: key);

  @override
  State<NewMedicine> createState() => _NewMedicineState();
}

final _formKey = GlobalKey<FormState>();
String? catValue;

final List<String> catValueitems = [
  'Categories',
  'breed Categories1',
  'breed Categories2'
];
String? weightValue;

final List<String> weightValueitems = ['45 kg', '48 kg', '30 kg'];

String? typeValue;

final List<String> typeValueitems = [
  'Categories',
  'breed Categories1',
  'breed Categories2'
];
String? male;



class _NewMedicineState extends State<NewMedicine> {
  final _medicineIdctr=TextEditingController();
  final _medicineNameCtr=TextEditingController();
  final _MgfDatectr=TextEditingController();
  final _expDatectr=TextEditingController();
  final _bodyWeightctr=TextEditingController();
  final _Directionctr=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: colors.grad1Color,
        appBar: customAppBar(
          context: context,
          text: getTranslated(context, "NEW_MEDICINE"),
          // getProperty(context,"NEW_MEDICINE"),
          isTrue: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                            getTranslated(context, "MEDICINE_TYPE"),
                          style: TextStyle(color: colors.blacktextColor),
                        ),
                      ],
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 3, bottom: 3),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint:  Padding(
                              padding: EdgeInsets.only(bottom: 0),
                              child: Text(getTranslated(context, "SELECTED_CATEGORY"),
                                style: TextStyle(
                                    color: colors.blackTemp,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
                            ),
                            // dropdownColor: colors.primary,
                            value: catValue,
                            icon: const Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: colors.secondary,
                                size: 30,
                              ),
                            ),
                            // elevation: 16,
                            style: TextStyle(
                                color: colors.secondary,
                                fontWeight: FontWeight.bold),
                            underline: Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0),
                              child: Container(
                                // height: 2,
                                color: colors.whiteTemp,
                              ),
                            ),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                catValue = value!;
                              });
                            },

                            items: catValueitems
                                .map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(4.0),
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                                color: colors.textColor,
                                                fontWeight:
                                                FontWeight.normal),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                ).toList(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    getTranslated(context, "MEDICINE_ID"),
                                    style: TextStyle(color: colors.blacktextColor),
                                  ),
                                ],
                              ),
                              Card(
                                child: Container(
                                  height: 55,
                                  child: TextFormField(
                                    controller: _medicineIdctr,
                                    decoration: InputDecoration(
                                        suffixIcon: Container(
                                          height: 10,
                                          width: 10,
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset("assets/images/Group 72309.png"),
                                        ),
                                        contentPadding: EdgeInsets.only(left: 10),
                                        border: InputBorder.none),
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
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 5,),
                                Text(
                                  getTranslated(context, "DISEASE")
                                ,style: TextStyle(color: colors.blacktextColor),),
                              ],
                            ),

                            Card(
                              child: Container(
                                width: size.width / 2.3,
                                // height: size.height / 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    isExpanded: true,
                                    hint: const Padding(
                                      padding: EdgeInsets.only(bottom: 0),
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                            color: colors.blackTemp,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14),
                                      ),
                                    ),
                                    // dropdownColor: colors.primary,
                                    value: weightValue,
                                    icon: const Padding(
                                      padding: EdgeInsets.only(right: 5),
                                      child: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: colors.secondary,
                                        size: 30,
                                      ),
                                    ),
                                    // elevation: 16,
                                    style: TextStyle(
                                        color: colors.secondary,
                                        fontWeight: FontWeight.bold),
                                    underline: Padding(
                                      padding: const EdgeInsets.only(left: 0, right: 0),
                                      child: Container(
                                        // height: 2,
                                        color: colors.whiteTemp,
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
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Text(
                                                value,
                                                style: const TextStyle(
                                                    color: colors.textColor,
                                                    fontWeight: FontWeight.normal),
                                              ),
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
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 5,),
                                Text(
                                  getTranslated(context, "MEDICINE_NAME"),
                                  style: TextStyle(color: colors.blacktextColor),
                                ),
                              ],
                            ),

                            // TextFormCard(
                            //   name:"${getTranslated(context, "MEDICINE_NAME")}" ,
                            //   width: MediaQuery.of(context).size.width/2.3,
                            //   controller: _medicineNameCtr,
                            //   validString:getTranslated(context, "MEDICINE_NAME"),
                            // ),

                            Card(
                              elevation: 1.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child:Container(
                                  width: size.width/2.2,
                                  child: TextFormField(
                                    cursorHeight: 20,
                                    decoration: InputDecoration(border: InputBorder.none),
                                    validator: (value){
                                      if(value?.length==null||value!.isEmpty){
                                         return "${getTranslated(context, "MEDICINE_NAME")} ${getTranslated(context, "IS_REQUIRED")}";
                                      }
                                    },
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),
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
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(getTranslated(context, "BATCH_NO.")
                                          ,
                                          style: TextStyle(
                                              color: colors.blacktextColor),
                                        ),
                                      ],
                                    ),
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 3, bottom: 3),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton2<String>(
                                            isExpanded: true,
                                            hint: const Padding(
                                              padding: EdgeInsets.only(bottom: 0),
                                              child: Text(
                                                "",
                                                style: TextStyle(
                                                    color: colors.blackTemp,
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: 14),
                                              ),
                                            ),
                                            // dropdownColor: colors.primary,
                                            value: typeValue,
                                            icon: const Padding(
                                              padding: EdgeInsets.only(right: 5),
                                              child: Icon(
                                                Icons.keyboard_arrow_down_rounded,
                                                color: colors.secondary,
                                                size: 30,
                                              ),
                                            ),
                                            // elevation: 16,
                                            style: TextStyle(
                                                color: colors.secondary,
                                                fontWeight: FontWeight.bold),
                                            underline: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, right: 0),
                                              child: Container(
                                                // height: 2,
                                                color: colors.whiteTemp,
                                              ),
                                            ),
                                            onChanged: (String? value) {
                                              // This is called when the user selects an item.
                                              setState(() {
                                                typeValue = value!;
                                              });
                                            },

                                            items: typeValueitems
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.all(4.0),
                                                          child: Text(
                                                            value,
                                                            style: const TextStyle(
                                                                color: colors.textColor,
                                                                fontWeight:
                                                                FontWeight.normal),
                                                          ),
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
                              SizedBox(
                                height: 10,
                              ),
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
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          getTranslated(context, "QTY")
                                          ,
                                          style: TextStyle(
                                              color: colors.blacktextColor),
                                        ),
                                      ],
                                    ),
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 3, bottom: 3),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton2<String>(
                                            isExpanded: true,
                                            hint: const Padding(
                                              padding: EdgeInsets.only(bottom: 0),
                                              child: Text(
                                                "",
                                                style: TextStyle(
                                                    color: colors.blackTemp,
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: 14),
                                              ),
                                            ),
                                            // dropdownColor: colors.primary,
                                            value: weightValue,
                                            icon: const Padding(
                                              padding: EdgeInsets.only(right: 5),
                                              child: Icon(
                                                Icons.keyboard_arrow_down_rounded,
                                                color: colors.secondary,
                                                size: 30,
                                              ),
                                            ),
                                            // elevation: 16,
                                            style: TextStyle(
                                                color: colors.secondary,
                                                fontWeight: FontWeight.bold),
                                            underline: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, right: 0),
                                              child: Container(
                                                // height: 2,
                                                color: colors.whiteTemp,
                                              ),
                                            ),
                                            onChanged: (String? value) {
                                              // This is called when the user selects an item.
                                              setState(() {
                                                weightValue = value!;
                                              });
                                            },

                                            items: weightValueitems
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.all(4.0),
                                                          child: Text(
                                                            value,
                                                            style: const TextStyle(
                                                                color: colors.textColor,
                                                                fontWeight:
                                                                FontWeight.normal),
                                                          ),
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
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Row(
                              children: [
                                SizedBox(width: 5,),
                                Text(getTranslated(context, "MFG_DATE"),
                                  style: TextStyle(color: colors.blacktextColor),
                                ),
                              ],
                            ),
                            Card(
                              elevation: 1.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Container(
                                  width: size.width/2.2,
                                  child: TextFormField(
                                    decoration: InputDecoration(border: InputBorder.none),
                                    validator: (value){
                                      if(value?.length==null||value!.isEmpty){
                                        return "${getTranslated(context, "MFG_DATE")} ${getTranslated(context, "IS_REQUIRED")}";
                                      }
                                    },
                                  )),
                            ),
                            // SizedBox(
                            //   width: 150,
                            // ),

                          ],
                        ),


                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 5,),
                                Text(getTranslated(context, "EXP_DATE"),style: TextStyle(color: colors.blacktextColor),),
                              ],
                            ),
                            Card(
                              elevation: 1.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Container(
                                  width: size.width/2.35,
                                  child: TextFormField(
                                    decoration: InputDecoration(border: InputBorder.none),
                                    validator: (value){
                                      if(value?.length==null||value!.isEmpty){
                                        return "${getTranslated(context, "EXP_DATE")} ${getTranslated(context, "IS_REQUIRED")}";
                                      }
                                    },
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          getTranslated(context, 'MEDICINE_SCHEDULE'),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: colors.darkBlue),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          getTranslated(context, "CATEGORIES"),
                          style: TextStyle(color: colors.blacktextColor),
                        ),
                      ],
                    ),
                    Card(
                      child: Container(
                        width: size.width / 2.25,
                        height: size.height / 18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: const Padding(
                              padding: EdgeInsets.only(bottom: 0),
                              child: Text(
                                "ml",
                                style: TextStyle(
                                    color: colors.blackTemp,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
                            ),
                            // dropdownColor: colors.primary,
                            value: weightValue,
                            icon: const Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: colors.secondary,
                                size: 30,
                              ),
                            ),
                            // elevation: 16,
                            style: TextStyle(
                                color: colors.secondary,
                                fontWeight: FontWeight.bold),
                            underline: Padding(
                              padding: const EdgeInsets.only(left: 0, right: 0),
                              child: Container(
                                // height: 2,
                                color: colors.whiteTemp,
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            color: colors.textColor,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          getTranslated(context, 'BODY_WEIGHT'),
                          style: TextStyle(color: colors.blacktextColor,),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child:Container(
                          width: size.width/2.2,
                          child: TextFormField(
                            decoration: InputDecoration(border: InputBorder.none),
                            validator: (value){
                              if(value?.length==null||value!.isEmpty){
                                return "${getTranslated(context, "BODY_WEIGHT")} ${getTranslated(context, "IS_REQUIRED")}";
                              }
                            },
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          getTranslated(context, "DOSE"),
                          style: TextStyle(color: colors.blacktextColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Card(
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Container(
                              width: size.width/2.5,
                              child: TextFormField(
                                decoration: InputDecoration(border: InputBorder.none),
                                validator: (value){
                                  if(value?.length==null||value!.isEmpty){
                                    return "${getTranslated(context, "Dose")} ${getTranslated(context, "IS_REQUIRED")}";
                                  }
                                },
                              )),
                        ),
                        Card(
                          child: Container(
                            width: size.width / 2.7,
                            height: size.height / 18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: const Padding(
                                  padding: EdgeInsets.only(bottom: 0),
                                  child: Text(
                                    "ml",
                                    style: TextStyle(
                                        color: colors.blackTemp,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14),
                                  ),
                                ),
                                // dropdownColor: colors.primary,
                                value: weightValue,
                                icon: const Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: colors.secondary,
                                    size: 30,
                                  ),
                                ),
                                // elevation: 16,
                                style: TextStyle(
                                    color: colors.secondary,
                                    fontWeight: FontWeight.bold),
                                underline: Padding(
                                  padding: const EdgeInsets.only(left: 0, right: 0),
                                  child: Container(
                                    // height: 2,
                                    color: colors.whiteTemp,
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
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                                color: colors.textColor,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: size.height/20,
                          width: size.width/9,
                          child: Center(
                              child: Icon(
                                Icons.add,
                                color: colors.white70,
                                size: 30,
                              )),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: colors.darkBlue,
                          ),
                        ),
                      ],
                    ),
                    Card(
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(getTranslated(context, "CATEGORY"),
                                  style: TextStyle(
                                      fontSize: 14, color: colors.darkBlue),
                                ),
                                Text(getTranslated(context, "BODY_WEIGHT"),
                                  style: TextStyle(
                                      fontSize: 14, color: colors.darkBlue),
                                ),
                                Text(
                                  getTranslated(context, "DOSE"),
                                  style: TextStyle(
                                      fontSize: 14, color: colors.darkBlue),
                                ),
                                Text(
                                  "Unit",
                                  style: TextStyle(
                                      fontSize: 14, color: colors.darkBlue),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: colors.blacktextColor,
                                    // Specify your desired border color here
                                    width: 1.0, // Adjust the border width
                                  ),
                                ),
                              ),
                              child:
                              // leading: Icon(icon),
                              Container(
                                padding: const EdgeInsets.all(14.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // SizedBox(width: MediaQuery.of(context).size.width/23,),
                                    Text(
                                      "Goat",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: colors.blacktextColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "10",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: colors.blacktextColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "2",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: colors.blacktextColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "ml",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: colors.blacktextColor,
                                          fontWeight: FontWeight.w500),
                                    ),

                                  ],
                                ),
                              ),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: colors.blacktextColor,
                                    // Specify your desired border color here
                                    width: 1.0, // Adjust the border width
                                  ),
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(14.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // SizedBox(width: MediaQuery.of(context).size.width/23,),
                                    Text(
                                      "Sheep",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: colors.blacktextColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "10",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: colors.blacktextColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "3",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: colors.blacktextColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "ml",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: colors.blacktextColor,
                                          fontWeight: FontWeight.w500),
                                    ),

                                  ],
                                ),
                              ),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: colors.blacktextColor,
                                    // Specify your desired border color here
                                    width: 1.0, // Adjust the border width
                                  ),
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(14.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // SizedBox(width: MediaQuery.of(context).size.width/23,),
                                    Text(
                                      "cow",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: colors.blacktextColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "10",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: colors.blacktextColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "7",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: colors.blacktextColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "ml",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: colors.blacktextColor,
                                          fontWeight: FontWeight.w500),
                                    ),

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(width: 5,),
                        Text(
                          getTranslated(context, "DIRECTION")+" : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: colors.darkBlue),
                        ),
                      ],
                    ),

                    Card(
                      child: Container(
                          child: TextFormField(
                            decoration: InputDecoration(border: InputBorder.none),
                          )),
                    ),

                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(width: 5,),
                        Text(getTranslated(context, "MEDICINE_PREGNANT"),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      ],
                    ),

                    Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                                value: "male",
                                groupValue: male,
                                // activeColor: MyColors.primaryColor,
                                onChanged: (val) {
                                  setState(() {
                                    male = val!;
                                  });
                                }
                            ),
                            Text(getTranslated(context, "YES"),),

                            // ParagraphText('Male', fontSize: 15, color: MyColors.grey2,),
                          ],
                        ),

                        Row(
                          children: [
                            Radio(
                                value: "female",
                                groupValue: male,
                                //  activeColor: MyColors.primaryColor,
                                onChanged: (val) {
                                  setState(() {
                                    male = val!;
                                  });
                                }
                            ),

                            Text(getTranslated(context, "NO"),),
                            //ParagraphText('Female', fontSize: 15, color: MyColors.grey2,),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Btn(
                      onPress: (){
                        if(_formKey.currentState!.validate()){
                          Navigator.pop(context);
                        }
                      },
                      height:45,width: MediaQuery.of(context).size.width,
                      title: getTranslated(context, "SAVE"),
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>MadhuFarma17()));
                    //   },
                    //   child: Container(
                    //     width: size.width / 1.1,
                    //     height: size.height / 15,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(3),
                    //       color: colors.darkBlue,
                    //     ),
                    //     child: Center(
                    //         child: Text(
                    //             getTranslated(context, "SAVE"),
                    //           style: TextStyle(
                    //               fontSize: 19,
                    //               fontWeight: FontWeight.bold,
                    //               color: colors.transparent),
                    //         )),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
        ),
        );
  }
}
