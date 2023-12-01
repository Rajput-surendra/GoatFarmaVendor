import 'dart:io';
import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../ApiPath/Api.dart';
import '../Helper/AppBtn.dart';
import '../Helper/CustomText.dart';
import '../Helper/session.dart';
import '../Model/animal_cat_model_response.dart';
import '../Model/breed_list_model.dart';
import '../Record/AnimalRecord.dart';
import '../Scanner/scanner_view.dart';
import '../Utils/Colors.dart';
import '../helper/appbar.dart';

class AddNewAnimal extends StatefulWidget {
   AddNewAnimal({Key? key,}) : super(key: key);

  @override
  State<AddNewAnimal> createState() => _AddNewAnimalState();
}

class _AddNewAnimalState extends State<AddNewAnimal> {

  String _btn='Breeder';
  String _btn2='yes';
  int weight=35;
  int sale=450;
  int breederIndex=1;
  int kurbaniIndex=0;
  int cuttingIndex=0;
  int yesIndex=1;
  int noIndex=0;
  String? userType;
  String? breed;
  String?gender;
  String? born;
  TextEditingController brithDateCtr = TextEditingController();
  TextEditingController brithWeightCtr = TextEditingController();
  TextEditingController animalNameCtr = TextEditingController();
  TextEditingController nameCtr = TextEditingController();
  TextEditingController motherCtr = TextEditingController();
  TextEditingController fatherCtr = TextEditingController();
  TextEditingController purchaseDateCtr = TextEditingController();
  TextEditingController ageCtr = TextEditingController();
  TextEditingController weightCtr = TextEditingController();
  TextEditingController saleWeightCtr = TextEditingController();
  TextEditingController salePriceCtr = TextEditingController();
  TextEditingController selectDeliveryDateCtr = TextEditingController();
  String _radioValue = 'Yes';
  TextEditingController _textEditingController = TextEditingController();
  final _formKey =GlobalKey<FormState>();
  String? selectedBirthDate;
  String? selectedPurchaseDate;
  String? selectedDeliveryDate;
  File? image;

  Future<void> _showImageSourceDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Image Source'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                pickImage(ImageSource.gallery);
              },
              child: Text('Gallery'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                pickImage(ImageSource.camera);
              },
              child: Text('Camera'),
            ),
          ],
        );
      },
    );
  }
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
      imageQuality: 50, // You can adjust the image quality here
    );

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path) ;
        selectedImageList.add(selectedImage ?? File(''));
      });
    }
  }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animalCatApi();
    breedListApi();
    getDataProfile();
    getRandomNumber();
  }

   getRandomNumber(){
     Random random = Random();
     randomNumber = random.nextInt(10000) - 1;
    animalNameCtr.text = randomNumber.toString() ;
  }
  int? randomNumber ;

  String? userId ;
  getDataProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId  =  prefs.getString('userId');

    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, text: "${getTranslated(context, "ADD_NEW_RECORD")}", isTrue: true,),
      backgroundColor:colors.grad1Color,
      body: SingleChildScrollView(
        child:Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(text: '${getTranslated(context, "CATEGORIES")}'),
                        SizedBox(height: 8,),
                        Container(
                          height: 55,
                          width: 160,
                          child: Card(
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
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
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(text: '${getTranslated(context, "BREED")}'),
                        SizedBox(height: 8,),
                        Container(
                          width: 160,
                          height: 55,
                          child: Card(
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<BreedDataList>(
                                  hint:  Text(getTranslated(context, "BREED"),
                                    style: TextStyle(
                                        color: colors.black54,fontWeight: FontWeight.w500,fontSize:12
                                    ),),
                                  value: animalBreed,
                                  icon:  Icon(Icons.keyboard_arrow_down_rounded,  color:colors.black54,size: 25,),
                                  style:  const TextStyle(color: colors.secondary,fontWeight: FontWeight.bold),
                                  underline: Padding(
                                    padding: const EdgeInsets.only(left: 0,right: 0),
                                    child: Container(
                                      // height: 2,
                                      color:  colors.whiteTemp,
                                    ),
                                  ),
                                  onChanged: (BreedDataList? value) {
                                    setState(() {
                                      animalBreed = value!;
                                      breedId =  animalBreed?.id;
                                    });
                                  },
                                  items: breedListModel?.data?.map((items) {
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
                                                  child: Text(items.parent.toString(),overflow:TextOverflow.ellipsis,style: const TextStyle(color:colors.black54),),
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
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(text: '${getTranslated(context, "TAG_ID")}'),
                        SizedBox(height: 8,),
                        GestureDetector(
                            child: Container(
                              width: MediaQuery.of(context).size.width/2.3,
                              color: Colors.white,
                              child:  TextFormField(
                                readOnly: true,
                                controller: animalNameCtr,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefix: Text("GOTN",style: TextStyle(color: colors.blackTemp),),
                                  border:InputBorder.none,
                                  contentPadding: EdgeInsets.all(10),
                                  // border: OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(10)),
                                ),
                                validator: (value){
                                  if(value==null||value.isEmpty)
                                    return "Please enter tagId";
                                  return null;
                                },
                              ),
                            )
                        ),
                      ],
                    ),
                    SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(text: '${getTranslated(context, "GENDER")}'),
                        SizedBox(height: 8,),
                        Container(
                          width: MediaQuery.of(context).size.width/2.3,
                          color: Colors.white,
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            value:gender,
                            //elevation: 5,
                            style: TextStyle(color: Colors.black87),

                            items: <String>[
                              '${getTranslated(context, "MALE")}',
                              '${getTranslated(context, "FEMALE")}',
                              '${getTranslated(context, "OTHER")}'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            icon: Icon(Icons.keyboard_arrow_down),
                            hint: Text(
                              "${getTranslated(context, "GENDER")}",
                            ),
                            onChanged: (String? value)  {
                              setState(() {
                                gender = value!;
                              });
                            },

                            underline: Container(  // Use a container with zero height to remove the underline
                              height: 0,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom_Text(text: '${getTranslated(context, "PROCUREMENT")}'),
                    SizedBox(height: 8,),
                    Container(
                      // width: MediaQuery.of(context).size.width/2.3,
                      color: Colors.white,
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        value:born,
                        //elevation: 5,
                        style: TextStyle(color: Colors.black87),

                        items: <String>[
                          'Born at Farm',
                          'Born another place'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        icon: Icon(Icons.keyboard_arrow_down),
                        hint: Text(
                          "Where Born",
                        ),
                        onChanged: (String? value)  {
                          setState(() {
                            born = value!;
                          });
                        },

                        underline: Container(  // Use a container with zero height to remove the underline
                          height: 0,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(text: '${getTranslated(context, "BIRTH_DATE")}'),
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
                              width: MediaQuery.of(context).size.width/2.3,
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
                    SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(text: '${getTranslated(context, "BIRTH_WEIGHT")}'),
                        SizedBox(height: 8,),
                        GestureDetector(
                            child: Container(
                              width: MediaQuery.of(context).size.width/2.3,
                              color: Colors.white,
                              child:  TextFormField(
                                controller: brithWeightCtr,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border:InputBorder.none,
                                  contentPadding: EdgeInsets.all(10),
                                  // border: OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(10)),
                                ),
                                validator: (value){
                                  if(value==null||value.isEmpty)
                                    return "Please enter birth weight";
                                  return null;
                                },
                              ),
                            )
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(text: '${getTranslated(context, "MOTHER_ID")}'),
                        SizedBox(height: 8,),
                        GestureDetector(
                            child: Container(
                              width: MediaQuery.of(context).size.width/2.3,
                              color: Colors.white,
                              child:  TextFormField(
                                controller: motherCtr,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border:InputBorder.none,
                                  contentPadding: EdgeInsets.all(10),
                                  // border: OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(10)),
                                ),

                              ),
                            )
                        ),
                      ],
                    ),
                    SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(text: '${getTranslated(context,"FATHER_ID")}'),
                        SizedBox(height: 8,),
                        GestureDetector(
                            child: Container(
                              width: MediaQuery.of(context).size.width/2.3,
                              color: Colors.white,
                              child:  TextFormField(
                                controller: fatherCtr,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border:InputBorder.none,
                                  contentPadding: EdgeInsets.all(10),
                                  // border: OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(10)),
                                ),

                              ),
                            )
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(text: '${getTranslated(context, "PURCHASE_DATE")}'),
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
                                  selectedPurchaseDate = formettedDate;
                                });
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/2.3,
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
                                      selectedPurchaseDate= formettedDate;
                                      purchaseDateCtr.text = formettedDate;
                                    });
                                  }
                                },
                                controller: purchaseDateCtr,
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
                      ],
                    ),
                    SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(text: '${getTranslated(context, "AGE")}'),
                        SizedBox(height: 8,),
                        GestureDetector(
                            child: Container(
                              width: MediaQuery.of(context).size.width/2.3,
                              color: Colors.white,
                              child:  TextFormField(
                                controller: ageCtr,
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
                            )
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(text: '${getTranslated(context, "WEIGHT")}'),
                        SizedBox(height: 8,),
                        GestureDetector(
                            child: Container(
                              width: MediaQuery.of(context).size.width/2.3,
                              color: Colors.white,
                              child:  TextFormField(
                                controller: weightCtr,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border:InputBorder.none,
                                  contentPadding: EdgeInsets.all(10),
                                  // border: OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(10)),
                                ),
                                validator: (value){
                                  if(value==null||value.isEmpty)
                                    return "Please enter weight";
                                  return null;
                                },
                              ),
                            )
                        ),
                      ],
                    ),
                    SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(text: '${getTranslated(context, "PHOTO")}'),
                        SizedBox(height: 8,),
                        Container(
                          width: MediaQuery.of(context).size.width/2.3,
                          // height: ,
                          color: Colors.white,
                          child:  GestureDetector(
                            onTap:(){ _showImageSourceDialog(context);},
                            child: Padding(padding: EdgeInsets.only(top: 15,right: 8,bottom: 15,left: 15),

                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [

                                    if(selectedImage==null)
                                      Text('${getTranslated(context, "IMAGE")}')
                                    else if(selectedImage != null)
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width/2.8,
                                        child: Text('$selectedImage',overflow: TextOverflow.ellipsis,),),

                                  ],
                                )
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom_Text(text: '${getTranslated(context, "IF_PREGNANT_:_EXPECTED_DELIVERY_DUE_DATE")}'),
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
                              selectedDeliveryDate = formettedDate;

                            });
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/2.3,
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
                                  selectedDeliveryDate= formettedDate;
                                  selectDeliveryDateCtr.text =  formettedDate;
                                });
                              }
                            },
                            controller: selectDeliveryDateCtr,
                            decoration: InputDecoration(
                              border:InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                              hintText: 'dd-mm-yyyy',
                              // border: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(10)),
                            ),
                            validator: (value){
                              if(value==null||value.isEmpty)
                                return "Please Enter delivery Date";
                              return null;
                            },
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Text('${getTranslated(context, "IF_MALE_SELECT_TYPE")}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Radio(value: value, groupValue: groupValue, onChanged: onChanged)
                    Row(
                      children: [
                        Radio(value:'${getTranslated(context, "BREEDER")}', groupValue: _btn,

                            activeColor: (breederIndex==1)?Color(0xff002E77):Colors.grey,
                            fillColor: MaterialStateColor.resolveWith((states) => (breederIndex==1)?Color(0xff002E77):Colors.grey ),
                            onChanged:(value){
                              setState(() {
                                _btn=value.toString();
                                breederIndex=1;
                                kurbaniIndex=0;
                                cuttingIndex=0;
                              });
                            }),
                        Text('${getTranslated(context, "BREEDER")}',style: TextStyle(color:(breederIndex==1)?Color(0xff002E77):Colors.grey ),)
                      ],
                    ),
                    Row(
                      children: [
                        Radio(value:'${getTranslated(context, "KURBANI")}', groupValue: _btn,

                            activeColor: (kurbaniIndex==1)?Color(0xff002E77):Colors.grey,
                            fillColor: MaterialStateColor.resolveWith((states) => (kurbaniIndex==1)?Color(0xff002E77):Colors.grey ),
                            onChanged:(value){
                              setState(() {

                                _btn=value.toString();
                                breederIndex=0;
                                kurbaniIndex=1;
                                cuttingIndex=0;
                              });
                            }),
                        Text('${getTranslated(context, "KURBANI")}',style: TextStyle(color:(kurbaniIndex==1)?Color(0xff002E77):Colors.grey ),)
                      ],
                    ),
                    Row(
                      children: [
                        Radio(value:'${getTranslated(context, "CUTTING")}', groupValue: _btn,
                            activeColor: Color(0xff002E77),
                            fillColor: MaterialStateColor.resolveWith((states) => (cuttingIndex==1)?Color(0xff002E77):Colors.grey ),
                            onChanged:(value){
                              setState(() {
                                _btn=value.toString();
                                kurbaniIndex=0;
                                breederIndex=0;
                                cuttingIndex=1;
                              });
                            }),
                        Text('${getTranslated(context, "CUTTING")}',style: TextStyle(color:(cuttingIndex==1)?Color(0xff002E77):Colors.grey ) ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,color: Colors.grey,),
                SizedBox(height: 15
                  ,),
                Text('${getTranslated(context, "READY_FOR_SALE")}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
               /* Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(value:'${getTranslated(context, "YES")}', groupValue: _btn2,

                            activeColor: (yesIndex==1)?Color(0xff002E77):Colors.grey ,
                            fillColor: MaterialStateColor.resolveWith((states) =>(yesIndex==1)?Color(0xff002E77):Colors.grey ),
                            onChanged:(value){
                              setState(() {
                                _btn2=value.toString();
                                yesIndex=1;
                                noIndex=0;
                              });
                            }),
                        Text('${getTranslated(context, "YES")}',style: TextStyle(color:(kurbaniIndex==1)?Color(0xff002E77):Colors.grey  ),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(value:'${getTranslated(context, "NO")}', groupValue: _btn2,

                            activeColor:(noIndex==1)?Color(0xff002E77):Colors.grey ,
                            fillColor: MaterialStateColor.resolveWith((states) => (noIndex==1)?Color(0xff002E77):Colors.grey ),
                            onChanged:(value){
                              setState(() {
                                _btn2=value.toString();
                                noIndex=1;
                                yesIndex=0;
                              });
                            }),
                        Text('${getTranslated(context, "NO")}',style: TextStyle(color:(noIndex==1)?Color(0xff002E77):Colors.grey ),)
                      ],
                    ),
                  ],
                ),*/
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 'Yes',
                        groupValue: _radioValue,
                        onChanged: (value) {
                          setState(() {
                            _radioValue = value!;
                          });
                        },
                      ),
                      Text('Yes'),
                      Radio(
                        value: 'No',
                        groupValue: _radioValue,
                        onChanged: (value) {
                          setState(() {
                            _radioValue = value!;
                          });
                        },
                      ),
                      Text('No'),
                    ],
                  ),

                  _radioValue == 'Yes' ?   Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${getTranslated(context, "SALE_WEIGHT")}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
                          GestureDetector(
                              child: Container(
                                width: MediaQuery.of(context).size.width/2.3,
                                color: Colors.white,
                                child:  TextFormField(
                                  controller: saleWeightCtr,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border:InputBorder.none,
                                    contentPadding: EdgeInsets.all(10),
                                    // border: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(10)),
                                  ),

                                ),
                              )
                          ),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${getTranslated(context, "SALE_PRICE")}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
                          GestureDetector(
                              child: Container(
                                width: MediaQuery.of(context).size.width/2.3,
                                color: Colors.white,
                                child:  TextFormField(
                                  controller: salePriceCtr,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border:InputBorder.none,
                                    contentPadding: EdgeInsets.all(10),
                                    // border: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(10)),
                                  ),

                                ),
                              )
                          ),

                        ],
                      ),
                    ],
                    ) :SizedBox.shrink()

                   ],
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,color: Colors.grey,),
                SizedBox(height: 40,),
                Btn(title: '${getTranslated(context, "SAVE")}',height: 50,width: MediaQuery.of(context).size.width,
                onPress: (){
                  if(_formKey.currentState!.validate()){
                    addAnimalApi();
                  }else{
                    Fluttertoast.showToast(msg: "All field are required");
                  }

                },)
              ],
            ),
          ) ,
        ),
      ),
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


  String? breedId;
  BreedDataList? animalBreed;
  BreedListModel? breedListModel;
  Future<void> breedListApi() async {
    apiBaseHelper.getAPICall(Uri.parse(ApiService.breedList)).then((getData) {
      bool error = getData ['error'];
      if(!error){
        breedListModel = BreedListModel.fromJson(getData);
        setState(() {

        });
      }else {

      }

    });

  }

  bool isLoading=false;
  List <File> selectedImageList = [];
  File? selectedImage;
  Future<void> addAnimalApi() async {
    setState(() {
      isLoading = true;
    });
    Map<String,String> parameter = {
      'user_id': userId.toString(),
      'tag_id': "GOTN${animalNameCtr.text}",
      'cat_id': catId.toString(),
      'sub_cat': breedId.toString(),
      'gander': gender ?? "",
      'procurement': born  ?? "",
      'birth_date':brithDateCtr.text ,
      'birth_weight':brithWeightCtr.text,
      'mother_id': motherCtr.text,
      'father_id': fatherCtr.text,
      'purchase_date': purchaseDateCtr.text,
      'age': ageCtr.text,
      'weight': weightCtr.text,
      'delivery_date': selectDeliveryDateCtr.text,
      'if_male': breed ?? "",
      'ready_for_sale': _radioValue,
      'sale_weight': saleWeightCtr.text,
      'sale_price': salePriceCtr.text
    };
    apiBaseHelper.postMultipartAPICall(Uri.parse(ApiService.addAnimal), parameter, fileKey: 'image', files: selectedImageList).then((getData) {

      bool error = getData['error'];
      if (error == false) {
        Fluttertoast.showToast(msg: "${getData['message']}");
        Navigator.pop(context);
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimalRecord()));
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())) ;

      }
      setState(() {
        isLoading = false;
      });
    });
  }

}
