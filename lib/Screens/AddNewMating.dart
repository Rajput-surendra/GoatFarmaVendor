import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:madhu_farma/Helper/session.dart';

import '../ApiPath/Api.dart';
import '../Helper/AppBtn.dart';
import '../Helper/Appbar.dart';
import '../Model/MatingAnimalRecord/animal_single_model.dart';
import '../Model/MatingAnimalRecord/check_mating_model.dart';
import '../Utils/Colors.dart';
import 'TextFormCard.dart';

class AddNewMating extends StatefulWidget {
  const AddNewMating({Key? key}) : super(key: key);

  @override
  State<AddNewMating> createState() => _AddNewMatingState();
}

class _AddNewMatingState extends State<AddNewMating> {
  String? mating;
  String? matingStatus;
  String? matingType ;
  String selectedValue = 'Artificial';
  final _formKey =GlobalKey<FormState>();

  TextEditingController breedController = TextEditingController();
  TextEditingController breedIdController = TextEditingController();
  TextEditingController semenController = TextEditingController();
  TextEditingController doseController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController tIdC = TextEditingController();
  String? selectedBirthDate;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "ADD_NEW_MATING"),
        isTrue: true,
      ),
      backgroundColor: colors.grad1Color,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 5,),
                              Text(getTranslated(context, "Tag_ID"),style: TextStyle(color: colors.blackTemp),),
                              Text("*",style: TextStyle(color: colors.red)),
                            ],
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                              child: Container(
                                height: 50,
                                child: Center(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (v){
                                      getAnimalSingleApi(v);
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
                                        return 'Please Enter id';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
               SizedBox(height: 10,),
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
                                    "${getTranslated(context, "WEIGHT")}"": ",),
                                  Text(
                                    "${milkFiltterModel!.data!.weight}Kg.",
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
                                    "${getTranslated(context, "LAST_BREEDER")}" ": ",

                                  ),
                                  Text(
                                    "${milkFiltterModel?.data?.lastBreeder}",
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
                SizedBox(height: 10,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${getTranslated(context, "MATTING_TYPE")}',style: TextStyle(color: colors.black54),),
                    SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(
                        color: colors.whiteTemp
                      ),
                      width: double.infinity,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          //dropdownMaxHeight: 300,
                          hint: Text("Select",
                            style: TextStyle(
                                color: colors.black54,fontWeight: FontWeight.normal,fontSize: 14
                            ),),
                          // dropdownColor: colors.primary,
                          value: selectedValue,
                          icon:  const Padding(
                            padding: EdgeInsets.only(bottom: 0,left: 10),
                            child: Icon(Icons.keyboard_arrow_down_rounded,  color: colors.secondary,size: 30,),
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
                              selectedValue = value!;

                            });
                          },
                          items: ['Artificial','Natural']
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
                    SizedBox(height: 10,),
                    getViewBasedOnSelectedValue(),

                  ],
                ),
                SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${getTranslated(context, "BREEDING")}',style: TextStyle(color: colors.black54),),
                    SizedBox(height: 5,),
                    Card(
                      child: Container(
                        height: 50,
                        color: colors.whiteTemp,
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          value:matingType,
                          icon:  const Padding(
                            padding: EdgeInsets.only(bottom: 0,left: 10),
                            child: Icon(Icons.keyboard_arrow_down_rounded,  color: colors.secondary,size: 30,),
                          ),
                          //elevation: 5,
                          style: TextStyle(color: Colors.black87),

                          items: <String>[
                            'Cross',
                            'blood line',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),

                          hint: Text(
                            "Select Breeding",style: TextStyle(fontSize: 15),
                          ),
                          onChanged: (String? value)  {
                            setState(() {
                              matingType = value!;
                            });
                          },
                          // icon: Icon(Icons.keyboard_arrow_down),
                          underline: Container(  // Use a container with zero height to remove the underline
                            height: 0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:EdgeInsets.only(left: 7) ,
                      child: Text(
                        "Mating Status",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 13
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Card(
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        color: colors.whiteTemp,
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          value:matingStatus,
                          icon:  const Padding(
                            padding: EdgeInsets.only(bottom: 0,left: 10),
                            child: Icon(Icons.keyboard_arrow_down_rounded,  color: colors.secondary,size: 30,),
                          ),
                          //elevation: 5,
                          style: TextStyle(color: Colors.black87),

                          items: <String>[
                            'Not Successful',
                            'Pregnant',
                            'Miscarriage',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),

                          hint: Text(
                            "Mating Status",style: TextStyle(fontSize: 15),
                          ),
                          onChanged: (String? value)  {
                            setState(() {
                              matingStatus = value!;
                            });
                          },
                          // icon: Icon(Icons.keyboard_arrow_down),
                          underline: Container(  // Use a container with zero height to remove the underline
                            height: 0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Text("Expected Delivery Due Date : 04/10/2023"),

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
                      color: colors.whiteTemp,
                      // width: MediaQuery.of(context).size.width/2.3,
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
                              dateController.text = formettedDate;
                            });
                          }
                        },
                        controller: dateController,
                        decoration: InputDecoration(
                          border:InputBorder.none,
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'dd-mm-yyyy',
                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(10)),
                        ),

                      ),
                    )
                ),
                SizedBox(height: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${getTranslated(context, "REMARK")}',style: TextStyle(color: colors.black54),),
                    SizedBox(height: 5),
                    Container(
                      color: colors.whiteTemp,
                      child:TextFormField(
                        keyboardType: TextInputType.number,
                        controller: remarkController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            border: InputBorder.none),

                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25,),
                Btn(
                  title: isLoading ? getTranslated(context, "PLEASE"):getTranslated(context, "SAVE"),
                  height: MediaQuery.of(context).size.width/8,
                  width:MediaQuery.of(context).size.width/1.2 ,
                  onPress: (){
                    if(!_formKey.currentState!.validate()){
                      Fluttertoast.showToast(msg: "Tag id are required");
                    }else if (matingType == null) {
                      Fluttertoast.showToast(msg: "Please select breeding type");
                    }
                    else if (matingStatus == null){
                      Fluttertoast.showToast(msg: "Please select mating type");
                    }else{
                      addMatingApi();
                    }

                  },
                ),



              ],
            ),
          ),
        ),


      )
    );
  }

  Widget getViewBasedOnSelectedValue() {
    switch (selectedValue) {
      case 'Artificial':
        return naturalView();
      case 'Natural':
        return artificialView();
      default:
        return Container();
    }
  }
  artificialView(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('${getTranslated(context, "MALE_ID")}',style: TextStyle(color: colors.black54)),
              SizedBox(height: 5),
              Container(
                color: colors.whiteTemp,
                child: TextFormField(
                  onChanged: (v){
                    checkBreedMatingApi(v);
                  },
                  keyboardType: TextInputType.number,
                  controller: breedIdController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      border: InputBorder.none),

                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 5,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${getTranslated(context, "BREED")}',style: TextStyle(color: colors.black54),),
              SizedBox(height: 5),
              Container(
                color: colors.whiteTemp,
                child:TextFormField(
                  keyboardType: TextInputType.number,
                  controller: breedController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      border: InputBorder.none),

                ),
              ),
            ],
          ),
        )
      ],
    );
  }
  naturalView(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('Semen',style: TextStyle(color: colors.black54)),
              SizedBox(height: 5),
              Container(
                color: colors.whiteTemp,
                child: TextFormField(
                  onChanged: (v){
                    checkBreedMatingApi(v);
                  },
                  keyboardType: TextInputType.number,
                  controller: semenController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      border: InputBorder.none),

                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 5,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${getTranslated(context, "DOSE")}',style: TextStyle(color: colors.black54),),
              SizedBox(height: 5),
              Container(
                color: colors.whiteTemp,
                child:TextFormField(
                  keyboardType: TextInputType.number,
                  controller: doseController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      border: InputBorder.none),

                ),
              ),
            ],
          ),
        )
      ],
    );

  }


  MatingAnimalSingleDataModel? milkFiltterModel;
  getAnimalSingleApi(String? tagId) async {
    var parameter = {
      'animal_id':tagId
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.matingAnimalDate), parameter).then((getData) {
      String msg = getData['message'];
      setState(() {
        milkFiltterModel = MatingAnimalSingleDataModel.fromJson(getData);
        Fluttertoast.showToast(msg: "${msg}");
      });

    });
  }

  CheckBreedModel? checkBreedModel;
  checkBreedMatingApi(String? tagId) async {
    var parameter = {
      'animal_id':tagId
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.checkBreedMating), parameter).then((getData) {
      String msg = getData['message'];
      setState(() {
        checkBreedModel = CheckBreedModel.fromJson(getData);
        Fluttertoast.showToast(msg: "${msg}");
        breedController.text =  checkBreedModel!.breed ?? "";
      });

    });
  }



  bool isLoading = false;
  Future<void> addMatingApi() async {
    setState(() {
      isLoading = true;
    });
    var parameter = {
      'female_id':tIdC.text,
      'meating_type':selectedValue,
      'breeding':matingType,
      'male_id':breedIdController.text,
      'semen':semenController.text,
      'dose':doseController.text,
      'meating_status':matingStatus,
      'expected_due_date':dateController.text
    };
    print('_____parameter_____${parameter}_________');
    apiBaseHelper.postAPICall(Uri.parse(ApiService.addMating), parameter).then((getData) async {
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



}
