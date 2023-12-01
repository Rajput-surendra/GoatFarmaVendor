import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../ApiPath/Api.dart';
import '../Helper/Appbar.dart';
import '../Helper/session.dart';
import '../Model/WeightRecod/Get_wight_model.dart';
import '../Utils/Colors.dart';

class AddWeight extends StatefulWidget {
  final String tagid;


  const AddWeight(
      {Key? key, required this.tagid,})
      : super(key: key);

  @override
  State<AddWeight> createState() => _AddWeightState();
}

class _AddWeightState extends State<AddWeight> {

  TextEditingController   idC =  TextEditingController();
  TextEditingController   hightC =  TextEditingController();
  TextEditingController   wightC =  TextEditingController();
  TextEditingController   remarkC =  TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(
        context: context,
        text: "${getTranslated(context, "ADD_WEIGHT")}",
        isTrue: true,
      ),
      body:SingleChildScrollView(
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
                    "${getTranslated(context, "TAG_ID")} ",
                    style: TextStyle(color: colors.blacktextColor),
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
                          getWightListApi(v);
                        },
                        keyboardType: TextInputType.number,
                      controller: idC,
                        decoration: InputDecoration(
                            suffixIcon:Container(
                              padding: EdgeInsets.all(10),
                              child: Image.asset("assets/images/Group 72309.png"),
                            ),
                            contentPadding: EdgeInsets.only(left: 10,top: 20),
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
                height: size.height / 40,
              ),
              // leading: Icon(icon),
              getWightModel?.data?.weight == null ? Center(child: Text("No record found!!!")):  Card(
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
                                "${getWightModel!.data!.animalId}",
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
                                "${getWightModel!.data!.height}",
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
                                "${getWightModel!.data!.weight}",
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
                                "${getWightModel!.data!.remark}",
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
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 5,),
                      Text(
                        "${getTranslated(context, "WEIGHT")}",
                        style: TextStyle(color: colors.blacktextColor),
                      ),
                      Card(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child:  SizedBox(
                          width: size.width/2.3,
                          child: TextFormField(
                            controller:  wightC,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5),
                            // hintText: 'Enter your text',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${getTranslated(context, "HEIGHT")}",
                        style: TextStyle(color: colors.blacktextColor),
                      ),
                      Card(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: SizedBox(width: size.width/2.3,
                          child: TextFormField(
                            controller: hightC,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5),
                            // hintText: 'Enter your text',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),

              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${getTranslated(context, "REMARK")}",
                    style: TextStyle(color: colors.blacktextColor),
                  ),
                ],
              ),
              Card(
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: TextFormField(
                  controller: remarkC,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 5),
                  // hintText: 'Enter your text',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
                ),
              ),
              SizedBox(
                height: size.height/3,
              ),
              InkWell(
                onTap: () {
                  addWeightApi();
                },
                child: Container(
                  width: size.width / 1.1,
                  height: size.height / 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: colors.darkBlue,
                  ),
                  child: Center(
                      child:  Text(
                        "${ isLoading ? getTranslated(context, "PLEASE"):getTranslated(context, "LAST_WEIGHT")}",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: colors.transparent),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
bool isLoading = false;
  Future<void> addWeightApi() async {
    setState(() {
      isLoading = true;
    });
    var parameter = {
      'animal_id':idC.text,
      'weight':wightC.text,
      'height':hightC.text,
      'remark':remarkC.text
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.addWeight), parameter).then((getData) async {
      bool error = getData['error'];
      setState(() {
        isLoading = false;
      });
      if (error ==  false) {
        setState(() {
          Fluttertoast.showToast(msg: "${getData['message']}");
        Navigator.pop(context);
        });

      }
      setState(() {
        isLoading = false;
      });
    });
  }


  GetWightModel? getWightModel;
  getWightListApi(String? tagId) async {
    var parameter = {
      'animal_id':tagId
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.getLatWeight), parameter).then((getData) {
      String msg = getData['message'];
      setState(() {
        getWightModel = GetWightModel.fromJson(getData);
        Fluttertoast.showToast(msg: "${msg}");
      });

    });
  }
}