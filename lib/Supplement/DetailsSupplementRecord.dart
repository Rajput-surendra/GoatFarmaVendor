import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';

import '../ApiPath/Api.dart';
import '../Helper/Appbar.dart';
import '../Model/MedicineRecord/Get_medicine_model.dart';
import '../Model/Supplement/GetSupplementDetailsModel.dart';
import '../Utils/Colors.dart';

class DetailsSupplementRecord extends StatefulWidget {
  String? mId;

  DetailsSupplementRecord({Key? key, this.mId}) : super(key: key);

  @override
  State<DetailsSupplementRecord> createState() => _DetailsSupplementRecordState();
}

class _DetailsSupplementRecordState extends State<DetailsSupplementRecord> {
  @override
  void initState() {
    // TODO: implement initState
    getMedicineListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: customAppBar(
          context: context,
          text: "Supplement Details",
          isTrue: true,
        ),
        body:

        SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: getMedicineModel == null || getMedicineModel == ""
                    ? Center(child: CircularProgressIndicator())
                    : getMedicineModel?.breed?.isEmpty ?? false ? Center(child: Text("No Supplement Details")): Container(
                        child: ListView.builder(
                         // separatorBuilder: (context, index) => const Divider(),
                            shrinkWrap: true,
                            reverse: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: getMedicineModel!.breed!.length,
                            itemBuilder: (context, index) {
                              return  Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text(getTranslated(context, "STATUS")),
                                             SizedBox(height: 5,),
                                             Text("${getMedicineModel!.breed![index].category}")
                                           ],
                                         ),
                                         Column(
                                           children: [
                                             Text(getTranslated(context, "BODY_WEIGHT")),
                                             SizedBox(height: 5,),
                                             Text("${getMedicineModel!.breed![index].bodyWeight}")
                                           ],
                                         ),
                                         Column(
                                           children: [
                                             Text(getTranslated(context, "DOSE")),
                                             SizedBox(height: 5,),
                                             Text("${getMedicineModel!.breed![index].dose}")
                                           ],
                                         ),
                                         Column(
                                           children: [
                                             Text(getTranslated(context, "UNIT")),
                                             SizedBox(height: 5,),
                                             Text("${getMedicineModel!.breed![index].unit}")
                                           ],
                                         ),
                                       ],
                                     )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )))

    );
  }

  GetSupplementDetailsModel? getMedicineModel;

  getMedicineListApi() async {
    var parameter = {'supliment_id': widget.mId};
    print("------Surendra-------${parameter}----------");
    apiBaseHelper
        .postAPICall(Uri.parse(ApiService.getSupplementDetails), parameter)
        .then((getData) {
      String msg = getData['message'];
      setState(() {
        getMedicineModel = GetSupplementDetailsModel.fromJson(getData);
      });
    });
  }
}
