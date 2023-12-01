import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madhu_farma/Record/MilkRecord.dart';


import '../../Helper/Appbar.dart';
import '../../Utils/Colors.dart';
import '../ApiPath/Api.dart';
import '../Helper/session.dart';
import '../Model/MilkRecord/milk_filtter_model.dart';

class AddMilkRecord extends StatefulWidget {
   AddMilkRecord({Key? key,this.animalId}) : super(key: key);
String? animalId;
  @override
  State<AddMilkRecord> createState() => _AddMilkRecordState();
}

class _AddMilkRecordState extends State<AddMilkRecord> {
  TextEditingController tIdC =  TextEditingController();
  TextEditingController qtyC =  TextEditingController();
  final _formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(context: context, text:'${getTranslated(context, "ADD_MILK_RECORD")}', isTrue: true, ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${getTranslated(context, "TAG_ID" )}" ,
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
                          keyboardType: TextInputType.number,
                          onChanged: (v){
                            getMilkFilterApi(v);
                          },
                           controller:tIdC,
                          decoration: InputDecoration(
                              suffixIcon:Container(
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

                SizedBox(
                  height: size.height / 40,
                ),
                milkFiltterModel?.data?.weight == null ? Center(child: Text("No record found!!!")):   Card(
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
                                    "${getTranslated(context, "BREED" )}" ": ",
                                  ),
                                  Text(
                                    "${milkFiltterModel!.data!.breed}",
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
                                    "${getTranslated(context, "AGE")}"": ",),
                                  Text(
                                    "${milkFiltterModel!.data!.age}",
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
                                    "${getTranslated(context, "LAST_MILK_DATE")}" ": ",

                                  ),
                                  Text(
                                    "${milkFiltterModel?.data?.date?.substring(0,11)}",
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
                                    "${getTranslated(context, "WEIGHT")}"": ",),
                                  Text(
                                    "${milkFiltterModel!.data!.weight}",
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 5,),
                        Text(
                          "${getTranslated(context, "MILK_QTY")}", style: TextStyle(
                            fontSize: 12,
                            color: colors.textColor,
                            fontWeight: FontWeight.w500)
                        ),
                      ],
                    ),
                    Card(
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child:  SizedBox(
                        child: TextFormField(
                          controller: qtyC,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
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
                SizedBox(
                  height: 15,
                ),


                SizedBox(
                  height: size.height/2.1,
                ),
                InkWell(
                  onTap: () {
                    if(tIdC.text.isEmpty && qtyC.text.isEmpty){
                      Fluttertoast.showToast(msg: "Filed are required");
                    }
                    addMilkApi();
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
                          "${ isLoading ? getTranslated(context, "PLEASE"):getTranslated(context, "SAVE")}",
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
      ),

    );
  }

  bool isLoading = false;
  Future<void> addMilkApi() async {
    setState(() {
      isLoading = true;
    });
    var parameter = {
      'animal_id':tIdC.text,
      'milk_qty':qtyC.text
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.addMilk), parameter).then((getData) async {
      bool error = getData['error'];
      setState(() {
        isLoading = false;
      });
      if (error ==  false) {
        setState(() {
          Fluttertoast.showToast(msg: "${getData['message']}");
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MilkRecord()));
         Navigator.pop(context);
        });

      }
      setState(() {
        isLoading = false;
      });
    });
  }
  MilkFiltterModel? milkFiltterModel;
  getMilkFilterApi(String? tagId) async {
    var parameter = {
      'animal_id':tagId
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.getSingleMilk), parameter).then((getData) {
      String msg = getData['message'];
      setState(() {
        milkFiltterModel = MilkFiltterModel.fromJson(getData);
        Fluttertoast.showToast(msg: "${msg}");
      });

    });
  }
}