import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madhu_farma/Helper/session.dart';


import '../ApiPath/Api.dart';
import '../Helper/Appbar.dart';
import '../Helper/CustomCard.dart';
import '../Medicine/DetailsMedicineRecord.dart';
import '../Model/Supplement/get_supplement_,model.dart';
import '../Utils/Colors.dart';
import 'AddSupplement.dart';
import 'DetailsSupplementRecord.dart';
import 'NewAddSupplement.dart';


class SupplementRecord extends StatefulWidget {
  const SupplementRecord({Key? key}) : super(key: key);

  @override
  State<SupplementRecord> createState() => _SupplementRecordState();
}

class _SupplementRecordState extends State<SupplementRecord> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSupplementApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.grad1Color,
      appBar: customAppBar(
        context: context,
        text:getTranslated(context, "SUPPLEMENT_RECORD"),
        isTrue: true,
      ),
      body:  Container(
        height: MediaQuery.of(context).size.height,
        child: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(
              Duration(seconds: 2),
                  () {
                    getSupplementApi();
              },
            );
          },
          child: getSupplementModel == null || getSupplementModel == ""
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
              itemCount: 1,
              itemBuilder: (context, i) {
                return Container(
                 // height: MediaQuery.of(context).size.height / 1.0,
                  child: ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: getSupplementModel?.breed?.length ?? 0,
                      itemBuilder: (context, i) {
                        return
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                            child: Column(
                              children: [
                                InkWell(
                                  onLongPress: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Delete Supplement Record',style: TextStyle(fontSize: 18),),
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
                                                deleteApi(getSupplementModel!.breed![i].id);
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

                                  },
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                      child: Column(

                                        children: [
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             Text(getTranslated(context, "SUPPLEMENT_NAME")),
                                             Text("${getSupplementModel?.breed?[i].supplementName}",style: TextStyle(
                                               color: colors.blackTemp,fontWeight: FontWeight.bold
                                             ),),

                                           ],
                                         ),
                                         SizedBox(height: 5,),
                                         Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(getTranslated(context, "STOCK")),
                                              Text("${getSupplementModel?.breed?[i].qty} ${getSupplementModel?.breed?[i].unit}",style: TextStyle(
                                              color: colors.blackTemp,fontWeight: FontWeight.bold
                                              ),),

                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: InkWell(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsSupplementRecord(mId: getSupplementModel?.breed?[i].id)));
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
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                // InkWell(
                                //   onTap: (){
                                //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>Supplement()));
                                //   },
                                //   child: CustomCard7(
                                //       name1: getTranslated(context, "MAKKA"),
                                //       name2: "Stock : 45 kg",
                                //       height: MediaQuery.of(context).size.height / 13,
                                //       width: MediaQuery.of(context).size.width / 1.1),
                                // ),
                                // SizedBox(height: MediaQuery.of(context).size.height/10,),
                                // CustomCard7(
                                //     name1: getTranslated(context, "GAHU"),
                                //     name2: "Stock : 108 kg",
                                //     height: MediaQuery.of(context).size.height / 13,
                                //     width: MediaQuery.of(context).size.width / 1.1),
                              ],

                        ),
                          );
                      }),
                );
              }),
        ),
      ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.primary,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewAddSupplement())).then((value) => getSupplementApi());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  GetSupplementModel? getSupplementModel;
  Future<void> getSupplementApi() async {
    apiBaseHelper.getAPICall(Uri.parse(ApiService.getSupplementList)).then((getData) {
      print('_____getData_____${getData}_________');
      String msg = getData ['message'];
      setState(() {

      });
      getSupplementModel = GetSupplementModel.fromJson(getData);
      Fluttertoast.showToast(msg: "${msg}");

    });

  }


  deleteApi(String? ID) async {
    var parameter = {
      'id':ID
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.deleteMedicineApi), parameter).then((getData) {
      String msg = getData['message'];
      setState(() {
        Fluttertoast.showToast(msg: msg);
        getSupplementApi();
        Navigator.pop(context);

      });

    });
  }
}