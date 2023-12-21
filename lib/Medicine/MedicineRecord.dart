import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';


import '../ApiPath/Api.dart';
import '../Helper/Appbar.dart';
import '../Helper/CustomCard.dart';
import '../Model/MedicineRecord/Get_medicine_model.dart';
import '../Utils/Colors.dart';
import 'NewMedicine.dart';


class MedicineRecord extends StatefulWidget {
  const MedicineRecord({Key? key}) : super(key: key);

  @override
  State<MedicineRecord> createState() => _MedicineRecordState();
}

class _MedicineRecordState extends State<MedicineRecord> {
  // bool currentindex1 = false;
  // bool currentindex2 = false;
  @override
  void initState() {
    // TODO: implement initState
    // currentindex1=true;
    getMedicineListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewMedicine()));

          // Action to perform when the button is pressed.
          // For example, navigate to a new screen or show a dialog.
        },
        child: Icon(Icons.add),
        backgroundColor: colors.darkBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "MEDICINE_RECORD"),
        isTrue: true,
      ),      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [

            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                 Text(
                  getTranslated(context, "SCAN"),
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
              child: TextFormField(
                keyboardType: TextInputType.number,
                // controller: supplementController,
                decoration: InputDecoration(
                    suffixIcon:Container(
                      height: 10,
                      width: 10,
                      padding: EdgeInsets.all(10),
                      child: Image.asset("assets/images/Group 72309.png"),
                    ),
                    contentPadding: EdgeInsets.only(left: 10,top: 15),
                    border: InputBorder.none),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter 2nd onwards';
                  }
                  return null;
                },
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height,
              child: RefreshIndicator(
                onRefresh: () {
                  return
                    Future.delayed(Duration(seconds: 2),() {
                      getMedicineListApi();
                    },);
                },
                child: getMedicineModel == null || getMedicineModel == "" ? Center(child: CircularProgressIndicator()):ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context,i){
                      return Container(
                        height: MediaQuery.of(context).size.height/1.1,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: getMedicineModel!.data!.length,
                            itemBuilder: (context,i){
                              return Card(
                                elevation: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text('${getTranslated(context, "DISEASE")}' ": "),
                                              Text('${getMedicineModel!.data![i].disease}',style: TextStyle(color: colors.blackTemp,fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text('${getTranslated(context, "MEDICINE_ID")}' " :"),
                                              Text('${getMedicineModel!.data![i].medicineId}',style: TextStyle(color: colors.blackTemp,fontWeight: FontWeight.bold)),
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text('${getTranslated(context, "MEDICINE_NAME")}' " :"),
                                              Text('${getMedicineModel!.data![i].medicineName}',style: TextStyle(color: colors.blackTemp,fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text('${getTranslated(context, "BALANCE")}' " :"),
                                              Text('${getMedicineModel!.data![i].qty}',style: TextStyle(color: colors.blackTemp,fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [

                                          Row(
                                            children: [
                                              Text('${getTranslated(context, "EXPIRY_DATE")}' " :"),
                                              Text('${getMedicineModel!.data![i].expDate}',style: TextStyle(color: colors.blackTemp,fontWeight: FontWeight.bold)),
                                            ],
                                          )

                                          // Row(
                                          //   children: [
                                          //     Text('${getTranslated(context, "GROWER")}' " :"),
                                          //     Text('${getMedicineModel!.data![i].pregnent}',style: TextStyle(color: colors.blackTemp,fontWeight: FontWeight.bold)),
                                          //   ],
                                          // )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    }),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              // height: size.height / 3.5,
              // width: size.width / 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      CustomCard4(
                          name1: "${getTranslated(context, "DISEASE")} : PPR",
                          name2: "${getTranslated(context, "BATCH")} :ABC2024",
                          name3: "${getTranslated(context, "MEDICINE_ID")}  id : SP001",
                          name4: "${getTranslated(context, "MEDICINE_NAME")} :ZINTAK",
                          name5: "${getTranslated(context, "EXPIRY")} : July-2024",
                          name6: "${getTranslated(context, "BALANCE")} : 5 ML"),
                      CustomCard4(
                          name1: "${getTranslated(context, "DISEASE")} : FMD",
                          name2: "${getTranslated(context, "BATCH")} :XYZ2022",
                          name3: "${getTranslated(context, "MEDICINE_ID")} : SP001",
                          name4: "${getTranslated(context, "MEDICINE_NAME")} : SUNFARMA",
                          name5: "${getTranslated(context, "EXPIRY")} : AUG-2025",
                          name6: "${getTranslated(context, "BALANCE")} :150 ML"),
                      // CustomCard4(
                      //     name1: "Medicine Name:ET/TT",
                      //     name2: "Batch:XYZ2021",
                      //     name3: "Consume:400 ML",
                      //     name4: "Company:SUNFARMA",
                      //     name5: "Expiry: AUG-2024",
                      //     name6: "Balance:100 ML"),
                    ],
                  ),
                ],
              ),
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


  GetMedicineModel? getMedicineModel;
  Future<void> getMedicineListApi() async {
    apiBaseHelper.getAPICall(Uri.parse(ApiService.getMedicineList)).then((getData) {
      bool error = getData ['error'];
      print('___getData_______${getData}_________');
      setState(() {
        getMedicineModel = GetMedicineModel.fromJson(getData);
      });

      // if(!error){
      //
      //   setState(() {
      //
      //   });
      // }else {
      //
      // }

    });

  }
}