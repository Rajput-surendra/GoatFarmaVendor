import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madhu_farma/Helper/session.dart';


import '../ApiPath/Api.dart';
import '../Helper/Appbar.dart';
import '../Helper/CustomCard.dart';
import '../Model/Supplement/get_supplement_,model.dart';
import '../Utils/Colors.dart';
import 'AddSupplement.dart';
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
                      itemCount: getSupplementModel!.breed!.length,
                      itemBuilder: (context, i) {
                        return
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                            child: Column(
                              children: [
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${getSupplementModel!.breed![i].title}"),
                                        Row(
                                          children: [
                                            Text("Stock: "),
                                            SizedBox(width: 2,),
                                            Row(
                                              children: [
                                                Text("${getSupplementModel!.breed![i].stock}",style: TextStyle(color: colors.blackTemp,fontWeight: FontWeight.w500),),
                                                Text("${getSupplementModel!.breed![i].unit}",style: TextStyle(color: colors.blackTemp,fontWeight: FontWeight.w500),),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
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
        backgroundColor: colors.secondary,
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

}