import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';

import '../../Helper/Appbar.dart';
import '../../Helper/CustomCard.dart';
import '../../Utils/Colors.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

String? breedValue;

final List<String> breedValueitems = ['Male', 'Female'];

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "REPORT"),
        isTrue: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 4,
                  ),
                  Text(getTranslated(context, "Tag_ID")),
                  Text("*",style: TextStyle(color: colors.red,),)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 3),
                  child: Container(
                    height: 40,
                    child: Center(
                      child: TextFormField(
                        // controller: supplementController,
                        decoration: InputDecoration(
                            suffixIcon:
                            Container(
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
                  )
                ),
              ),
              SizedBox(height: 10,),
              Column(
                children: [
                  CustomCard4(
                      name1: "Tag ID: F001",
                      name2: "Age:15(month)",
                      name3: "",
                      name4: "Osmanabad",
                      name5: "Weight:35(Kg)",
                      name6: "Male"),
                ],
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