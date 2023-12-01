import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../Helper/AppBtn.dart';
import '../Helper/Appbar.dart';
import '../Utils/Colors.dart';
// import '../Helper/toast.dart';

class AddSupplement extends StatefulWidget {
  const AddSupplement({Key? key}) : super(key: key);

  @override
  State<AddSupplement> createState() => _AddSupplementState();
}

class _AddSupplementState extends State<AddSupplement> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    supplementController.text = "SP001";
  }

  String? catValue;

  final List<String> catValueitems = [
    'Categories',
    'breed Categories1',
    'breed Categories2'
  ];

  String? supplementValue;

  final List<String> supplementValueitems = [
    'Categories',
    'breed Categories1',
    'breed Categories2'
  ];

  String? typeValue;

  final List<String> typeValueitems = [
    'Categories',
    'breed Categories1',
    'breed Categories2'
  ];

  String? weightValue;

  final List<String> weightValueitems = ['45 kg', '48 kg', '30 kg'];

  String? supplementSelectValue;

  final List<String> supplementSelectValueitems = ['MAKKA', 'GENHU', 'CHANA'];

  TextEditingController supplementController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: colors.grad1Color,
        appBar: customAppBar(
          context: context,
          text: "Add Supplement",
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
                                    "Supplement ID",
                                    style: TextStyle(color: colors.blacktextColor),
                                  ),
                                ],
                              ),
                              Card(
                                child: Container(
                                  height: 55,
                                  child: Center(
                                    child: TextFormField(
                                      controller: supplementController,
                                      decoration: InputDecoration(
                                          suffixIcon: Container(
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
                                          "Category",
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
                                                "Select Category",
                                                style: TextStyle(
                                                    color: colors.blackTemp,
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: 12),
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
                                          "Breed Type",
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
                                                "Select Breed",
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
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Supplement Name",
                          style: TextStyle(color: colors.blacktextColor),
                        ),
                      ],
                    ),
                    Card(
                      child: Container(
                        height: 55,
                        child: TextFormField(
                          decoration: InputDecoration(
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
                                        Text(
                                          "Supplement",
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
                                                "Type",
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
                                          "Weight",
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
                                                "Select Weight",
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
                    Card(
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        // height: size.height / 4,
                        width: size.width / 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text(
                                  "Name",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: colors.secondary),
                                ),

                                Text(
                                  "Percentage",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: colors.secondary),
                                ),

                                Text(
                                  "Unit",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: colors.secondary),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Table(
                              border: TableBorder.all(),
                              // defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                              children: [
                                // SizedBox(width: 10,),
                                TableRow(children: [
                                  Center(
                                      child: Text(
                                        "Makka",
                                        textScaleFactor: 1.2,
                                      )),
                                  Center(child: Text("48", textScaleFactor: 1.2)),
                                  Center(child: Text("kg", textScaleFactor: 1.2)),
                                ]),

                                TableRow(children: [
                                  Center(
                                      child: Text(
                                        "GAHU",
                                        textScaleFactor: 1.2,
                                      )),
                                  Center(child: Text("30", textScaleFactor: 1.2)),
                                  Center(child: Text("kg", textScaleFactor: 1.2)),
                                ]),

                                TableRow(children: [
                                  Center(
                                      child: Text(
                                        "SOYABIN",
                                        textScaleFactor: 1.2,
                                      )),
                                  Center(child: Text("10", textScaleFactor: 1.2)),
                                  Center(child: Text("kg", textScaleFactor: 1.2)),
                                ]),

                                TableRow(children: [
                                  Center(
                                      child: Text(
                                        "SERKI DHEP",
                                        textScaleFactor: 1.2,
                                      )),
                                  Center(child: Text("10", textScaleFactor: 1.2)),
                                  Center(child: Text("kg", textScaleFactor: 1.2)),
                                ]),

                                TableRow(children: [
                                  Center(
                                      child: Text(
                                        "MINARAL",
                                        textScaleFactor: 1.2,
                                      )),
                                  Center(child: Text("1", textScaleFactor: 1.2)),
                                  Center(child: Text("kg", textScaleFactor: 1.2)),
                                ]),

                                TableRow(children: [
                                  Center(
                                      child: Text(
                                        "MITH",
                                        textScaleFactor: 1.2,
                                      )),
                                  Center(child: Text("1", textScaleFactor: 1.2)),
                                  Center(child: Text("kg", textScaleFactor: 1.2)),
                                ]),
                              ],
                            ),
                          ],
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
                          "Khurak Dose",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: colors.secondary),
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
                        Text("Schedule",
                            style: TextStyle(color: colors.blacktextColor)),
                      ],
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 3, bottom: 3),
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
                            value: supplementSelectValue,
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
                                supplementSelectValue = value!;
                              });
                            },

                            items: supplementSelectValueitems
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
                                          "Body Weight",
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
                                                "1 kg",
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
                                          "Dose",
                                          style: TextStyle(
                                              color: colors.blacktextColor),
                                        ),
                                      ],
                                    ),
                                    Card(
                                      child: Container(

                                          height: 50,
                                          width: MediaQuery.of(context).size.width/2,
                                          child: TextFormField(

                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(top: 2,left: 5),
                                                border: InputBorder.none),
                                          )),
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
                    SizedBox(
                      height: 10,
                    ),
                    Btn(
                      onPress: () {
                        Navigator.pop(context);
                        if (_formKey.currentState!.validate()) {
                        } else {
                          // showSnackbarMessage(context,"sdsdsdsdsf");
                        }
                      },
                      height: 50,
                      title: "Save",
                    )
                  ],
                ),
              ),
            ),
            ),
       );
    }
}
