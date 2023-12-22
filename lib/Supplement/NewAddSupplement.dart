import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madhu_farma/Helper/session.dart';


import '../ApiPath/Api.dart';
import '../Helper/AppBtn.dart';
import '../Helper/Appbar.dart';
import '../Model/animal_cat_model_response.dart';
import '../Utils/Colors.dart';
// import '../Helper/toast.dart';

class NewAddSupplement extends StatefulWidget {
  const NewAddSupplement({Key? key}) : super(key: key);

  @override
  State<NewAddSupplement> createState() => _NewAddSupplementState();
}

class _NewAddSupplementState extends State<NewAddSupplement> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

 

  TextEditingController titleC = new TextEditingController();
  TextEditingController stockC = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? unitVNew;
  final List<String> unitType = ['KG', 'Liter', 'No', 'ML', 'G', 'MG'];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Btn(
          onPress: (){
            if(_formKey.currentState!.validate()) {
              addSupplementApi();
            }
            else{
              Fluttertoast.showToast(msg: "Please select all field..");
            }
          },

          height:45,width: MediaQuery.of(context).size.width,
          title: isLoading == true ? getTranslated(context, "PLEASE") :getTranslated(context, "SAVE"),
        ),
      ),
        backgroundColor: colors.grad1Color,
        appBar: customAppBar(
          context: context,
          text: getTranslated(context, "ADD_SUPPLIMENT"),
          isTrue: true,
        ),

        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title"),
                    Card(
                      child: Container(
                        height: 55,
                        child: Center(
                          child: TextFormField(
                            controller: titleC,
                            decoration: InputDecoration(

                                contentPadding: EdgeInsets.only(left: 10,top: 0),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter title';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text("Stock"),
                    Card(
                      child: Container(
                        height: 55,
                        child: Center(
                          child: TextFormField(
                            controller: stockC,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10,top: 0),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter stack';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                   Text(getTranslated(context, "UNIT")),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 3, bottom: 3),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: const Padding(
                              padding: EdgeInsets.only(bottom: 0),
                              child: Text(
                                "",
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
                                color: colors.secondary,
                                size: 30,
                              ),
                            ),
                            // elevation: 16,
                            style: TextStyle(
                                color: colors.secondary,
                                fontWeight: FontWeight.bold),
                            underline: Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0),
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
                                .map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(4.0),
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                                color: colors.textColor,
                                                fontWeight:
                                                FontWeight.normal),
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
                )
              ),
            ),
            ),
       );
    }

  bool isLoading = false;
  Future<void> addSupplementApi() async {
    setState(() {
      isLoading = true;
    });
    var parameter = {
      'title':titleC.text,
      'stock':stockC.text,
      'unit': unitVNew.toString()
    };
    print('_____parameter_____$parameter}_________');
    apiBaseHelper.postAPICall(Uri.parse(ApiService.addSupplement), parameter).then((getData) async {
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
