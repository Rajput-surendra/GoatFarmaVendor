import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../Helper/Appbar.dart';
import '../../Helper/CustomCard.dart';
import '../../Utils/Colors.dart';
import '../ApiPath/Api.dart';
import '../Helper/session.dart';
import '../Model/MatingAnimalRecord/get_mating_list_model.dart';
import 'AddBreedingRecord.dart';

class BreedingRecords extends StatefulWidget {
  const BreedingRecords({Key? key}) : super(key: key);

  @override
  State<BreedingRecords> createState() => _BreedingRecordsState();
}

class _BreedingRecordsState extends State<BreedingRecords> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBreedMatingApi("");
  }
  TextEditingController  tIdC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBreedingRecord()));
      //
      //     // Action to perform when the button is pressed.
      //     // For example, navigate to a new screen or show a dialog.
      //   },
      //   child: Icon(Icons.add),
      //   backgroundColor: colors.darkBlue,
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "BREEDING_RECORD"),
        isTrue: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Text(
                  "${getTranslated(context, "TAG_ID" )}",
                  style: TextStyle(
                      fontSize: 12,
                      color: colors.textColor,
                      fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
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
                      onChanged: (v){
                        getBreedMatingApi(v);
                      },
                       controller: tIdC,
                      decoration: InputDecoration(
                        hintText: getTranslated(context, "SCAN_TAG_ID" ),
                          contentPadding: EdgeInsets.only(left: 8,top: 18),
                          suffixIcon:Padding(
                            padding: const EdgeInsets.all(8.0),
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
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(
                    Duration(seconds: 2),
                        () {
                      getBreedMatingApi("");
                    },
                  );
                },
                child: matingListModel == null || matingListModel == "" ? Center(child: CircularProgressIndicator()) : matingListModel!.data!.isEmpty ? Center(child: Text("No Available Record"))
                    : ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, i) {
                      return Container(
                        //height: MediaQuery.of(context).size.height / 1.0,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: matingListModel!.data!.length,
                            itemBuilder: (context, i) {
                              return InkWell(
                                onTap: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBreedingRecord()));
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
                                                  '${matingListModel!.data![i].femaleId}',
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
                                                matingListModel!.data![i].meatingStatus == null ? Text("No Available ",style: TextStyle(
                                                    color: colors.blackTemp,
                                                    fontWeight:
                                                    FontWeight.bold)):  Text(
                                                  '${matingListModel!.data![i].meatingStatus}',
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

                                                matingListModel!.data![i].breeding == null ?Text("No Available ",style: TextStyle(
                                                    color: colors.blackTemp,
                                                    fontWeight:
                                                    FontWeight.bold)):      Text(
                                                  '${matingListModel!.data![i].breeding}',
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
                                                    '${getTranslated(context, "DELIVERY_DATE")}'
                                                        ": "),
                                                matingListModel!.data![i].expectedDueDate == null ?Text("No Available ",style: TextStyle(
                                                    color: colors.blackTemp,
                                                    fontWeight:
                                                    FontWeight.bold)):   Text(
                                                  '${matingListModel!.data![i].expectedDueDate}',
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
                                      ],
                                    ),
                                  ),
                                )
                              );
                            }),
                      );
                    }),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  GetMatingListModel? matingListModel;
  getBreedMatingApi(String? tagId) async {
    var parameter = {
      'animal_id':tagId
    };
    print('_____parameter_____${parameter}_________');
    apiBaseHelper.postAPICall(Uri.parse(ApiService.getMatingList), parameter).then((getData) {
      String msg = getData['message'];
      setState(() {
        matingListModel = GetMatingListModel.fromJson(getData);
           Fluttertoast.showToast(msg: "${msg}");

      });

    });
  }
}