import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';

import '../Helper/Appbar.dart';
import '../Helper/CustomCard.dart';
import '../Utils/Colors.dart';
import 'SupplementConsume.dart';

class SupplementDueRecord extends StatefulWidget {
  const SupplementDueRecord({Key? key}) : super(key: key);

  @override
  State<SupplementDueRecord> createState() => _SupplementDueRecordState();
}

class _SupplementDueRecordState extends State<SupplementDueRecord> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "SUPPLEMENT_DUE_RECORD"),
        isTrue: true,
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
                  getTranslated(context, "SCAN_BREED"),
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
            SizedBox(
              width: size.width / 1,
              child: Card(
                child: Container(
                  height: 55,
                  child: Center(
                    child: TextFormField(
                      // controller: supplementController,
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
            ),InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SupplementConsume()));
              },
              child: CustomCard4(
                  name1: 'Catogories : Goat',
                  name2: 'Date',
                  name3: 'Due on : 25/08/2023',
                  name4: 'Breed Type : Kids',
                  name5: '3:40 pm',
                  name6: 'Avl.Stock : 35 kg'),
            ),
            CustomCard4(
                name1: 'Catogories : Sheep',
                name2: 'Date',
                name3: 'Due on : 12/08/2023',
                name4: 'Breed Type : Pregnant',
                name5: '3:45 pm',
                name6: 'Avl.Stock : 58 kg'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SupplementConsume()));

          // Action to perform when the button is pressed.
          // For example, navigate to a new screen or show a dialog.
        },
        child: Icon(Icons.add),
        backgroundColor: colors.darkBlue,
      ),
    );
  }
}