import 'package:flutter/material.dart';


import '../../Helper/Appbar.dart';
import '../Screens/AddNewAnimal.dart';


class AddBreedingRecord extends StatefulWidget {
  const AddBreedingRecord({Key? key}) : super(key: key);

  @override
  State<AddBreedingRecord> createState() => _AddBreedingRecordState();
}

class _AddBreedingRecordState extends State<AddBreedingRecord> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: customAppBar(
        context: context,
        text: "Add Breeding",
        isTrue: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        // padding: EdgeInsets.symmetric(
        //     horizontal: MediaQuery.of(context).size.width * 0.2),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text('Tag ID*'),
              SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Scan / enter',
                        filled: true,
                        border: InputBorder.none, // Remove underline
                        //labelText: 'Text Field',

                        suffixIcon: Container(
                          height: 10,
                          width: 10,
                          padding: EdgeInsets.all(10),
                          child: Image.asset("assets/images/Group 72309.png"),
                        ),),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Breed : Sroahi"), Text("Age : 15 (Month)")],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Weight : 25 kg"),
                  Text("Mating Date : 01/06/2023")
                ],
              ),
              SizedBox(
                height: 10,
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewAnimal()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  color: Color(0xFF002E77),
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Text(
                        "Add Animal",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Card(
                elevation: 4,
                child: Container(
                    child: ListTile(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      tileColor: Colors.white,
                      title: Text(
                        'Tag ID : F001',
                        style: TextStyle(fontSize: 12),
                      ),
                      subtitle: Text(
                        'Birth date : 18/08/2023',
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight : 38 kg",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "Male",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          )
                        ],
                      ),
                    )),
              ),

              // Text('Gestation Period'),
            ],
          ),
        ),
      ),
      bottomSheet: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 30, left: 15, right: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          color: Color(0xFF002E77),
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
        ),
      ),
    );
  }
}