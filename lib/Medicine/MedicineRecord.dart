import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';


import '../Helper/Appbar.dart';
import '../Helper/CustomCard.dart';
import '../Utils/Colors.dart';
import 'NewMedicine.dart';


class MedicineRecord extends StatefulWidget {
  const MedicineRecord({Key? key}) : super(key: key);

  @override
  State<MedicineRecord> createState() => _MedicineRecordState();
}

class _MedicineRecordState extends State<MedicineRecord> {
  // bool currentindex1 = false;
  // bool currentindex2 = false;
  @override
  void initState() {
    // TODO: implement initState
    // currentindex1=true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewMedicine()));

          // Action to perform when the button is pressed.
          // For example, navigate to a new screen or show a dialog.
        },
        child: Icon(Icons.add),
        backgroundColor: colors.darkBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "MEDICINE_RECORD"),
        isTrue: true,
      ),      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [

            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                 Text(
                  getTranslated(context, "SCAN"),
                  style: TextStyle(color: colors.blacktextColor),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: TextFormField(
                // controller: supplementController,
                decoration: InputDecoration(
                    suffixIcon:Container(
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
            Container(
              padding: EdgeInsets.all(5),
              // height: size.height / 3.5,
              // width: size.width / 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      CustomCard4(
                          name1: "${getTranslated(context, "DISEASE")} : PPR",
                          name2: "${getTranslated(context, "BATCH")} :ABC2024",
                          name3: "${getTranslated(context, "MEDICINE_ID")}  id : SP001",
                          name4: "${getTranslated(context, "MEDICINE_NAME")} :ZINTAK",
                          name5: "${getTranslated(context, "EXPIRY")} : July-2024",
                          name6: "${getTranslated(context, "BALANCE")} : 5 ML"),
                      CustomCard4(
                          name1: "${getTranslated(context, "DISEASE")} : FMD",
                          name2: "${getTranslated(context, "BATCH")} :XYZ2022",
                          name3: "${getTranslated(context, "MEDICINE_ID")} : SP001",
                          name4: "${getTranslated(context, "MEDICINE_NAME")} : SUNFARMA",
                          name5: "${getTranslated(context, "EXPIRY")} : AUG-2025",
                          name6: "${getTranslated(context, "BALANCE")} :150 ML"),
                      // CustomCard4(
                      //     name1: "Medicine Name:ET/TT",
                      //     name2: "Batch:XYZ2021",
                      //     name3: "Consume:400 ML",
                      //     name4: "Company:SUNFARMA",
                      //     name5: "Expiry: AUG-2024",
                      //     name6: "Balance:100 ML"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
            ),
          ],
        ),
    ),
      ),
    );
  }
}