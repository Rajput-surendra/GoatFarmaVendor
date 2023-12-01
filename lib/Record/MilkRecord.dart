import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

import '../../Helper/AppBtn.dart';
import '../../Helper/CustomText.dart';
import '../../Utils/Colors.dart';
import '../../helper/appbar.dart';
import '../ApiPath/Api.dart';
import '../Helper/session.dart';
import '../Model/MilkRecord/milk_record_model.dart';
import 'AddMilkRecord.dart';

class MilkRecord extends StatefulWidget {
  const MilkRecord({Key? key}) : super(key: key);

  @override
  State<MilkRecord> createState() => _MilkRecordState();
}

class _MilkRecordState extends State<MilkRecord> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMilkApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: customAppBar(
        context: context,
        text: '${getTranslated(context, "MILK_RECORD")}',
        isTrue: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: RefreshIndicator(
            onRefresh: () {
              return Future.delayed(
                Duration(seconds: 2),
                () {
                  getMilkApi();
                },
              );
            },
            child: breedListModel == null || breedListModel == ""
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, i) {
                      return Container(
                        height: MediaQuery.of(context).size.height / 1.0,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: breedListModel!.data!.length,
                                itemBuilder: (context, i) {
                                  return InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMilkRecord(animalId: breedListModel!.data![i].animalId)));
                                    },
                                    child: Card(
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
                                                        '${getTranslated(context, "TAG_ID")}'
                                                        ": "),
                                                    Text(
                                                      '${breedListModel!.data![i].animalId}',
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
                                                        '${getTranslated(context, "Age")}'
                                                        ": "),
                                                    Text(
                                                      '${breedListModel!.data![i].age}',
                                                      style: TextStyle(
                                                          color: colors.blackTemp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                        '${getTranslated(context, "MILK_DATE")}'
                                                        ": "),
                                                    Text(
                                                      '${breedListModel!.data![i].date!.substring(0, 11)}',
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
                                                      '${breedListModel!.data![i].breed}',
                                                      style: TextStyle(
                                                          color: colors.blackTemp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                        '${getTranslated(context, "WEIGHT")}'
                                                        ": "),
                                                    Text(
                                                      '${breedListModel!.data![i].weight}',
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
                                                        '${getTranslated(context, "MILK")}'
                                                        ": "),
                                                    Text(
                                                      '${breedListModel!.data![i].milkQty}ltr',
                                                      style: TextStyle(
                                                          color: colors.blackTemp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                      );
                    }),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.secondary,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddMilkRecord()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  MilkRecordModel? breedListModel;

  Future<void> getMilkApi() async {
    apiBaseHelper.getAPICall(Uri.parse(ApiService.getMilk)).then((getData) {
      bool error = getData['error'];
      if (!error) {
        breedListModel = MilkRecordModel.fromJson(getData);
        setState(() {});
      }
    });
  }
}
