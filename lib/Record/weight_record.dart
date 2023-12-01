import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/Appbar.dart';
import 'package:madhu_farma/Helper/Colors.dart';

import '../Helper/session.dart';


class WeightRecord extends StatefulWidget {
  const WeightRecord({Key? key}) : super(key: key);

  @override
  State<WeightRecord> createState() => _WeightRecordState();
}

class _WeightRecordState extends State<WeightRecord> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: customAppBar(
        context: context,
        text: '${getTranslated(context, "WEIGHT_RECORD")}',
        isTrue: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                const Text(
                  "Tag ID*",
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
              child: SizedBox(
                width: size.width / 1,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 4, horizontal: 9), // Adjust values as needed

                  // leading: Icon(icon),
                  title: Text(
                    "Scan / enter",
                    style: TextStyle(
                        fontSize: 15,
                        color: colors.textColor,
                        fontWeight: FontWeight.w500),
                  ),

                  trailing: Image.asset("assets/images/Group 72378.png"),

                ),
              ),
            ),
            Row(
              children: [
                Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: SizedBox(
                    width: size.width / 4,
                    child: const ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 9),
                      // Adjust values as needed

                      // leading: Icon(icon),
                      title: Text(
                        "Tag ID : F002",
                        style: TextStyle(
                            fontSize: 15,
                            color: colors.textColor,
                            fontWeight: FontWeight.w500),
                      ),
                      // subtitle: Text(subtitle),
                    ),
                  ),
                ),
                Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: SizedBox(
                    width: size.width / 3.5,
                    child: const ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 9),
                      // Adjust values as needed

                      // leading: Icon(icon),
                      title: Text(
                        "Sirohi Age : 9 M",
                        style: TextStyle(
                            fontSize: 15,
                            color: colors.textColor,
                            fontWeight: FontWeight.w500),
                      ),
                      // subtitle: Text(subtitle),
                    ),
                  ),
                ),
                Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: SizedBox(
                    width: size.width / 3.1,
                    child: const ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 9),
                      // Adjust values as needed

                      title: Text(
                        "Last Weight : 35kg",
                        style: TextStyle(
                            fontSize: 15,
                            color: colors.textColor,
                            fontWeight: FontWeight.w500),
                      ),
                      // subtitle: Text(subtitle),
                    ),
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
                  "Width",
                  style: TextStyle(color: colors.blacktextColor),
                ),
                SizedBox(
                  width: 160,
                ),
                Text(
                  "Height",
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
                  child: SizedBox(
                    width: size.width / 2.3,
                    child: const ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 9), // Adjust values as needed
                    ),
                  ),
                ),

                // SizedBox(width: 10,),
                Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: SizedBox(
                    width: size.width / 2.3,
                    child: const ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 9), // Adjust values as needed
                    ),
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
                  "Remark",
                  style: TextStyle(color: colors.blacktextColor),
                ),
              ],
            ),
            Card(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: SizedBox(
                width: size.width / 1,
                child: const ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 4, horizontal: 9), // Adjust values as needed

                  // leading: Icon(icon),
                  // title: Text(
                  //   "Last Weight : 35kg",
                  //   style: TextStyle(
                  //       fontSize: 15,
                  //       color: Color(0xff666666),
                  //       fontWeight: FontWeight.w500),
                  // ),
                  // subtitle: Text(subtitle),
                ),
              ),
            ),
            SizedBox(
              height: 280,
            ),
            InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>MadhuFarma17()));
              },
              child: Container(
                width: size.width / 1.1,
                height: size.height / 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: colors.darkBlue,
                ),
                child: Center(
                    child: Text(
                  "Save",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: colors.transparent),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
