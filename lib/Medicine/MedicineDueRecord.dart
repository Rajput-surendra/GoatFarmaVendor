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
    getMedicineListApi();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>MedicineConsume()));
      },
        child: Icon(Icons.add),
        backgroundColor: colors.secondary,),
      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "MEDICINE_DUE_RECORD"),
        isTrue: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(height: 10,),
            Row(
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
            const SizedBox(
              height: 10,
            ),
            Card(
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
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
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
            Container(
              height: MediaQuery.of(context).size.height,
              child: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(
                    Duration(seconds: 2),
                        () {
                          getMedicineListApi();
                    },
                  );
                },
                child: getMedicineDuaModel == null || getMedicineDuaModel == "" ? Center(child: CircularProgressIndicator()) : getMedicineDuaModel!.data!.isEmpty ? Center(child: Text("No Available Record"))
                    : ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, i) {
                      return Container(
                        //height: MediaQuery.of(context).size.height / 1.0,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: getMedicineDuaModel!.data!.length,
                            itemBuilder: (context, i) {
                              return InkWell(
                                onTap: (){
                                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>getDeathModel(animalId: breedListModel!.data![i].animalId)));
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
                                                    '${getTranslated(context, "DATE")}'
                                                        ": "),
                                                getMedicineDuaModel!.data![i].date == null ? Text("No Available Age",style: TextStyle(
                                                    color: colors.blackTemp,
                                                    fontWeight:
                                                    FontWeight.bold)):  Text(
                                                  '${getMedicineDuaModel!.data![i].date}',
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
                                                    '${getTranslated(context, "DAYS")}'
                                                        ": "),
                                                getMedicineDuaModel!.data![i].day == null ? Text("No available days",style: TextStyle(
                                                    color: colors.blackTemp,
                                                    fontWeight:
                                                    FontWeight.bold)):    Text(
                                                  '${getMedicineDuaModel!.data![i].day}',
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
                                                  '${getMedicineDuaModel!.data![i].status}',
                                                  style: TextStyle(
                                                      color: colors.blackTemp,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 2),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [

                                            Row(
                                              children: [
                                                // Text(
                                                //     '${getTranslated(context, "REASON")}'
                                                //         ": "),
                                                getMedicineDuaModel!.data![i].direction == null ? Text("No available",style: TextStyle(
                                                    color: colors.blackTemp,
                                                    fontWeight:
                                                    FontWeight.bold)):    Text(
                                                  '${getMedicineDuaModel!.data![i].direction}',
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
                                                    '${getTranslated(context, "WEIGHT")}'
                                                        ": "),
                                                getMedicineDuaModel!.data![i].weight == null ? Text("No available weight",style: TextStyle(
                                                    color: colors.blackTemp,
                                                    fontWeight:
                                                    FontWeight.bold)):  Text(
                                                  '${getMedicineDuaModel!.data![i].weight}',
                                                  style: TextStyle(
                                                      color: colors.blackTemp,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              ],
                                            ),
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

            // Container(
            //   padding: EdgeInsets.all(10),
            //
            //   width: size.width / 1,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: Column(
            //     children: [
            //       CustomCard4(name1: "${getTranslated(context, "TAG_ID")} : F001", name3: "${getTranslated(context, "MEDICINE")}: PPR",
            //           name4: "${getTranslated(context, "DISEASE")}", name6: "${getTranslated(context, "DUE_ON")}: 25.06.2023", name2: '17/08/2023',name5: '03:50pm',),
            //       CustomCard4(name1: "${getTranslated(context, "TAG_ID")} : F001", name3: "${getTranslated(context, "MEDICINE")}: PPR",
            //         name4: "${getTranslated(context, "DISEASE")}", name6: "${getTranslated(context, "DUE_ON")}: 25.06.2023", name2: '17/08/2023',name5: '03:50pm',),CustomCard4(name1: "${getTranslated(context, "TAG_ID")} : F001", name3: "${getTranslated(context, "MEDICINE")}: PPR",
            //         name4: "${getTranslated(context, "DISEASE")}", name6: "${getTranslated(context, "DUE_ON")}: 25.06.2023", name2: '17/08/2023',name5: '03:50pm',),
            //     ],
            //   ),
            // ),

          ],
        ),
      ),
    );
  }

  GetMedicineDuaModel? getMedicineDuaModel;
  Future<void> getMedicineListApi() async {
    apiBaseHelper.getAPICall(Uri.parse(ApiService.getMedicineDuaList)).then((getData) {
      bool error = getData ['error'];
      print('___getData_______${getData}_________');
      setState(() {
        getMedicineDuaModel = GetMedicineDuaModel.fromJson(getData);
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