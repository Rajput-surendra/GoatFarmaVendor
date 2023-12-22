import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../ApiPath/Api.dart';
import '../Helper/AppBtn.dart';
import '../Helper/CustomText.dart';
import '../Helper/session.dart';
import '../Medicine/NewMedicine.dart';
import '../Model/MedicineRecord/Get_medicine_model.dart';
import '../Model/MedicineRecord/Get_single_data_medicine_model.dart';
import '../Model/MilkRecord/milk_filtter_model.dart';
import '../Model/animal_cat_model_response.dart';
import '../Scanner/scanner_view.dart';
import '../Utils/Colors.dart';
import 'package:http/http.dart' as http;

import '../helper/appbar.dart';

class AddMedicineSchedule extends StatefulWidget {
  const AddMedicineSchedule({Key? key}) : super(key: key);

  @override
  State<AddMedicineSchedule> createState() => _AddMedicineScheduleState();
}

class _AddMedicineScheduleState extends State<AddMedicineSchedule> {
  @override

  final _formKey = GlobalKey<FormState>();
  final _tagId = TextEditingController();
  final ageCtr = TextEditingController();
  final _toDays = TextEditingController();
  final brithDateCtr = TextEditingController();
  final bodyWeightCtr = TextEditingController();
  final doseC = TextEditingController();
  final direction = TextEditingController();
  final _ScanProd = TextEditingController();
  final _qty = TextEditingController();
  final _Curier = TextEditingController();
  final _trackingId = TextEditingController();
  final _remark = TextEditingController();

  String? Schedule;
  String? Disease;
  String? Medicine;
  String? Period;
  String? Time;
  String? born;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animalCatApi();
    getMedicineListApi();
    getAnimalFilterApi("");
  }
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(text: 'Add Medicine Schedule', isTrue: true, context: context),
      body: SingleChildScrollView(
        child:Form(
          key: _formKey,
          child:Padding(padding: EdgeInsets.all(15),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Custom_Text(text: 'Schedule'),
                // SizedBox(height: 10,),
                // Card(
                //     elevation: 2,
                //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                //     child:
                //     Container(
                //       width: MediaQuery.of(context).size.width,
                //       color: Colors.white,
                //       child: DropdownButton2<String>(
                //         isExpanded: true,
                //         value:Schedule,
                //         //elevation: 5,
                //         style: TextStyle(color: Colors.black87),
                //
                //         items: <String>[
                //           'aaa',
                //           'bbb',
                //           'ccc',
                //           'ddd',
                //         ].map<DropdownMenuItem<String>>((String value) {
                //           return DropdownMenuItem<String>(
                //             value: value,
                //             child: Text(value),
                //           );
                //         }).toList(),
                //
                //
                //         onChanged: (String? value)  {
                //           setState(() {
                //             Schedule= value!;
                //           });
                //         },
                //         icon: Icon(Icons.keyboard_arrow_down),
                //         underline: Container(  // Use a container with zero height to remove the underline
                //           height: 0,
                //           color: Colors.white,
                //         ),
                //       ),
                //     )),
               //SizedBox(height: 15,),
                Text(
                getTranslated(context, "TAG_ID"),
                style: TextStyle(color: colors.blacktextColor),
              ),
                SizedBox(height: 10,),
                Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: TextFormField(
                    controller: _tagId,
                    onChanged: (v){
                      getAnimalFilterApi(v);
                    },


                    // controller: supplementController,
                    decoration: InputDecoration(
                        suffixIcon:InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ScanPay())).then((v){
                              if(v != null){
                                getAnimalFilterApi(v);
                              }
                            });;
                          },
                          child: Container(
                            height: 10,
                            width: 10,
                            padding: EdgeInsets.all(10),
                            child: Image.asset("assets/images/Group 72309.png"),
                          ),
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
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(' Tag ID:f002',style: TextStyle(fontSize:12),),
                    Text('Breed:Sirohi',style: TextStyle(fontSize:12)),
                    Text('Age:4 (Month)',style: TextStyle(fontSize:12)),
                    Text('Weight: 35 kg ',style: TextStyle(fontSize:12)),
                  ],
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
                                    "${getTranslated(context, "TAG_ID" )}" ": ",
                                  ),
                                  Text(
                                    "${milkFiltterModel!.data!.tagId}",
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
                                    "${getTranslated(context, "BREED")}"": ",),
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
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getTranslated(context, "MEDICINE"),
                          style: TextStyle(color: colors.blacktextColor),
                        ),
                        Card(
                          elevation: 3,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<MedicineDate>(
                              hint:  Text(getTranslated(context, "MEDICINE_NAME"),
                                style: TextStyle(
                                    color: colors.black54,fontWeight: FontWeight.w500,fontSize:12
                                ),),
                              value: medicineData,
                              icon:  Icon(Icons.keyboard_arrow_down_rounded,  color:colors.black54,size: 25,),
                              style:  const TextStyle(color: colors.secondary,fontWeight: FontWeight.bold),
                              underline: Padding(
                                padding: const EdgeInsets.only(left: 0,right: 0),
                                child: Container(

                                  // height: 2,
                                  color:  colors.whiteTemp,
                                ),
                              ),
                              onChanged: (MedicineDate? value) {
                                setState(() {
                                  medicineData = value!;
                                  medicineId =  medicineData?.medicineId;


                                  //animalCountApi(animalCat!.id);
                                });
                              },
                              items: getMedicineModel?.data?.map((items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 2),
                                        child: Container(

                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 0),
                                              child: Text(items.medicineName.toString(),overflow:TextOverflow.ellipsis,style: const TextStyle(color:colors.black54),),
                                            )),
                                      ),

                                    ],
                                  ),
                                );
                              })
                                  .toList(),
                            ),

                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getTranslated(context, "CATEGORIES"),
                          style: TextStyle(color: colors.blacktextColor),
                        ),
                        Card(
                          elevation: 3,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<AnimalCatList>(
                              hint:  Text(getTranslated(context, "SELECT_CATE"),
                                style: TextStyle(
                                    color: colors.black54,fontWeight: FontWeight.w500,fontSize:12
                                ),),
                              value: animalCat,
                              icon:  Icon(Icons.keyboard_arrow_down_rounded,  color:colors.black54,size: 25,),
                              style:  const TextStyle(color: colors.secondary,fontWeight: FontWeight.bold),
                              underline: Padding(
                                padding: const EdgeInsets.only(left: 0,right: 0),
                                child: Container(

                                  // height: 2,
                                  color:  colors.whiteTemp,
                                ),
                              ),
                              onChanged: (AnimalCatList? value) {
                                setState(() {
                                  animalCat = value!;
                                  catId =  animalCat?.id;


                                  //animalCountApi(animalCat!.id);
                                });
                              },
                              items: animalCatResponse?.data?.map((items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 2),
                                        child: Container(

                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 0),
                                              child: Text(items.name.toString(),overflow:TextOverflow.ellipsis,style: const TextStyle(color:colors.black54),),
                                            )),
                                      ),

                                    ],
                                  ),
                                );
                              })
                                  .toList(),
                            ),

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           getTranslated(context, 'BODY_WEIGHT'),
                           style: TextStyle(color: colors.blacktextColor,),
                         ),
                         Card(
                           elevation: 3.0,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(4.0),
                           ),
                           child:Container(
                               width: size.width/2.5,
                               child: TextFormField(
                                 controller: bodyWeightCtr,
                                 decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.only(left: 5)),
                                 validator: (value){
                                   if(value?.length==null||value!.isEmpty){
                                     return "${getTranslated(context, "BODY_WEIGHT")} ${getTranslated(context, "IS_REQUIRED")}";
                                   }
                                 },
                               )),
                         ),
                       ],
                     ),
                     SizedBox(
                       height: 10,
                     ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           getTranslated(context, "DOSE"),
                           style: TextStyle(color: colors.blacktextColor),
                         ),
                         Card(
                           elevation: 1.0,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(4.0),
                           ),
                           child: Container(
                               width: size.width/2.5,
                               child: TextFormField(
                                 controller: doseC,
                                 decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.only(left: 5)),
                                 validator: (value){
                                   if(value?.length==null||value!.isEmpty){
                                     return "${getTranslated(context, "Dose")} ${getTranslated(context, "IS_REQUIRED")}";
                                   }
                                 },
                               )),
                         ),
                       ],
                     ),

                   ],
                 ),
                  SizedBox(
                  height: 10,
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${getTranslated(context, "PEROID")}',style: TextStyle(color: colors.black54),),
                          SizedBox(height: 5,),
                          Container(
                            width: 155,
                            decoration: BoxDecoration(
                                color: colors.whiteTemp
                            ),

                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                //dropdownMaxHeight: 300,
                                hint: Text("Select",
                                  style: TextStyle(
                                      color: colors.black54,fontWeight: FontWeight.normal,fontSize: 14
                                  ),),
                                // dropdownColor: colors.primary,
                                value: Period,
                                icon:  const Padding(
                                  padding: EdgeInsets.only(bottom: 0,left: 10),
                                  child: Icon(Icons.keyboard_arrow_down_rounded,  color: colors.black54,size: 30,),
                                ),
                                // elevation: 16,
                                style:  TextStyle(color: colors.secondary,fontWeight: FontWeight.bold),
                                underline: Container(
                                  // height: 2,
                                  color:  colors.whiteTemp,
                                ),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    Period = value!;

                                  });
                                },
                                items: ['One Time','Continuous']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,

                                    child:
                                    Text(value,style: const TextStyle(color: colors.black54,fontWeight: FontWeight.normal),),
                                  );

                                }).toList(),

                              ),

                            ),
                          ),


                        ],
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(child: getViewBasedOnSelectedValue()),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 5,),
                    Text(
                      getTranslated(context, "DIRECTION")+" : ",
                      style: TextStyle(

                          fontSize: 15,
                          color: colors.black54),
                    ),
                  ],
                ),

                Card(
                  child: Container(
                      child: TextFormField(
                        controller: direction,
                        decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.only(left: 7)),
                      )),
                ),

                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 5,),
                    Text(getTranslated(context, "MEDICINE_PREGNANT"),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  ],
                ),

                Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                            value: "YES",
                            groupValue: male,
                            // activeColor: MyColors.primaryColor,
                            onChanged: (val) {
                              setState(() {
                                male = val!;
                              });
                            }
                        ),
                        Text(getTranslated(context, "YES"),),

                        // ParagraphText('Male', fontSize: 15, color: MyColors.grey2,),
                      ],
                    ),

                    Row(
                      children: [
                        Radio(
                            value: "NO",
                            groupValue: male,
                            //  activeColor: MyColors.primaryColor,
                            onChanged: (val) {
                              setState(() {
                                male = val!;
                              });
                            }
                        ),

                        Text(getTranslated(context, "NO"),),
                        //ParagraphText('Female', fontSize: 15, color: MyColors.grey2,),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Custom_Text(text: '${getTranslated(context, "UNIT")}'),
                          Card(
                            child: Container(
                              width: size.width / 2.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: const Padding(
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: Text(
                                      "ml",
                                      style: TextStyle(
                                          color: colors.blackTemp,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14),
                                    ),
                                  ),
                                  // dropdownColor: colors.primary,
                                  value: unitVNew,
                                  icon: const Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: colors.black54,
                                      size: 30,
                                    ),
                                  ),
                                  // elevation: 16,
                                  style: TextStyle(
                                      color: colors.secondary,
                                      fontWeight: FontWeight.bold),
                                  underline: Padding(
                                    padding: const EdgeInsets.only(left: 0, right: 0),
                                    child: Container(
                                      // height: 2,
                                      color: colors.whiteTemp,
                                    ),
                                  ),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      unitVNew = value!;
                                    });
                                  },

                                  items: unitType
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              value,
                                              style: const TextStyle(
                                                  color: colors.textColor,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Custom_Text(text: '${getTranslated(context, "TIME")}'),
                          Row(
                            children: [
                              Card(
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                                  child:
                                  Container(
                                    width: 120,
                                    // color: Colors.white,
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      value:Time,
                                      //elevation: 5,
                                      style: TextStyle(color: Colors.black87),

                                      items: <String>[
                                        'Morning',
                                        'Evening',
                                        'Morning & Evening',
                                      ].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),


                                      onChanged: (String? value)  {
                                        setState(() {
                                          Time= value!;
                                        });
                                      },
                                      icon: Icon(Icons.keyboard_arrow_down_sharp),
                                      underline: Container(  // Use a container with zero height to remove the underline
                                        height: 0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                              InkWell(
                                onTap: (){
                                  if(bodyWeightCtr.text.isEmpty||doseC.text.isEmpty||animalCat==null||unitType ==  null) {

                                    Fluttertoast.showToast(msg: "Please Fill category, bodyWeight,doseC And Unit ");
                                  }else{
                                    setState(() {
                                      animalIdList.add(_tagId.text);
                                      medicineList.add(medicineId.toString());
                                      periodList.add(Period.toString());
                                      todayList.add(brithDateCtr.text);
                                      fromDayList.add(_toDays.text);
                                      timeList.add(Time.toString());
                                      catNewList.add(catId.toString());
                                      bodyList.add(bodyWeightCtr.text);
                                      doessList.add(doseC.text);
                                      unitList.add(unitVNew);
                                      directionList.add(direction.text);
                                      pregnantList.add(male.toString());
                                      Map<String, String> newCat = {
                                        "tag": "${_tagId.text}",
                                        "medicineName": "${medicineData?.medicineName}",
                                        "period": "${Period}",
                                        "today": "${brithDateCtr.text}",
                                        "form": "${_toDays.text}",
                                        "time": "${Time.toString()}",
                                        "cat": "${animalCat?.name}",
                                        "body": "${bodyWeightCtr.text}",
                                        "dose": "${doseC.text}",
                                        "unit": "${unitVNew}",
                                        "direction": "${direction.text}",
                                        "pregnant": "${male.toString()}",
                                      };
                                      addTableList.add(newCat);
                                      print('_____pregnantList_____${pregnantList}_________');
                                      bodyWeightCtr.clear();
                                         brithDateCtr.clear();
                                         _tagId.clear();
                                         //pregnantList.clear();
                                        _toDays.clear();
                                      doseC.clear();
                                    animalCat?.name == null;
                                     unitVNew== null;
                                    });

                                  }
                                },
                                child: Container(
                                  height: 45,
                                  width: size.width/9,
                                  child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: colors.white70,
                                        size: 30,
                                      )),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: colors.darkBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          // Text(' Medicine ID : SP0104',style: TextStyle(fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ]),
                SizedBox(height: 15,),


                addTableList.isEmpty ? SizedBox.shrink():
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Card(
                        child: Container(
                          child: Column(
                            children: [
                              DataTable(
                                columns: [
                                  DataColumn(label: Text(getTranslated(context, "TAG_ID"))),
                                  DataColumn(label: Text(getTranslated(context, "MEDICINE_NAME"))),
                                  DataColumn(label: Text(getTranslated(context, "PEROID"))),
                                  DataColumn(label: Text(getTranslated(context, "TO_DAYS"))),
                                 DataColumn(label: Text(getTranslated(context, "FROM"))),
                                  DataColumn(label: Text(getTranslated(context, "TIME"))),
                                  DataColumn(label: Text(getTranslated(context, "CATEGORY"))),
                                  DataColumn(label: Text(getTranslated(context, "BODY_WEIGHT"))),
                                  DataColumn(label: Text(getTranslated(context, "DOSE"))),
                                  DataColumn(label: Text(getTranslated(context, "UNIT"))),
                                  DataColumn(label: Text(getTranslated(context, "DIRECTION"))),
                                  DataColumn(label: Text(getTranslated(context, "PREGNANT"))),

                                ],
                                rows: addTableList.map((data) => DataRow(
                                  cells: [
                                    DataCell(Text(data["tag"])),
                                    DataCell(Text(data["medicineName"])),
                                    DataCell(Text(data["period"])),
                                     DataCell(Text(data["today"])),
                                    fromDayList.isEmpty?DataCell(Text("")):DataCell(Text(data["form"])),
                                    DataCell(Text(data["time"])),
                                    DataCell(Text(data["cat"])),
                                    DataCell(Text(data["body"])),
                                    DataCell(Text(data["dose"])),
                                    DataCell(Text(data["unit"])),
                                    DataCell(Text(data["direction"])),
                                    DataCell(Text(data["pregnant"])),

                                  ],
                                )).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Btn(
                  onPress: (){
                    addMedicineScheduleApi();
                    // if(_tagId.text.isEmpty){
                    //
                    // }else if(catValueNew ==  null){
                    //   Fluttertoast.showToast(msg: "Please select medicine");
                    // }else if(weightValueNew == null){
                    //   Fluttertoast.showToast(msg: "Please select disease");
                    // // }else if(addTableList == null ){
                    // //   Fluttertoast.showToast(msg: "Please select medicine Schedule");
                    // }else if(qtyValueNew == null ){
                    //   Fluttertoast.showToast(msg: "Please select qty");
                    // }else if(unitVNew == null ){
                    //   Fluttertoast.showToast(msg: "Please select unit");
                    // }
                    // else{
                    //   Fluttertoast.showToast(msg: "Please select all field..");
                    // }
                  },

                  height:45,width: MediaQuery.of(context).size.width,
                  title: getTranslated(context, "SAVE"),
                ),


              ],
            ) ,
          ),

        ),
      ),
    );
  }
  String? selectedBirthDate;
  Widget getViewBasedOnSelectedValue() {
    switch (Period) {
      case 'One Time':
        return onTimeView();
      case 'Continuous':
        return allTimeView();
      default:
        return Container();
    }
  }

  bool isLoading = true;
  Future<void> addMedicineScheduleApi() async {
    setState(() {
      isLoading = true;
    });

    // var parameter = jsonEncode({
    //   'category':catNewList.toString(),
    //   'weight':bodyList.toString(),
    //   'dose':doessList.toString(),
    //   'unit':unitList.toString(),
    //   'direction':directionList.toString(),
    //   'safe_for_pregnant':pregnantList.toString(),
    //   'animal_id':animalIdList.toString(),
    //   'medicine_id':medicineList.toString(),
    //   'period':periodList.toString(),
    //   'date':todayList.toString(),
    //   'day':fromDayList.toString(),
    //   'time':timeList.toString()
    // });
    var parameter = jsonEncode({
      "category": extractNumbers(catNewList.toString()),
      "weight": extractNumbers(bodyList.toString()),
      "dose": extractNumbers(doessList.toString()),
      "unit": extractStrings(unitList.toString()),
      "direction": extractStrings(directionList.toString()),
      "safe_for_pregnant": extractBooleans(pregnantList.toString()),
      "animal_id": extractStrings(animalIdList.toString()),
      "medicine_id": extractNumbers(medicineList.toString(),),
      "period": extractStrings(periodList.toString(),),
      "date": extractStrings(todayList.toString()),
      "day": extractNumbers(fromDayList.toString()),
      "time": extractStrings(timeList.toString()),
    });

    var response = await http.post(Uri.parse(ApiService.aadMedicineSchedule), body:parameter);
    Fluttertoast.showToast(msg: "Add Medicine Schedule Successfully");
   Navigator.pop(context);
    // print('____response______${response}___${parameter}______');
  }

  List<String> extractStrings(String input) {
    List<dynamic> list = extractValues(input);
    return list.map((value) => value.toString()).toList();
  }

  List<String> extractNumbers(String input) {
    List<dynamic> list = extractValues(input);
    return list.map((value) => value.toString()).toList();
  }

  List<bool> extractBooleans(String input) {
    List<dynamic> list = extractValues(input);
    return list.map((value) => value.toString().toUpperCase() == "YES").toList();
  }

  List<dynamic> extractValues(String input) {
    List<String> values = input.replaceAll(RegExp(r'[\[\]\s]'), '').split(',');
    return values.map((value) => value.trim()).toList();
  }
  GetSingleDataMedicineModel? milkFiltterModel;
  getAnimalFilterApi(String? tagId) async {
    var parameter = {
      'tag_id':tagId
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.getMedicineSingleData), parameter).then((getData) {
      String msg = getData['message'];
      setState(() {
        milkFiltterModel = GetSingleDataMedicineModel.fromJson(getData);
        Fluttertoast.showToast(msg: "${msg}");
      });

    });
  }

  onTimeView(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custom_Text(text: '${getTranslated(context, "TO_DAYS")}'),
                SizedBox(height: 8,),
                GestureDetector(
                    onTap: () async {
                      DateTime? datePicked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2024));
                      if (datePicked != null) {
                        print(
                            'Date Selected:${datePicked.day}-${datePicked.month}-${datePicked.year}');
                        String formettedDate =
                        DateFormat('dd-MM-yyyy').format(datePicked);
                        setState(() {
                          selectedBirthDate = formettedDate;

                        });
                      }
                    },
                    child: Container(
                      width: 140,
                      color: Colors.white,
                      child:  TextFormField(
                        readOnly: true,
                        onTap:
                            () async{
                          DateTime? datePicked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2024));
                          if (datePicked != null) {
                            print(
                                'Date Selected:${datePicked.day}-${datePicked.month}-${datePicked.year}');
                            String formettedDate =
                            DateFormat('dd-MM-yyyy').format(datePicked);
                            setState(() {
                              selectedBirthDate = formettedDate;
                              brithDateCtr.text = formettedDate;
                             // getDateApi(selectedBirthDate!);
                            });
                          }
                        },
                        controller: brithDateCtr,
                        decoration: InputDecoration(
                          border:InputBorder.none,
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'dd-mm-yyyy',
                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (value){
                          if(value==null||value.isEmpty)
                            return "Please enter birth date";
                          return null;
                        },
                      ),
                    )
                ),

              ],
            ),
          ],
        ),
      ],
    );
  }
  allTimeView(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Custom_Text(text: '${getTranslated(context, "FROM_DAYS")}'),
        SizedBox(height: 15,),
        Container(
          width: 140,
          color: Colors.white,
          child:  TextFormField(
            controller: _toDays,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border:InputBorder.none,
              contentPadding: EdgeInsets.all(10),
              // border: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(10)),
            ),
            validator: (value){
              if(value==null||value.isEmpty)
                return "Please enter age";
              return null;
            },
          ),
        ),
        SizedBox(height: 10,),

      ],
    );

  }
  String? catId;
  AnimalCatList? animalCat;
  AnimalCatResponse? animalCatResponse;
  Future<void> animalCatApi() async {
    apiBaseHelper.getAPICall(Uri.parse(ApiService.animalCategory)).then((getData) {
      bool error = getData ['error'];
      if(!error){
        animalCatResponse = AnimalCatResponse.fromJson(getData);
        setState(() {

        });
      }else {

      }

    });

  }



  String? medicineId;
  MedicineDate? medicineData;
  GetMedicineModel? getMedicineModel;
  Future<void> getMedicineListApi() async {
    apiBaseHelper.getAPICall(Uri.parse(ApiService.getMedicineList)).then((getData) {
      bool error = getData ['error'];
      print('___getData_______${getData}_________');
      setState(() {
        getMedicineModel = GetMedicineModel.fromJson(getData);
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

  List animalIdList=[];
  List medicineList=[];
  List periodList=[];
  List todayList=[];
  List fromDayList=[];
  List directionList=[];
  List timeList=[];
  List pregnantList=[];

List bodyList=[];
List doessList=[];
List unitList=[];
List catNewList=[];
List addTableList=[];
}