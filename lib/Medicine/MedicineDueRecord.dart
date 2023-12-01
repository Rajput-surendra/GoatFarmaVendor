import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';



import '../Helper/Appbar.dart';
import '../Helper/CustomCard.dart';
import '../Utils/Colors.dart';
import 'MedicineConsume.dart';

class MedicineDueRecord extends StatefulWidget {
  const MedicineDueRecord({Key? key}) : super(key: key);

  @override
  State<MedicineDueRecord> createState() => _MedicineDueRecordState();
}

class _MedicineDueRecordState extends State<MedicineDueRecord> {
  bool currentindex1 = false;
  bool currentindex2 = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>MedicineConsume()));
      },
        child: Icon(Icons.add),
        backgroundColor: colors.darkBlue,),
      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "MEDICINE_DUE_RECORD"),
        isTrue: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                 Text(
                  getTranslated(context, "TAG_ID"),
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
              child:TextFormField(
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
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      currentindex1 = true;

                      if (currentindex1 == true) {
                        currentindex2 = false;
                      }
                    });
                  },
                  child: Card(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      height: size.height / 18,
                      width: size.width / 3.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: currentindex1 == true
                            ? colors.darkBlue
                            : colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          getTranslated(context, "MEDICINE"),
                          style: TextStyle(
                              fontSize: 13,
                              color: currentindex1 == true
                                  ? colors.transparent
                                  : colors.textColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentindex2 = true;

                      if (currentindex2 == true) {
                        currentindex1 = false;
                      }
                    });
                  },
                  child: Card(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      height: size.height / 18,
                      width: size.width / 3.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: currentindex2 == true
                            ? colors.darkBlue
                            : colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          getTranslated(context, "VACCINE"),
                          style: TextStyle(
                              fontSize: 13,
                              color: currentindex2 == true
                                  ? colors.transparent
                                  : colors.textColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),

              width: size.width / 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  CustomCard4(name1: "${getTranslated(context, "TAG_ID")} : F001", name3: "${getTranslated(context, "MEDICINE")}: PPR",
                      name4: "${getTranslated(context, "DISEASE")}", name6: "${getTranslated(context, "DUE_ON")}: 25.06.2023", name2: '17/08/2023',name5: '03:50pm',),
                  CustomCard4(name1: "${getTranslated(context, "TAG_ID")} : F001", name3: "${getTranslated(context, "MEDICINE")}: PPR",
                    name4: "${getTranslated(context, "DISEASE")}", name6: "${getTranslated(context, "DUE_ON")}: 25.06.2023", name2: '17/08/2023',name5: '03:50pm',),CustomCard4(name1: "${getTranslated(context, "TAG_ID")} : F001", name3: "${getTranslated(context, "MEDICINE")}: PPR",
                    name4: "${getTranslated(context, "DISEASE")}", name6: "${getTranslated(context, "DUE_ON")}: 25.06.2023", name2: '17/08/2023',name5: '03:50pm',),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}