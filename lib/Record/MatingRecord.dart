import 'package:flutter/material.dart';



import '../../Helper/Appbar.dart';
import '../../Helper/CustomCard.dart';
import '../../Utils/Colors.dart';
import '../Screens/AddNewMating.dart';


class MatingRecord extends StatefulWidget {
  const MatingRecord({Key? key}) : super(key: key);

  @override
  State<MatingRecord> createState() => _MatingRecordState();
}

class _MatingRecordState extends State<MatingRecord> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(
        context: context,
        text: "Mating Record",
        isTrue: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewMating()));
          //     breed: 'kkk', age: 'ffgggggf', weight: 'sss')));

          // Action to perform when the button is pressed.
          // For example, navigate to a new screen or show a dialog.
        },
        child: Icon(Icons.add),
        backgroundColor: colors.darkBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: SingleChildScrollView(
        child: Padding(
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
                    "Tag ID*",
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
                            suffixIcon:Container(
                              padding: EdgeInsets.all(10),
                              child: Image.asset("assets/images/Group 72309.png"),
                            ),
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
              ),

              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddWeight(tagid: ,
                  //   breed: '', age: '', weight: '',)));
                },
                child: CustomCard4(
                  name1: 'Tag ID : F001',
                  name2: 'Age : ',
                  name3: 'Days : 6 days',
                  name4: 'Osmanabad',
                  name5: 'Weight : ', name6: 'Status : Mated',
                ),
              ),
              CustomCard4(
                name1: 'Tag ID : F002',
                name2: 'Age :',
                name3: 'Days : 125 days',
                name4: 'Osmanabad',
                name5: 'Weight :', name6: 'Status : Empty',
              ),

            ],
          ),
        ),
      ),
    );
  }
}