import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Helper/Appbar.dart';
import '../../Helper/CustomCard.dart';
import '../../Utils/Colors.dart';
import '../ApiPath/Api.dart';
import '../Helper/session.dart';
import '../Model/WeightRecod/Get_wight_model.dart';
import '../Model/WeightRecod/get_weight_list_model.dart';
import '../Screens/AddWeight.dart';

class WeightRecord extends StatefulWidget {
  const WeightRecord({Key? key}) : super(key: key);

  @override
  State<WeightRecord> createState() => _WeightRecordState();
}

class _WeightRecordState extends State<WeightRecord> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWightListApi();
  }
  TextEditingController   idC =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: customAppBar(context: context, text: '${getTranslated(context, "WEIGHT_RECORD")}', isTrue: true,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddWeight(tagid: "12",)));

        },
        child: Icon(Icons.add),
        backgroundColor: colors.darkBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${getTranslated(context, "TAG_ID")}',
                    style: TextStyle(color: colors.blacktextColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
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
                        onChanged:(v) {
                          getWightFilterApi(v);
                        },
                        controller:idC ,
                        // controller: supplementController,
                        decoration: InputDecoration(
                            suffixIcon: Container(
                              padding: EdgeInsets.all(10),
                              child: Image.asset("assets/images/Group 72309.png"),
                            ),
                            contentPadding: EdgeInsets.only(left: 10,top: 18),
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

              SizedBox(height: 10,),
              getWeightListModel == null ? Center(child: CircularProgressIndicator()):  Container(
              child: ListView.builder(
                shrinkWrap: true,
                reverse: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: getWeightListModel!.data!.length,
                  itemBuilder: (context,i){
                return   InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddWeight(tagid:getWeightListModel!.data![i].animalId  ?? "" ,)));
                  },
                  child: Card(

                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${getTranslated(context, "TAG_ID" )}" ": ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: colors.textColor,
                                          fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "${getWeightListModel!.data![i].animalId}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: colors.textColor,
                                          fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${getTranslated(context, "HEIGHT")}"": ",),
                                    Text(
                                      "${getWeightListModel!.data![i].height}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: colors.textColor,
                                          fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${getTranslated(context, "WEIGHT")}" " :",

                                    ),
                                    Text(
                                      "${getWeightListModel!.data![i].weight}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: colors.textColor,
                                          fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${getTranslated(context, "REMARK")}"": ",),
                                    Text(
                                      "${getWeightListModel!.data![i].remark}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: colors.textColor,
                                          fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),
                      )

                  ),
                );
              }),
            )
            ],
          ),
        ),
      ),
    );
  }

  getWightFilterApi(String? tagId) async {
    var parameter = {
      'animal_id':tagId
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.getWeight), parameter).then((getData) {
      String msg = getData['message'];
      setState(() {
        getWeightListModel = GetWeightListModel.fromJson(getData);
        Fluttertoast.showToast(msg: "${msg}");
      });

    });
  }

  GetWeightListModel? getWeightListModel;
  getWightListApi() async {
    apiBaseHelper.getAPICall(Uri.parse(ApiService.getWeight)).then((getData) {
      bool error = getData['error'];
      String msg = getData['message'];
      if (error ==  false) {
        setState(() {
          getWeightListModel = GetWeightListModel.fromJson(getData);
          Fluttertoast.showToast(msg: "${msg}");
        });
      }
    });
  }
}