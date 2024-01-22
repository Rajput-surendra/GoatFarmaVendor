import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madhu_farma/Helper/session.dart';


import '../ApiPath/Api.dart';
import '../Helper/Appbar.dart';
import '../Helper/CustomCard.dart';
import '../Model/MedicineRecord/Get_medicine_model.dart';
import '../Scanner/scanner_view.dart';
import '../Utils/Colors.dart';
import 'DetailsMedicineRecord.dart';
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
    getMedicineListApi("");
    super.initState();
  }
 bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewMedicine())).then((value) => getMedicineListApi(""));

          // Action to perform when the button is pressed.
          // For example, navigate to a new screen or show a dialog.
        },
        child: Icon(Icons.add),
        backgroundColor: colors.primary,
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
                onChanged: (v){
                  getMedicineListApi(v);
                },
                // controller: supplementController,
                decoration: InputDecoration(
                    suffixIcon:InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ScanPay())).then((v){
                          if(v != null){
                            getMedicineListApi(v);

                          }
                        });;
                      },
                      child: Container(
                        height: 10,
                        width: 10,
                        padding: EdgeInsets.all(10),
                        child: Image.asset("assets/images/Group 72309.png"),
                      ),
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
                      getMedicineListApi("");
                    },);
                },
                child: getMedicineModel == null || getMedicineModel == "" ? Center(child: CircularProgressIndicator()):ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,i){
                      return Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            reverse: true,
                           physics: NeverScrollableScrollPhysics(),
                            itemCount: getMedicineModel!.data!.length,
                            itemBuilder: (context,i){
                              return InkWell(
                                onLongPress: (){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Delete Medicine Record'),
                                        content: Text('Are you sure you want to delete?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              // Cancel (close) pop-up
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              deleteApi(getMedicineModel!.data![i].id);
                                             // Navigator.of(context).pop();
                                            },
                                            child: Text('Delete'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                 //
                                },
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NewMedicine(mId: getMedicineModel!.data![i].id,isAdd: true,)));
                                },
                                child: Card(
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
                                            ),
                                            InkWell(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsMedicineRecord(mId: getMedicineModel!.data![i].medicineId)));
                                              },
                                              child: Container(
                                                height: 20,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: colors.primary
                                                ),
                                                child: Center(child: Text("Show List",style: TextStyle(color: colors.whiteTemp),)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    }),
                ),
              ),
          ],
        ),
       ),
      ),
    );
  }


  // GetMedicineModel? getMedicineModel;
  // Future<void> getMedicineListApi() async {
  //   apiBaseHelper.getAPICall(Uri.parse(ApiService.deleteMedicineApi)).then((getData) {
  //     bool error = getData ['error'];
  //     print('___getData_______${getData}_________');
  //     setState(() {
  //       getMedicineModel = GetMedicineModel.fromJson(getData);
  //     });
  //
  //     // if(!error){
  //     //
  //     //   setState(() {
  //     //
  //     //   });
  //     // }else {
  //     //
  //     // }
  //
  //   });
  //
  // }


  deleteApi(String? ID) async {
    var parameter = {
      'id':ID
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.deleteMedicineApi), parameter).then((getData) {
      String msg = getData['message'];
      setState(() {
       Fluttertoast.showToast(msg: msg);
       getMedicineListApi("");
       Navigator.pop(context);

      });

    });
  }


  GetMedicineModel? getMedicineModel;
  getMedicineListApi(String? tagId) async {
    var parameter = {
      'medicine_id':tagId
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.getMedicineList), parameter).then((getData) {
      String msg = getData['message'];
      setState(() {
        getMedicineModel = GetMedicineModel.fromJson(getData);

      });

    });
  }
}