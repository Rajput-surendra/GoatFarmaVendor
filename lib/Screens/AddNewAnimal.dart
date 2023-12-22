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
import '../Model/Animal/get_animal_list_model.dart';
import '../Model/animal_cat_model_response.dart';
import '../Model/breed_list_model.dart';
import '../Record/AnimalRecord.dart';
import '../Scanner/scanner_view.dart';
import '../Utils/Colors.dart';
import '../helper/appbar.dart';

class AddNewAnimal extends StatefulWidget {

  AddNewAnimal({Key? key,this.isValue}) : super(key: key);

  final  bool? isValue ;

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
  String?kidsGender;
  String?status;
  String?statusFemale;
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



   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animalCatApi();
    getDataProfile();
    getRandomNumber();

  }

   getRandomNumber(){
     Random random = Random();
     randomNumber = random.nextInt(10000) - 1;
   // animalNameCtr.text = randomNumber.toString() ;
  }
  int? randomNumber ;

  String? userId ;
  getDataProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId  =  prefs.getString('userId');

    setState(() {

    });

  }


  Future<bool> showExitPopup() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Center(child: Text('Select Image')),
          content: Row(
            // crossAxisAlignment: CrossAxisAlignment.s,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  getImage(ImageSource.camera, context, 1);
                },
                child: Container(
                  height: 40,width: 80,
                  decoration: BoxDecoration(
                      color: colors.secondary,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(child: Text("Camera")),
                ),
              ),

              SizedBox(
                width: 15,
              ),

              InkWell(
                onTap: (){
                  getImageCmera(ImageSource.gallery,context,1);
                },
                child: Container(
                  height: 40,width: 80,
                  decoration: BoxDecoration(
                      color: colors.secondary,
                      borderRadius: BorderRadius.circular(5)
                  ),

                  child: Center(child: Text("Gallery")),
                ),
              )
              // ElevatedButton(
              //   onPressed: () {
              //
              //   },
              //   child: Text('Gallery'),
              // ),
            ],
          )),
    ) ; //if showDialouge had returned null, then return false
  }

  bool isEditProfile = false ;
  File? imageFile;
  Future getImage(ImageSource source, BuildContext context, int i) async {
    var image = await ImagePicker().pickImage(
        source: source,
        imageQuality: 50
    );
    setState(() {
      imageFile = File(image!.path);
    });

    Navigator.pop(context);
  }
  Future getImageCmera(ImageSource source, BuildContext context, int i) async {
    var image = await ImagePicker().pickImage(
        source: source,
        imageQuality: 50
    );
    setState(() {
      imageFile = File(image!.path);
    });
    Navigator.pop(context);
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
                                        color: colors.black54,fontSize:12
                                    ),),
                                  value: animalCat,
                                  icon:  Icon(Icons.keyboard_arrow_down_rounded,  color:colors.secondary,size: 25,),
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
                                      breedListApi(catId!);
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
                                child: DropdownButton2<BreedCatList>(
                                  hint:  Text(getTranslated(context, "BREED"),
                                    style: TextStyle(
                                        color: colors.black54,fontSize:12
                                    ),),
                                  value: animalBreed,
                                  icon:  Icon(Icons.keyboard_arrow_down_rounded,  color:colors.secondary,size: 25,),
                                  style:  const TextStyle(color: colors.secondary,fontWeight: FontWeight.bold),
                                  underline: Padding(
                                    padding: const EdgeInsets.only(left: 0,right: 0),
                                    child: Container(
                                      // height: 2,
                                      color:  colors.whiteTemp,
                                    ),
                                  ),
                                  onChanged: (BreedCatList? value) {
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
                  ],
                ),
                SizedBox(height: 15,),
                Custom_Text(text: '${getTranslated(context, "TAG_ID")}'),

                SizedBox(
                  width: MediaQuery.of(context).size.width/1.1,
                  child: Card(
                    child: Container(
                      height: 50,
                      child: Center(
                        child: TextFormField(
                          controller:  animalNameCtr,
                          decoration: InputDecoration(
                              hintText: "${getTranslated(context, "TAG_ID")}",
                              suffixIcon: Container(
                                padding: EdgeInsets.all(10),
                                child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ScanPay())).then((value){
                                        if(value != null){
                                          animalNameCtr.text=  value;
                                        }
                                      });;
                                    },
                                    child: Image.asset("assets/images/Group 72309.png")),
                              ),
                              contentPadding: EdgeInsets.only(left: 10,top: 15),
                              border: InputBorder.none),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please Enter 2nd onwards';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ),
                  ),
                ),
                // Row(
                //   children: [
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //
                //         SizedBox(height: 8,),
                //         GestureDetector(
                //             child: Container(
                //               width: MediaQuery.of(context).size.width/1.15,
                //               color: Colors.white,
                //               child:  TextFormField(
                //
                //                 controller: animalNameCtr,
                //                 decoration: InputDecoration(
                //                   //prefix: Text(,style: TextStyle(color: colors.blackTemp),),
                //                   border:InputBorder.none,
                //                   contentPadding: EdgeInsets.all(10),
                //                   // border: OutlineInputBorder(
                //                   //     borderRadius: BorderRadius.circular(10)),
                //                 ),
                //                 validator: (value){
                //                   if(value==null||value.isEmpty)
                //                     return "Please enter tagId";
                //                   return null;
                //                 },
                //               ),
                //             )
                //         ),
                //       ],
                //     ),
                //     SizedBox(width: 5,height: 20,),
                //
                //   ],
                // ),
                SizedBox(height: 15,),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${getTranslated(context, "PROCUREMENT")}',style: TextStyle(color: colors.black54),),
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
                          value: born,
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
                              born = value!;

                            });
                          },
                          items: ['Born at Farm','Purchase']
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

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom_Text(text: '${getTranslated(context, "PHOTO")}'),
                    SizedBox(height: 8,),
                    InkWell(
                      onTap: (){
                        showExitPopup();
                      },
                      child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width/1.1,
                        // height: ,
                        color: colors.primary,
                        child:  GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [

                              if(imageFile==null)
                                Center(child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('${getTranslated(context, "IMAGE")}',style: TextStyle(color: colors.whiteTemp),),
                                ))
                              else if(imageFile != null)
                                Container(
                                  height: 80,
                                 width: MediaQuery.of(context).size.width/1.2,
                                  child: ClipRRect(
                                      clipBehavior: Clip.antiAlias,
                                      borderRadius: BorderRadius.circular(1),
                                      child: Image.file(imageFile ?? File(''),fit: BoxFit.fill)
                                  ),
                                ),

                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 15,),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,color: Colors.grey,),
                SizedBox(height: 15
                  ,),
                Text('${getTranslated(context, "READY_FOR_SALE")}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
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

  Widget getViewBasedOnSelectedValue() {
    switch (born) {
      case 'Born at Farm':
        return artificialView();
      case 'Purchase':
        return naturalView();
      default:
        return Container();
    }
  }
  artificialView(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custom_Text(text: '${getTranslated(context, "GENDER")}'),
                SizedBox(height: 5,),
                Container(
                  // height: 50,
                  decoration: BoxDecoration(
                      color: colors.whiteTemp
                  ),
                  width: MediaQuery.of(context).size.width/2.3,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      //dropdownMaxHeight: 300,
                      hint: Text("Select",
                        style: TextStyle(
                            color: colors.black54,fontWeight: FontWeight.normal,fontSize: 14
                        ),),
                      // dropdownColor: colors.primary,
                      value: kidsGender,
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
                          kidsGender = value!;
                        });
                      },
                      items: ['Male','Female']
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
              ],
            ),
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom_Text(text: '${getTranslated(context, "STATUS")}'),
              SizedBox(height: 5,),
              Container(
                  height: 48,
                  width: MediaQuery.of(context).size.width/2.3,
                  color: Colors.white,
                  child:  Padding(
                    padding: const EdgeInsets.only(top: 18,left: 5),
                    child: Text("Kids"),
                  )
              ),
              SizedBox(height: 10,),

            ],
          )

          ],
        ),

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
                              getDateApi(selectedBirthDate!);
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
            SizedBox(height: 10,)


          ],
        ),
        SizedBox(height: 15,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Custom_Text(text: '${getTranslated(context, "AGE")}'),
            SizedBox(height: 8,),
            GestureDetector(
                child: Container(
                  width:double.infinity,
                  color: Colors.white,
                  child:  TextFormField(
                    readOnly: true,
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
        SizedBox(height: 10,),
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

      ],
    );
  }
  naturalView(){
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Row(
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('${getTranslated(context, "GENDER")}',style: TextStyle(color: colors.black54),),
                 SizedBox(height: 5,),
                 Container(
                   // height: 50,
                   decoration: BoxDecoration(
                       color: colors.whiteTemp
                   ),
                   width: MediaQuery.of(context).size.width/2.3,
                   child: DropdownButtonHideUnderline(
                     child: DropdownButton2<String>(
                       //dropdownMaxHeight: 300,
                       hint: Text("Select",
                         style: TextStyle(
                             color: colors.black54,fontWeight: FontWeight.normal,fontSize: 14
                         ),),
                       // dropdownColor: colors.primary,
                       value: gender,
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
                           gender = value!;
                         });
                       },
                       items: ['Male','Female']
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
             SizedBox(width: 5,),
             selectMale(),
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

          ],
        ),
        SizedBox(height: 10,),
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
                          getDateApi(selectedBirthDate!);
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
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Custom_Text(text: '${getTranslated(context, "AGE")}'),
            SizedBox(height: 8,),
            GestureDetector(
                child: Container(
                  width:double.infinity,
                  color: Colors.white,
                  child:  TextFormField(
                    readOnly: true,
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
        SizedBox(height: 10,),

      ],
    );

  }


  Widget selectMale() {
    switch (gender) {
      case 'Male':
        return maleView();
      case 'Female':
        return feMaleView();
      default:
        return Container();
    }
  }
  maleView(){
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${getTranslated(context, "STATUS")}',style: TextStyle(color: colors.black54),),
                SizedBox(height: 5,),
                Container(
                  // height: 50,
                  decoration: BoxDecoration(
                      color: colors.whiteTemp
                  ),
                  width: MediaQuery.of(context).size.width/2.3,
                  ///width: MediaQuery.of(context).size.width/2.3,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      //dropdownMaxHeight: 300,
                      hint: Text("Select Status",
                        style: TextStyle(
                            color: colors.black54,fontWeight: FontWeight.normal,fontSize: 14
                        ),),
                      // dropdownColor: colors.primary,
                      value: status,
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
                          status = value!;
                        });
                      },
                      items: ['Kids','Grower','Breeder']
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
          ],
        ),
      ],
    );
  }
  feMaleView(){
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${getTranslated(context, "STATUS")}',style: TextStyle(color: colors.black54),),
            SizedBox(height: 5,),
            Container(
              // height: 50,
              decoration: BoxDecoration(
                  color: colors.whiteTemp
              ),
              width: MediaQuery.of(context).size.width/2.3,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  //dropdownMaxHeight: 300,
                  hint: Text("Select",
                    style: TextStyle(
                        color: colors.black54,fontWeight: FontWeight.normal,fontSize: 14
                    ),),
                  // dropdownColor: colors.primary,
                  value: statusFemale,
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
                      statusFemale = value!;
                    });
                  },
                  items: ['Kids','Grower','Empty','Matted','Pregnant','Motherhood']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: const TextStyle(color: colors.black54,fontWeight: FontWeight.normal),),
                    );

                  }).toList(),

                ),

              ),
            ),



          ],
        ),
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


  String? breedId;
  BreedCatList? animalBreed;
  GetSubListBreedModel? breedListModel;

  Future<void> breedListApi(String animalId) async {

    var parameter = {
      'parent_id': animalId.toString(),

    };
    print('__________${parameter}_________');
    apiBaseHelper.postAPICall(Uri.parse(ApiService.animalCatList), parameter).then((getData) async {
      bool error = getData ['error'];
      if(!error){
        breedListModel = GetSubListBreedModel.fromJson(getData);
        setState(() {

        });
      }else {

      }
    });
  }


  String ? date;
  Future<void> getDateApi(String animalId) async {

    var parameter = {
      'dob': animalId.toString(),

    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.getDateList), parameter).then((getData) async {
     date  = getData ['data'];
     ageCtr.text = date!;
     print('_____ageCtr.text_____${ageCtr.text}_________');
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
      'tag_id': "${animalNameCtr.text}",
      'cat_id': catId.toString(),
      'sub_cat': breedId.toString(),
      'gander': gender == null ? kidsGender.toString() : gender.toString(),
      'procurement': born  ?? "",
      'birth_date':brithDateCtr.text ,
      'birth_weight':"",
      'mother_id': motherCtr.text,
      'father_id': fatherCtr.text,
      'purchase_date': purchaseDateCtr.text,
      'age': ageCtr.text,
      'weight':brithWeightCtr.text.isEmpty ?  weightCtr.text :brithWeightCtr.text,
      'delivery_date': selectDeliveryDateCtr.text,
      'if_male': breed ?? "",
      'ready_for_sale': _radioValue,
      'sale_weight': saleWeightCtr.text,
      'sale_price': salePriceCtr.text,
      'add_type':widget.isValue == true ? 'breed': " ",
      'status': status == null? "kids": status.toString(),

    };
    print('______parameter____${parameter}_________');
    apiBaseHelper.postMultipartAPICall(Uri.parse(ApiService.addAnimal), parameter, fileKey: 'image', files: selectedImageList).then((getData) {

      bool error = getData['error'];

      if (error == false) {
        Fluttertoast.showToast(msg: "${getData['message']}");
           if(widget.isValue == true){
             Navigator.pop(context, true);
           }else{
             Navigator.pop(context);
           }
      }else{
        Fluttertoast.showToast(msg: "${getData['message']}");
      }
      setState(() {
        isLoading = false;
      });
    });
  }

}
