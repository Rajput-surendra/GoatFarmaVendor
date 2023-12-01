import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';


import '../Helper/Appbar.dart';
import '../Helper/CustomCard.dart';
import '../Utils/Colors.dart';
import '../Screens/AddSupplement.dart';

class SupplementRecord extends StatefulWidget {
  const SupplementRecord({Key? key}) : super(key: key);

  @override
  State<SupplementRecord> createState() => _SupplementRecordState();
}

class _SupplementRecordState extends State<SupplementRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.grad1Color,
      appBar: customAppBar(
        context: context,
        text:getTranslated(context, "SUPPLEMENT_RECORD"),
        isTrue: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/30,),
            InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>Supplement()));
              },
              child: CustomCard7(
                  name1: getTranslated(context, "MAKKA"),
                  name2: "Stock : 45 kg",
                  height: MediaQuery.of(context).size.height / 13,
                  width: MediaQuery.of(context).size.width / 1.1),
            ),
            // SizedBox(height: MediaQuery.of(context).size.height/10,),

            CustomCard7(
                name1: getTranslated(context, "GAHU"),
                name2: "Stock : 108 kg",
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width / 1.1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.secondary,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddSupplement()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}