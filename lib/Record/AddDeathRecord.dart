import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../Helper/Appbar.dart';
import '../../Utils/Colors.dart';
import '../ApiPath/Api.dart';
import '../Helper/session.dart';
import '../Model/Death/death_single_model.dart';

class AddDeathRecord extends StatefulWidget {
  final String breed;
  final String age;
  final String weight;

  const AddDeathRecord({Key? key,
    required this.breed,
    required this.age,
    required this.weight})
      : super(key: key);

  @override
  State<AddDeathRecord> createState() => _AddDeathRecordState();
}

class _AddDeathRecordState extends State<AddDeathRecord> {

  TextEditingController tIdC =  TextEditingController();
  TextEditingController weightC =  TextEditingController();
  TextEditingController remarkC =  TextEditingController();
  final _formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
   bottomSheet:   InkWell(
     onTap: () {
       if(tIdC.text.isEmpty ){
         Fluttertoast.showToast(msg: "Tag Id is required",backgroundColor: colors.primary);
       }else if(weightC.text.isEmpty){
         Fluttertoast.showToast(msg: "weight is required",backgroundColor: colors.primary);
       }else if(remarkC.text.isEmpty){
         Fluttertoast.showToast(msg: "Remark is required",backgroundColor: colors.primary);
       }else {
         addDeathApi();
       }
     },
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Container(
         height: 50,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(3),
           color: colors.darkBlue,
         ),
         child: Center(
             child:  Text(
               "${isLoading ? getTranslated(context, "PLEASE"):getTranslated(context, "SAVE")}",
               style: TextStyle(
                   fontSize: 19,
                   fontWeight: FontWeight.bold,
                   color: colors.transparent),
             )),
       ),
     ),
   ),
      appBar: customAppBar(
      context: context,
      text: '${getTranslated(context, "ADD_DEATH_RECORD")}',
      isTrue: true,
    ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                    Text("${getTranslated(context, "TAG_ID" )}" ": ",),
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
                            getDeathListApi(v);
                          },
                          controller:tIdC,
                          decoration: InputDecoration(
                              suffixIcon:
                              Container(
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
                                    "${getTranslated(context, "BREED" )}" ": ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: colors.textColor,
                                        fontWeight: FontWeight.w500),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "${getWightModel!.data!.breed}",
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
                                    "${getTranslated(context, "AGE")}" " :",

                                  ),
                                  Text(
                                    "${getWightModel!.data!.age}",
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
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text("${getTranslated(context, "WEIGHT" )}" ": ",),
                    Card(
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child:  SizedBox(
                        // width: size.width/2.3,
                        child: TextFormField(
                          controller: weightC,
                          keyboardType: TextInputType.number,
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

                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text("${getTranslated(context, "REMARK" )}" ": ",),
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
                      contentPadding: EdgeInsets.only(left: 10),
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


              ],
            ),
          ),
        ),
      ),
    );
  }
 bool isLoading  = false;
  GetSingleDataModel? getWightModel;
  getDeathListApi(String? tagId) async {
    var parameter = {
      'animal_id':tagId
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.getDeathSingle), parameter).then((getData) {
      String msg = getData['message'];
      setState(() {
        getWightModel = GetSingleDataModel.fromJson(getData);
        Fluttertoast.showToast(msg: "${msg}");
      });

    });
  }

  Future<void> addDeathApi() async {
    setState(() {
      isLoading = true;
    });
    var parameter = {
      'animal_id':tIdC.text,
      'weight':weightC.text,
      'reason':remarkC.text
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.addDeath), parameter).then((getData) async {
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
}