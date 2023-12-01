import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';


import '../Helper/Appbar.dart';
import '../Helper/CustomCard.dart';
import '../Screens/AddMedicineSchedule.dart';
import '../Utils/Colors.dart';

class MedicineScheduleRecord extends StatefulWidget {
  const MedicineScheduleRecord({Key? key}) : super(key: key);

  @override
  State<MedicineScheduleRecord> createState() => _MedicineScheduleRecordState();
}

class _MedicineScheduleRecordState extends State<MedicineScheduleRecord> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(

      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "MEDICINE_SCHEDULE_RECORD"),
        isTrue: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMedicineSchedule()));

          // Action to perform when the button is pressed.
          // For example, navigate to a new screen or show a dialog.
        },
        child: Icon(Icons.add),
        backgroundColor: colors.darkBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Text(
                  getTranslated(context, "SCAN_MEDICINE_ID"),
                  style: TextStyle(color: colors.blacktextColor),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              child: Container(
                height: 55,
                child: TextFormField(
                  textAlign: TextAlign.start,
                  // controller: supplementController,
                  decoration: InputDecoration(
                      suffixIcon: Container(
                        padding: EdgeInsets.all(10),

                        child: Image.asset(
                            "assets/images/Group 72309.png",
                        height: 5,
                            width: 5,),
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

            InkWell(
              onTap: (){
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>AddWeight(tagid: '',
                //     breed: '', age: '', weight: '',)));
              },
              child: CustomCard4(
                  name1: 'Disease : Fever',
                  name2: 'Batch : ABC2024',
                  name3: 'Medicine id : M002',
                  name4: 'Medicine Name : cipla o2',
                  name5: 'Expiry : July-2024',
                  name6: 'Balance : 5 ML'),
            ),
            CustomCard4(
                name1: 'Disease : lose motion',
                name2: 'Batch : XYZ2022',
                name3: 'Medicine id : M008',
                name4: 'Medicine Name : zentak 100 mg',
                name5: 'Expiry : AUG-2025',
                name6: 'Balance : 150 ML'),
            CustomCard4(
                name1: 'Medicine Name : ET/TT',
                name2: 'Batch : XYZ2021',
                name3: 'Medicine id : M012',
                name4: 'Company : SUNFARMA',
                name5: 'Expiry : AUG-2024',
                name6: 'Balance : 150 ML'),
          ],
        ),
      ),

    );
  }
}