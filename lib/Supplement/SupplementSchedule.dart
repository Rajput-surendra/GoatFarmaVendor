import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madhu_farma/Helper/session.dart';

import '../ApiPath/Api.dart';
import '../Helper/Appbar.dart';
import '../Helper/CustomCard.dart';
import '../Model/MedicineRecord/Get_medicine_schedule_list.dart';
import '../Model/Supplement/Get_Supplement_schedule_list_model.dart';
import '../Screens/AddMedicineSchedule.dart';
import '../Utils/Colors.dart';
import 'AddSupplementSchedule.dart';

class SupplementScheduleRecord extends StatefulWidget {
  const SupplementScheduleRecord({Key? key}) : super(key: key);

  @override
  State<SupplementScheduleRecord> createState() => _SupplementScheduleRecordState();
}

class _SupplementScheduleRecordState extends State<SupplementScheduleRecord> {
  TextEditingController tagId = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getMedicineScheduleFilterApi("");
    getSupplementApi("");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "SUPPLEMENT_SCHEDULE_RECORD"),
        isTrue: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddSupplementSchedule()));
        },
        child: Icon(Icons.add),
        backgroundColor: colors.primary,
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                getTranslated(context, "SUPPLEMENT_ID"),
                style: TextStyle(color: colors.blacktextColor),
              ),
            ),
            Card(
              child: Container(
                height: 55,
                child: TextFormField(
                  onChanged: (v) {
                    getSupplementApi(v);
                  },
                  textAlign: TextAlign.start,
                  controller: tagId,
                  decoration: InputDecoration(
                      // suffixIcon: Container(
                      //   padding: EdgeInsets.all(10),
                      //   child: Image.asset(
                      //     "assets/images/Group 72309.png",
                      //     height: 5,
                      //     width: 5,
                      //   ),
                      // ),
                      contentPadding: EdgeInsets.only(left: 10, top: 15),
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
            getMedicineScheduleList == null ||
                getMedicineScheduleList == ""
                ? Center(child: CircularProgressIndicator())
                : getMedicineScheduleList?.data?.isEmpty ?? false
                ? Center(child: Text("No Medicine Schedule"))
                : Container(
              //height: MediaQuery.of(context).size.height/1.1,
              child: Expanded(
                flex: 9,
                child: RefreshIndicator(
                  onRefresh: (){
                    return  getSupplementApi("");
                  },
                  child: ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: getMedicineScheduleList!.data!.length,
                      itemBuilder: (context, i) {
                        return Card(
                          elevation: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            '${getTranslated(context, "SUPPLEMENT_NAME")}'
                                                ": "),
                                        Text(
                                          '${getMedicineScheduleList!.data![i].suplimentId}',
                                          style: TextStyle(
                                              color: colors.blackTemp,
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            '${getTranslated(context, "STATUS")}'
                                                ": "),
                                        Text(
                                          '${getMedicineScheduleList!.data![i].status}',
                                          style: TextStyle(
                                              color: colors.blackTemp,
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),

                                Row(
                                  children: [
                                    Text(
                                        '${getTranslated(context, "DATE")}'
                                            " :"),
                                    Text(
                                        '${getMedicineScheduleList!.data![i].fromDate}',
                                        style: TextStyle(
                                            color: colors.blackTemp,
                                            fontWeight:
                                            FontWeight.bold)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            '${getTranslated(context, "TIME")}'
                                                " :"),
                                        Text(
                                            '${getMedicineScheduleList!.data![i].time}',
                                            style: TextStyle(
                                                color: colors.blackTemp,
                                                fontWeight:
                                                FontWeight.bold)),
                                      ],
                                    ),

                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('Supplement'),
                                                  content: Text('Supplement Schedule Record?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        getDeleteApi(getMedicineScheduleList!.data![i].id);
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Text('Yes'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        // Close the dialog box and perform the "No" action
                                                        Navigator.of(context).pop();

                                                      },
                                                      child: Text('No'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );


                                          },
                                          child: Container(
                                            height: 25,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: colors.primary
                                            ),
                                            child: Center(
                                              child: Text(
                                                '${getTranslated(context, "DELETE")}',style: TextStyle(
                                                  color: colors.whiteTemp
                                              ),),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),

                                  ],
                                ),
                                // SizedBox(
                                //   height: 1,
                                // ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      )
      // Column(
      //   children: [
      //     Expanded(
      //       flex: 1,
      //       child: Row(
      //         children: [
      //           SizedBox(
      //             width: 5,
      //           ),
      //           Text(
      //             getTranslated(context, "SCAN_MEDICINE_ID"),
      //             style: TextStyle(color: colors.blacktextColor),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Expanded(
      //       flex: 1,
      //       child: Card(
      //         child: Container(
      //           height: 55,
      //           child: TextFormField(
      //             onChanged: (v) {
      //               getMedicineScheduleFilterApi(v);
      //             },
      //             textAlign: TextAlign.start,
      //             controller: tagId,
      //             decoration: InputDecoration(
      //                 suffixIcon: Container(
      //                   padding: EdgeInsets.all(10),
      //                   child: Image.asset(
      //                     "assets/images/Group 72309.png",
      //                     height: 5,
      //                     width: 5,
      //                   ),
      //                 ),
      //                 contentPadding: EdgeInsets.only(left: 10, top: 15),
      //                 border: InputBorder.none),
      //             validator: (value) {
      //               if (value == null || value.isEmpty) {
      //                 return 'Please Enter 2nd onwards';
      //               }
      //               return null;
      //             },
      //           ),
      //         ),
      //       ),
      //     ),
      //
      //
      //
      //   ],
      // ),
    );
  }

  getDeleteApi(String? upId) async {
    var parameter = {
      'id':upId.toString()
    };
    print('____Som______${parameter}_________');
    apiBaseHelper
        .postAPICall(Uri.parse(ApiService.deleteSupplementScheduleApi), parameter)
        .then((getData) {
      String msg = getData['message'];
      setState(() {
        getSupplementApi("");
        Fluttertoast.showToast(msg: "${msg}");
      });
    });
  }



  // Future<void> getSupplementApi() async {
  //   apiBaseHelper.getAPICall(Uri.parse(ApiService.getSupplementScheduleApi)).then((getData) {
  //     print('_____getData_____${getData}_________');
  //     String msg = getData ['message'];
  //     setState(() {
  //
  //     });
  //     getMedicineScheduleList = GetSupplementScheduleListModel.fromJson(getData);
  //     Fluttertoast.showToast(msg: "${msg}");
  //
  //   });
  //
  // }



  GetSupplementScheduleListModel? getMedicineScheduleList;
  getSupplementApi(String? tagId) async {
    var parameter = {'supliment_id': tagId};
    apiBaseHelper
        .postAPICall(Uri.parse(ApiService.getSupplementScheduleApi), parameter)
        .then((getData) {
      String msg = getData['message'];
      setState(() {
        getMedicineScheduleList = GetSupplementScheduleListModel.fromJson(getData);
        Fluttertoast.showToast(msg: "${msg}");
      });
    });
  }
}


