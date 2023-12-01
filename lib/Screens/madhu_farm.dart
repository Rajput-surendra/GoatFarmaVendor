import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';

import '../Helper/Appbar.dart';
import '../Helper/Colors.dart';

class MadhuFarmScreen extends StatefulWidget {
  const MadhuFarmScreen({Key? key}) : super(key: key);

  @override
  State<MadhuFarmScreen> createState() => _MadhuFarmScreenState();
}

class _MadhuFarmScreenState extends State<MadhuFarmScreen> {
  String? breedValue ;
  final List<String> breedValueitems = ['Goat', 'Standard', 'Premium'];
  final TextEditingController _chargeController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.grad1Color,
      appBar: customAppBar(context: context, text:getTranslated(context, "MADHU_FARM"), isTrue: true, ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 3,bottom: 3),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Text("Select Breed",
                        style: TextStyle(
                            color: colors.blackTemp,fontWeight: FontWeight.normal
                        ),),
                    ),
                    // dropdownColor: colors.primary,
                    value: breedValue,
                    icon:  const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(Icons.keyboard_arrow_down_rounded,  color: colors.secondary,size: 30,),
                    ),
                    // elevation: 16,
                    style:  TextStyle(color: colors.secondary,fontWeight: FontWeight.bold),
                    underline: Padding(
                      padding: const EdgeInsets.only(left: 0,right: 0),
                      child: Container(
                        // height: 2,
                        color:  colors.whiteTemp,
                      ),
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        breedValue = value!;

                      });
                    },

                    items: breedValueitems
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child:
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(value,style: const TextStyle(color: colors.textColor,fontWeight: FontWeight.normal),),
                            ),
                          ],
                        ),
                      );

                    }).toList(),

                  ),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Card(

                child: Column(
                  children: [
                    listTile(key: 'Total Animal', value: '26'),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: colors.grad1Color,
                    ),
                    listTile(key: 'Male', value: '2'),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey,
                    ),
                    listTile(key: 'Female', value: '5'),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey,
                    ),
                    listTile(key: 'Pregnant', value: '5'),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey,
                    ),
                    listTile(key: 'Breeder', value: '2'),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey,
                    ),
                    listTile(key: 'Kids(0-3 Month)', value: '5'),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey,
                    ),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget listTile({required String key, required String value}) {
    return ListTile(
      title: Text(key),
      trailing: Text(value),
    );
  }

}
