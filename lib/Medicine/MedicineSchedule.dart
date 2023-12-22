import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madhu_farma/Helper/session.dart';

import '../ApiPath/Api.dart';
import '../Helper/Appbar.dart';
import '../Helper/CustomCard.dart';
import '../Model/MedicineRecord/Get_medicine_schedule_list.dart';
import '../Screens/AddMedicineSchedule.dart';
import '../Utils/Colors.dart';

class MedicineScheduleRecord extends StatefulWidget {
  const MedicineScheduleRecord({Key? key}) : super(key: key);

  @override
  State<MedicineScheduleRecord> createState() => _MedicineScheduleRecordState();
}

class _MedicineScheduleRecordState extends State<MedicineScheduleRecord> {
  TextEditingController tagId = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMedicineScheduleFilterApi("");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "MEDICINE_SCHEDULE_RECORD"),
        isTrue: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddMedicineSchedule()));
        },
        child: Icon(Icons.add),
        backgroundColor: colors.secondary,
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
                    width: 5,
                  ),
                  Text(
                    getTranslated(context, "SCAN_MEDICINE_ID"),
                    style: TextStyle(color: colors.blacktextColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Container(
                  height: 55,
                  child: TextFormField(
                    onChanged: (v) {
                      getMedicineScheduleFilterApi(v);
                    },
                    textAlign: TextAlign.start,
                    controller: tagId,
                    decoration: InputDecoration(
                        suffixIcon: Container(
                          padding: EdgeInsets.all(10),
                          child: Image.asset(
                            "assets/images/Group 72309.png",
                            height: 5,
                            width: 5,
                          ),
                        ),
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
              Container(
                height: MediaQuery.of(context).size.height,
                child: RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(
                      Duration(seconds: 2),
                      () {
                        getMedicineScheduleFilterApi("");
                      },
                    );
                  },
                  child: getMedicineScheduleList == null ||
                          getMedicineScheduleList == ""
                      ? Center(child: CircularProgressIndicator())
                      : getMedicineScheduleList?.data?.isEmpty ?? false
                          ? Center(child: Text("No Medicine Schedule"))
                          : ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, i) {
                                return Container(
                                  //height: MediaQuery.of(context).size.height/1.1,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      reverse: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          getMedicineScheduleList!.data!.length,
                                      itemBuilder: (context, i) {
                                        return Card(
                                          elevation: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                            '${getTranslated(context, "TAG_ID")}'
                                                            ": "),
                                                        Text(
                                                          '${getMedicineScheduleList!.data![i].animalId}',
                                                          style: TextStyle(
                                                              color: colors
                                                                  .blackTemp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            '${getTranslated(context, "BREED")}'
                                                            " :"),
                                                        Text(
                                                            '${getMedicineScheduleList!.data![i].breed}',
                                                            style: TextStyle(
                                                                color: colors
                                                                    .blackTemp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                            '${getTranslated(context, "MEDICINE_NAME")}'
                                                            " :"),
                                                        Text(
                                                            '${getMedicineScheduleList!.data![i].medicineName}',
                                                            style: TextStyle(
                                                                color: colors
                                                                    .blackTemp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            '${getTranslated(context, "DOSE")}'
                                                            " :"),
                                                        Text(
                                                            '${getMedicineScheduleList!.data![i].dose}',
                                                            style: TextStyle(
                                                                color: colors
                                                                    .blackTemp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                            '${getTranslated(context, "UNIT")}'
                                                            " :"),
                                                        Text(
                                                            '${getMedicineScheduleList!.data![i].unit}',
                                                            style: TextStyle(
                                                                color: colors
                                                                    .blackTemp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            '${getTranslated(context, "DIRECTION")}'
                                                            " :"),
                                                        Text(
                                                            '${getMedicineScheduleList!.data![i].direction}',
                                                            style: TextStyle(
                                                                color: colors
                                                                    .blackTemp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                            '${getTranslated(context, "TIME")}'
                                                                " :"),
                                                        Text(
                                                            '${getMedicineScheduleList!.data![i].time}',
                                                            style: TextStyle(
                                                                color: colors
                                                                    .blackTemp,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                      ],
                                                    ),

                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                            '${getTranslated(context, "SAFE_PREGNANT")}'
                                                            " :"),
                                                        Text(
                                                            '${getMedicineScheduleList!.data![i].safeForPregnant}',
                                                            style: TextStyle(
                                                                color: colors
                                                                    .blackTemp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            getUpdateApi(
                                                                getMedicineScheduleList!
                                                                    .data![i]
                                                                    .id);
                                                          },
                                                          child: Container(
                                                            width: 60,
                                                            height: 25,
                                                            decoration: BoxDecoration(
                                                                color: colors
                                                                    .primary,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Center(
                                                                child: Text(
                                                              getTranslated(
                                                                  context,
                                                                  "UPDATE"),
                                                              style: TextStyle(
                                                                  color: colors
                                                                      .whiteTemp),
                                                            )),
                                                          ),
                                                        )
                                                      ],
                                                    )
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
            ],
          ),
        ),
      ),
    );
  }

  getUpdateApi(String? upId) async {
    var parameter = {'schedule_id': upId, 'status': "1"};
    apiBaseHelper
        .postAPICall(Uri.parse(ApiService.updateMedicineScheduleApi), parameter)
        .then((getData) {
      String msg = getData['message'];
      setState(() {
        getMedicineScheduleFilterApi("");
        Fluttertoast.showToast(msg: "${msg}");
      });
    });
  }




  GetMedicineScheduleList? getMedicineScheduleList;
  getMedicineScheduleFilterApi(String? tagId) async {
    var parameter = {'medicine_id': tagId};
    apiBaseHelper
        .postAPICall(Uri.parse(ApiService.getMedicineScheduleApi), parameter)
        .then((getData) {
      String msg = getData['message'];
      setState(() {
        getMedicineScheduleList = GetMedicineScheduleList.fromJson(getData);
        Fluttertoast.showToast(msg: "${msg}");
      });
    });
  }
}
