import 'package:flutter/material.dart';


import '../../Helper/Appbar.dart';
import '../../Helper/CustomCard.dart';
import '../../Utils/Colors.dart';
import 'AddBreedingRecord.dart';

class BreedingRecords extends StatefulWidget {
  const BreedingRecords({Key? key}) : super(key: key);

  @override
  State<BreedingRecords> createState() => _BreedingRecordsState();
}

class _BreedingRecordsState extends State<BreedingRecords> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBreedingRecord()));

          // Action to perform when the button is pressed.
          // For example, navigate to a new screen or show a dialog.
        },
        child: Icon(Icons.add),
        backgroundColor: colors.darkBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      appBar: customAppBar(
        context: context,
        text: "Breeding Records",
        isTrue: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

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
                // subtitle: Text(subtitle),
                trailing: Container(
                  height: 10,
                  width: 10,
                  padding: EdgeInsets.all(10),
                  child: Image.asset("assets/images/Group 72309.png"),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: size.height / 3.5,
            width: size.width / 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                CustomCard5(
                    name1: "Tag ID : F001",
                    name2: "Status : Pregnant",
                    name3: "Osmanabad",
                    name4: "Delivery Date : 01/06/2023"),
                CustomCard5(
                    name1: "Tag ID : F002",
                    name2: "Status : Pregnant",
                    name3: "Osmanabad",
                    name4: "Delivery Date : 15/07/2023"),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}