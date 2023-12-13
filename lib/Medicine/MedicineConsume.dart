import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';

import '../Helper/Appbar.dart';
import '../Utils/Colors.dart';

class MedicineConsume extends StatefulWidget {
  const MedicineConsume({Key? key}) : super(key: key);

  @override
  State<MedicineConsume> createState() => _MedicineConsumeState();
}

class _MedicineConsumeState extends State<MedicineConsume> {
  TextEditingController textController = TextEditingController();
  String dropdownValue = 'PPR';
  String dropdownValue2 = 'Paracetamol';
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
          context: context,
          text: getTranslated(context, "MEDICINE_CONSUME"),
          isTrue: true,
        ),
        backgroundColor: colors.grad1Color,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(getTranslated(context, "TAG_ID"),),
                SizedBox(
                  height: 5,
                ),
                Card(
                  color: Colors.white,
                  elevation: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    height: 50,
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: textController,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: getTranslated(context, "SCAN/ENTER"),
                          filled: true,
                          border: InputBorder.none, // Remove underline
                          //labelText: 'Text Field',

                          suffixIcon: Container(
                            padding: EdgeInsets.all(10),
                            child: Image.asset("assets/images/Group 72309.png"),
                          ),
                    ),
                  ),
                ),),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${getTranslated(context, "TAG ID")}: F001',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        '${getTranslated(context, "CATEGORY")} : Sheep',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        '${getTranslated(context, "AGE")} : 12 M',
                        style: TextStyle(fontSize: 12),
                      ),
                      Container(
                        width: 50,
                        child: Text(
                          '${getTranslated(context, "WEIGHT")}: 25 kg',
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(getTranslated(context, "DISEASE")),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.white,
                          elevation: 4,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 50,
                            color: Colors.white,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: Container(),
                              value: dropdownValue,
                              hint: Text('PPR'),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'PPR',
                                'PRP'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("${getTranslated(context, "LAST_MEDICINE")} : Albomer"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("25/06/2023")
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(getTranslated(context, "MEDICINE")),
                SizedBox(
                  height: 5,
                ),
                Card(
                  color: Colors.white,
                  elevation: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      underline: Container(),
                      value: dropdownValue2,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue2 = newValue!;
                        });
                      },
                      items: <String>['Paracetamol', 'Paracetamol2']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${getTranslated(context, "MEDICINE_ID")} : CP01',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        '${getTranslated(context, "DUE_ON")} : 06/06/2023 (10:00)',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(' ${getTranslated(context, "SCAN_MEDICINE_ID")}: CP01'),
                SizedBox(
                  height: 5,
                ),
                Card(
                  color: Colors.white,
                  elevation: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    height: 50,
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: textController,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: getTranslated(context, "SCAN/ENTER"),
                          filled: true,
                          border: InputBorder.none, // Remove underline
                          //labelText: 'Text Field',

                        suffixIcon: Container(
                          padding: EdgeInsets.all(10),
                          child: Image.asset("assets/images/Group 72309.png"),
                        ),
                    ),
                  ),
                ),),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(getTranslated(context, "BATCH_NO")),
                        SizedBox(
                          height: 5,
                        ),
                        Card(
                          color: Colors.white,
                          elevation: 4,
                          child: Container(
                            height: 40,
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Center(
                              child: Text(
                                "525625",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(width: 16),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(getTranslated(context, "EXP._DATE")),
                        SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () => _selectDate(context),
                          child: Card(
                            color: Colors.white,
                            elevation: 4,
                            child: Container(
                              height: 40,
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Center(
                                child: Text(
                                  "${selectedDate.toLocal()}".split(' ')[0],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Expanded(
                    //   child: ElevatedButton(
                    //     onPressed: () => _selectTime2(context),
                    //     child: Text('Select time 2'),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(getTranslated(context, "RECOMMENDED_DOSE")),
                SizedBox(
                  height: 5,
                ),
                Card(
                  color: Colors.white,
                  elevation: 4,
                  child: Container(
                    height: 40,
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Center(
                      child: Text(
                        "2.5 ML",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(getTranslated(context, "DOSE_QTY")),
                SizedBox(
                  height: 5,
                ),
                Card(
                  color: Colors.white,
                  elevation: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    height: 50,
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      controller: textController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: ' ',
                        filled: true,
                        border: InputBorder.none, // Remove underline
                        //labelText: 'Text Field',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('${getTranslated(context, "DIRECTION")}: How to do vaccine'),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 30, left: 15, right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    color: colors.secondary,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Text(
                          getTranslated(context, "SAVE"),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}