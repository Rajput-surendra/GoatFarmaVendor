import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';

import '../ApiPath/Api.dart';
import '../Helper/Appbar.dart';
import '../Helper/CustomCard.dart';
import '../Model/Supplement/Get_supplement_due_record_model.dart';
import '../Scanner/scanner_view.dart';
import '../Utils/Colors.dart';
import 'SupplementConsume.dart';

class SupplementDueRecord extends StatefulWidget {
  const SupplementDueRecord({Key? key}) : super(key: key);

  @override
  State<SupplementDueRecord> createState() => _SupplementDueRecordState();
}

class _SupplementDueRecordState extends State<SupplementDueRecord> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSupplementDueRecordApi("");
  }
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "SUPPLEMENT_DUE_RECORD"),
        isTrue: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    getTranslated(context, "SCAN_BREED"),
                    style: TextStyle(color: colors.blacktextColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            
              Card(
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: TextFormField(
                  onChanged: (v){
                    getSupplementDueRecordApi(v);
                  },
                  // controller: supplementController,
                  decoration: InputDecoration(
                      // suffixIcon:InkWell(
                      //   onTap: (){
                      //     Navigator.push(context, MaterialPageRoute(builder: (context)=>ScanPay())).then((v){
                      //       if(v != null){
                      //         getSupplementDueRecordApi(v);
                      //
                      //       }
                      //     });;
                      //   },
                      //   child: Container(
                      //     height: 10,
                      //     width: 10,
                      //     padding: EdgeInsets.all(10),
                      //     child: Image.asset("assets/images/Group 72309.png"),
                      //   ),
                      // ),
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
                    return Future.delayed(
                      Duration(seconds: 2),
                          () {
                            getSupplementDueRecordApi("");
                      },
                    );
                  },
                  child: getSupplementDueRecordModel == null || getSupplementDueRecordModel == "" ? Center(child: CircularProgressIndicator()) : getSupplementDueRecordModel!.data!.isEmpty ? Center(child: Text("No Available Record"))
                      : ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, i) {
                        return Container(
                          //height: MediaQuery.of(context).size.height / 1.0,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: getSupplementDueRecordModel!.data!.length,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SupplementConsume()));
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
                                              // Row(
                                              //   children: [
                                              //     Text(
                                              //         '${getTranslated(context, "CATEGORIES")}'
                                              //             ": "),
                                              //     Text(
                                              //       '${getSupplementDueRecordModel!.data![i].status}',
                                              //       style: TextStyle(
                                              //           color: colors.blackTemp,
                                              //           fontWeight:
                                              //           FontWeight.bold),
                                              //     ),
                                              //   ],
                                              // ),
                                              Row(
                                                children: [
                                                  Text(
                                                      '${getTranslated(context, "STATUS")}'
                                                          ": "),
                                                  getSupplementDueRecordModel!.data![i].status == null ? Text("No Available status",style: TextStyle(
                                                      color: colors.blackTemp,
                                                      fontWeight:
                                                      FontWeight.bold)):  Text(
                                                    '${getSupplementDueRecordModel!.data![i].status}',
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
                                                      '${getTranslated(context, "DATE")}'
                                                          ": "),
                                                  getSupplementDueRecordModel!.data![i].createdAt == null ? Text("No available Date",style: TextStyle(
                                                      color: colors.blackTemp,
                                                      fontWeight:
                                                      FontWeight.bold)):    Text(
                                                    '${getSupplementDueRecordModel!.data![i].createdAt!.substring(0,11)}',
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
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [

                                              Row(
                                                children: [
                                                  Text(
                                                      '${getTranslated(context, "TIME")}'
                                                          ": "),
                                                  Text(
                                                    '${getSupplementDueRecordModel!.data![i].time}',
                                                    style: TextStyle(
                                                        color: colors.blackTemp,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          // SizedBox(height: 2),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //   MainAxisAlignment.spaceBetween,
                                          //   children: [
                                          //
                                          //     Row(
                                          //       children: [
                                          //         Text(
                                          //             '${getTranslated(context, "AVL_STOCK")}'
                                          //                 ": "),
                                          //         getSupplementDueRecordModel!.data![i].status == null ? Text("No available",style: TextStyle(
                                          //             color: colors.blackTemp,
                                          //             fontWeight:
                                          //             FontWeight.bold)):    Text(
                                          //           '${getSupplementDueRecordModel!.data![i].status}',
                                          //           style: TextStyle(
                                          //               color: colors.blackTemp,
                                          //               fontWeight:
                                          //               FontWeight.bold),
                                          //         ),
                                          //       ],
                                          //     ),
                                          //     Row(
                                          //       children: [
                                          //         Text(
                                          //             '${getTranslated(context, "TIME")}'": "),
                                          //
                                          //       ],
                                          //     ),
                                          //   ],
                                          // ),
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context)=>SupplementConsume()));
      //
      //     // Action to perform when the button is pressed.
      //     // For example, navigate to a new screen or show a dialog.
      //   },
      //   child: Icon(Icons.add),
      //   backgroundColor: colors.primary,
      // ),
    );
  }
  GetSupplementDueRecordModel? getSupplementDueRecordModel;
  getSupplementDueRecordApi(String? tagId) async {
    var parameter = {
      'medicine_id':tagId
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.getSupplementDueRecord), parameter).then((getData) {
      String msg = getData['message'];
      setState(() {
        getSupplementDueRecordModel = GetSupplementDueRecordModel.fromJson(getData);

      });

    });
  }

}