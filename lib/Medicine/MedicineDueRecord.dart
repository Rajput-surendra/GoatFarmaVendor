import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';



import '../ApiPath/Api.dart';
import '../Helper/Appbar.dart';
import '../Helper/CustomCard.dart';
import '../Model/MedicineRecord/Get_Medicine_dua_model.dart';
import '../Utils/Colors.dart';
import 'MedicineConsume.dart';

class MedicineDueRecord extends StatefulWidget {
  const MedicineDueRecord({Key? key}) : super(key: key);

  @override
  State<MedicineDueRecord> createState() => _MedicineDueRecordState();
}

class _MedicineDueRecordState extends State<MedicineDueRecord> {
  bool currentindex1 = false;
  bool currentindex2 = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMedicineListApi("");
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>MedicineConsume()));
      },
        child: Icon(Icons.add),
        backgroundColor: colors.primary,),
      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "MEDICINE_DUE_RECORD"),
        isTrue: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(height: 5,),
          Expanded(
            flex: 0,
            child: Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                 Text(
                  getTranslated(context, "TAG_ID"),
                  style: TextStyle(color: colors.blacktextColor),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Card(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child:TextFormField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.start,
                // controller: supplementController,
                decoration: InputDecoration(
                    suffixIcon: Container(
                      padding: EdgeInsets.all(10),

                      child: Image.asset(
                        "assets/images/Group 72309.png",
                        height: 5,
                        width: 5,),
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
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    getMedicineListApi(getTranslated(context, "MEDICINE"));
                    currentindex1 = true;

                    if (currentindex1 == true) {
                      currentindex2 = false;
                    }
                  });
                },
                child: Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    height: size.height / 18,
                    width: size.width / 3.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: currentindex1 == true
                          ? colors.primary
                          : colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        getTranslated(context, "MEDICINE"),
                        style: TextStyle(
                            fontSize: 13,
                            color: currentindex1 == true
                                ? colors.transparent
                                : colors.textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    getMedicineListApi(getTranslated(context, "VACCINE"));
                    currentindex2 = true;

                    if (currentindex2 == true) {
                      currentindex1 = false;
                    }
                  });
                },
                child: Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    height: size.height / 18,
                    width: size.width / 3.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: currentindex2 == true
                          ? colors.primary
                          : colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        getTranslated(context, "VACCINE"),
                        style: TextStyle(
                            fontSize: 13,
                            color: currentindex2 == true
                                ? colors.transparent
                                : colors.textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          getMedicineDuaModel == null ||
              getMedicineDuaModel == ""
              ? Center(child: CircularProgressIndicator())
              : getMedicineDuaModel?.data?.isEmpty ?? false
              ? Center(child: Text("No Medicine Schedule"))
              : Container(
            //height: MediaQuery.of(context).size.height/1.1,
            child: Expanded(
              flex: 9,
              child: RefreshIndicator(
                onRefresh: (){
                  return  getMedicineListApi("");
                },
                child: ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: getMedicineDuaModel!.data!.length,
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
                                          '${getTranslated(context, "TAG_ID")}'
                                              ": "),
                                      Text(
                                        '${getMedicineDuaModel!.data![i].animalId}',
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
                                          '${getTranslated(context, "BREED")}'
                                              " :"),
                                      Text(
                                          '${getMedicineDuaModel!.data![i].status}',
                                          style: TextStyle(
                                              color: colors.blackTemp,
                                              fontWeight:
                                              FontWeight.bold)),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          '${getTranslated(context, "MEDICINE_NAME")}'
                                              " :"),
                                      Text(
                                          '${getMedicineDuaModel!.data![i].status}',
                                          style: TextStyle(
                                              color: colors.blackTemp,
                                              fontWeight:
                                              FontWeight.bold)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          '${getTranslated(context, "DOSE")}'
                                              " :"),
                                      Text(
                                          '${getMedicineDuaModel!.data![i].status}',
                                          style: TextStyle(
                                              color: colors.blackTemp,
                                              fontWeight:
                                              FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          '${getTranslated(context, "UNIT")}'
                                              " :"),
                                      Text(
                                          '${getMedicineDuaModel!.data![i].status}',
                                          style: TextStyle(
                                              color: colors.blackTemp,
                                              fontWeight:
                                              FontWeight.bold)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          '${getTranslated(context, "DIRECTION")}'
                                              " :"),
                                      Text(
                                          '${getMedicineDuaModel!.data![i].status}',
                                          style: TextStyle(
                                              color: colors.blackTemp,
                                              fontWeight:
                                              FontWeight.bold)),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
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
                                          '${getMedicineDuaModel!.data![i].status}',
                                          style: TextStyle(
                                              color: colors.blackTemp,
                                              fontWeight:
                                              FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          '${getTranslated(context, "SAFE_PREGNANT")}'
                                              " :"),
                                      Text(
                                          '${getMedicineDuaModel!.data![i].status}',
                                          style: TextStyle(
                                              color: colors.blackTemp,
                                              fontWeight:
                                              FontWeight.bold)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // getUpdateApi(getMedicineScheduleList!.data![i].id);
                                        },
                                        child: Container(
                                          width: 60,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              color: colors.primary,
                                              borderRadius:
                                              BorderRadius
                                                  .circular(10)),
                                          child: Center(
                                              child: Text(
                                                getTranslated(
                                                    context, "UPDATE"),
                                                style: TextStyle(
                                                    color:
                                                    colors.whiteTemp),
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
              ),
            ),
          ),

        ],
      ),
    );
  }
  GetMedicineDuaModel? getMedicineDuaModel;
  getMedicineListApi(String? mName) async {
    var parameter = {
      'medicine_type':mName.toString()
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.getMedicineDuaList), parameter).then((getData) {
      bool error = getData['error'];
      String msg = getData['message'];
      if (error ==  false) {
        setState(() {
          getMedicineDuaModel = GetMedicineDuaModel.fromJson(getData);
        });
      }
    });
  }


  // Future<void> getMedicineListApi() async {
  //   apiBaseHelper.getAPICall(Uri.parse(ApiService.getMedicineDuaList)).then((getData) {
  //     bool error = getData ['error'];
  //     print('___getData_______${getData}_________');
  //     setState(() {
  //       getMedicineDuaModel = GetMedicineDuaModel.fromJson(getData);
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
}