import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../ApiPath/Api.dart';
import '../Helper/AppBtn.dart';
import '../Helper/Appbar.dart';
import '../Helper/session.dart';
import '../Model/animal_cat_model_response.dart';
import '../Utils/Colors.dart';
import 'TextFormCard.dart';

class NewPurchase extends StatefulWidget {
   NewPurchase({Key? key,}) : super(key: key);


  @override
  State<NewPurchase> createState() => _NewPurchaseState();
}

class _NewPurchaseState extends State<NewPurchase> {
   final _formKey =GlobalKey<FormState>();

  TextEditingController invoiceController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController partyNameController=TextEditingController();
  TextEditingController purchaseCatController=TextEditingController();
  TextEditingController materialDesController=TextEditingController();
  TextEditingController qtyController=TextEditingController();
  TextEditingController purchasePartyController=TextEditingController();
  TextEditingController imageController=TextEditingController();
  TextEditingController purchasePriceController=TextEditingController();
  TextEditingController remarkController=TextEditingController();
  TextEditingController mobileController=TextEditingController();

  File? selectedImage;
 List <File> selectedImageList = [];
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
      print("${selectedImage}");
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    animalCatApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(context: context, text:"${getTranslated(context, "NEW_PURCHASE")}", isTrue: true, ),
      backgroundColor: colors.grad1Color,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       TextFormCard(
                         name:"${getTranslated(context, "INVOICE_NO")}" ,
                         width: MediaQuery.of(context).size.width/2.3,
                         controller: invoiceController,
                         validString: getTranslated(context, "INVOICE_NO"),
                       ),

                       TextFormCard(
                         onTap: (){
                           _selectDate();
                         },
                         readOnly: true,
                         name:"${getTranslated(context, "DATE")}" ,
                         width: MediaQuery.of(context).size.width/2.3,
                         controller: dateController,
                         validString:getTranslated(context, "DATE"),
                       ),
                     ],
                   ),
                   SizedBox(height: 10,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       TextFormCard(
                         name:"${getTranslated(context, "PARTY_NAME")}" ,
                         width: MediaQuery.of(context).size.width/2.3,
                         controller: partyNameController,
                         validString:getTranslated(context, "PARTY_NAME"),

                       ),
                       TextFormCard(
                         name:"${getTranslated(context, "MOBILE_NO.")}" ,
                         width: MediaQuery.of(context).size.width/2.3,
                         controller: mobileController,
                         validString:getTranslated(context, "MOBILE_NO."),
                       ),
                     ],
                   ),
                   SizedBox(height: 10,),
                   Row(
                     //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       // TextFormCard(
                       //   name:getTranslated(context, "PURCHASE_CATEGORY") ,
                       //   width: MediaQuery.of(context).size.width/2.3,
                       //   controller: purchaseCatController,
                       //   validString: getTranslated(context, "PURCHASE_CATEGORY"),
                       // ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(getTranslated(context, "PURCHASE_CATEGORY"),style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 13),),
                            SizedBox(height: 5,),
                            Container(
                              width: 200,
                              height: 60,
                              child: Card(
                                // shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(5)
                                // ),
                                //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2<AnimalCatList>(
                                      hint:  Text(getTranslated(context, "SELECT_CATE"),
                                        style: TextStyle(
                                            color: colors.black54,fontWeight: FontWeight.w500,fontSize:12
                                        ),),
                                      value: animalCat,
                                      icon:  Icon(Icons.keyboard_arrow_down_rounded,  color:colors.secondary,size: 30,),
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
                      ),
                       Expanded(
                         child: TextFormCard(
                           name:getTranslated(context, "MATERIAL_DESCRIPTION") ,
                           width: MediaQuery.of(context).size.width/2.3,
                           controller: materialDesController,
                           validString: getTranslated(context, "MATERIAL_DESCRIPTION"),
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 10,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       TextFormCard(
                         textInputType: TextInputType.number,
                         name:getTranslated(context, "QTY") ,
                         width: MediaQuery.of(context).size.width/2.3,
                         controller: qtyController,
                         validString:getTranslated(context, "QTY"),
                       ),
                       TextFormCard(
                         textInputType: TextInputType.number,
                         name:getTranslated(context, "PURCHASE_PRICE") ,
                         width: MediaQuery.of(context).size.width/2.3,
                         controller: purchasePriceController,
                         validString: getTranslated(context, "PURCHASE_PRICE"),
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
                           getTranslated(context, "IMAGE"),
                           style: TextStyle(
                               color: Colors.black.withOpacity(0.5),
                               fontSize: 13
                           ),
                         ),
                       ),
                       SizedBox(height: 5,),
                       Card(
                         elevation: 1,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(5),
                         ),
                         child: GestureDetector(
                           onTap: (){
                             _showImageSourceDialog(context);
                           },
                           child: Container(
                               width: MediaQuery.of(context).size.width,
                               height: 46,

                               color: Colors.white,
                               alignment: Alignment.center,
                               child:(selectedImage!=null)?Text('$selectedImage',overflow: TextOverflow.ellipsis,):Text("+")
                           ),
                         ),
                       )
                     ],
                   ),
                   SizedBox(height: 10,),
                   TextFormCard(
                     name:getTranslated(context, "REMARK") ,
                     width: MediaQuery.of(context).size.width,
                     controller: remarkController,
                     validString: getTranslated(context, "PURCHASE_PRICE"),
                   ),
                   SizedBox(height: 60,),

                   Btn(
                     title:getTranslated(context, "SAVE"),
                     height: MediaQuery.of(context).size.width/8,
                     width:MediaQuery.of(context).size.width/1.2 ,
                     onPress:(){
                       if(_formKey.currentState!.validate()){
                         addPurchaseApi();
                         // if(selectedImage!.path.isNotEmpty){
                         //
                         //   Fluttertoast.showToast(msg: "Image is required");
                         // }else{
                         //
                         // }
                       }

                     },
                   ),


                 ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
   bool isLoading=false;
   String _dateValue = '';
   var dateFormate;
   String convertDateTimeDisplay(String date)  {
     final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
     final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
     final DateTime displayDate = displayFormater.parse(date);
     final String formatted = serverFormater.format(displayDate);
     return formatted;
   }
   Future _selectDate() async {
     DateTime? picked = await showDatePicker(
         context: context,
         initialDate:  DateTime.now(),
         firstDate: DateTime.now(),
         lastDate: DateTime(2025),
         builder: (BuildContext context, Widget? child) {
           return Theme(
             data: ThemeData.light().copyWith(
                 primaryColor: colors.primary,
                 accentColor: Colors.black,
                 colorScheme:  ColorScheme.light(primary:  colors.primary),
                 buttonTheme:
                 ButtonThemeData(textTheme: ButtonTextTheme.accent)),
             child: child!,
           );
         });
     if (picked != null)
       setState(() {
         String yourDate = picked.toString();
         _dateValue = convertDateTimeDisplay(yourDate);
         print(_dateValue);
         dateFormate = DateFormat("yyyy/MM/dd").format(DateTime.parse(_dateValue ?? ""));
         dateController = TextEditingController(text: _dateValue);


       });
   }
   Future<void> addPurchaseApi() async {
     setState(() {
       isLoading = true;
     });
     Map<String,String> parameter = {
       'invoice_no': invoiceController.text,
       'date': dateController.text,
       'party_name': partyNameController.text,
       'mobile': mobileController.text,
       'purchase_category': catId.toString(),
       'material_desc':materialDesController.text,
       'qty': qtyController.text,
       'price': purchasePriceController.text,
       'remark': remarkController.text
     };
     apiBaseHelper.postMultipartAPICall(Uri.parse(ApiService.addPurchase), parameter, fileKey: 'image', files: selectedImageList).then((getData) {
       bool error = getData['error'];
       if (error == false) {
         Fluttertoast.showToast(msg: "${getData['message']}");
         Navigator.pop(context);
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())) ;

       }
       setState(() {
         isLoading = false;
       });
     });
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
}
