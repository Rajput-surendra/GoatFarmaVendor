import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



import '../../Helper/Appbar.dart';
import '../../Helper/CustomCard.dart';
import '../../Utils/Colors.dart';
import '../ApiPath/Api.dart';
import '../Helper/session.dart';
import '../Model/MatingAnimalRecord/get_mating_list_model.dart';
import '../Screens/AddNewMating.dart';


class MatingRecord extends StatefulWidget {
  const MatingRecord({Key? key}) : super(key: key);

  @override
  State<MatingRecord> createState() => _MatingRecordState();
}

class _MatingRecordState extends State<MatingRecord> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBreedMatingApi("");
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "MATING_RECORD"),
        isTrue: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewMating()));
          //     breed: 'kkk', age: 'ffgggggf', weight: 'sss')));

          // Action to perform when the button is pressed.
          // For example, navigate to a new screen or show a dialog.
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
                    "Tag ID*",
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
                        onChanged: (v){
                          getBreedMatingApi(v);
                        },
                        // controller: supplementController,
                        decoration: InputDecoration(
                            suffixIcon:Container(
                              padding: EdgeInsets.only(top: 8,left: 5),
                              child: Image.asset("assets/images/Group 72309.png"),
                            ),
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
              InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddWeight(tagid: ,
                  //   breed: '', age: '', weight: '',)));
                },
                child: CustomCard4(
                  name1: 'Tag ID : F001',
                  name2: 'Age : ',
                  name3: 'Days : 6 days',
                  name4: 'Osmanabad',
                  name5: 'Weight : ', name6: 'Status : Mated',
                ),
              ),
              CustomCard4(
                name1: 'Tag ID : F002',
                name2: 'Age :',
                name3: 'Days : 125 days',
                name4: 'Osmanabad',
                name5: 'Weight :', name6: 'Status : Empty',
              ),

              Container(
                height: MediaQuery.of(context).size.height,
                child: RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(
                      Duration(seconds: 2),
                          () {
                            getBreedMatingApi("");
                      },
                    );
                  },
                  child: matingListModel == null || matingListModel == ""
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, i) {
                        return Container(
                          height: MediaQuery.of(context).size.height / 1.0,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: matingListModel!.data!.length,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: (){
                                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>getDeathModel(animalId: breedListModel!.data![i].animalId)));
                                  },
                                  child: Card(
                                    elevation: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                      '${getTranslated(context, "TAG_ID")}'
                                                          ": "),
                                                  Text(
                                                    '${matingListModel!.data![i].femaleId}',
                                                    style: TextStyle(
                                                        color: colors.blackTemp,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                      '${getTranslated(context, "Age")}'
                                                          ": "),
                                                  // Text(
                                                  //   '${matingListModel!.data![i].age}',
                                                  //   style: TextStyle(
                                                  //       color: colors.blackTemp,
                                                  //       fontWeight:
                                                  //       FontWeight.bold),
                                                  // ),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                      '${getTranslated(context, "DEATH")}'
                                                          ": "),
                                                  // Text(
                                                  //   '${matingListModel!.data![i]}',
                                                  //   style: TextStyle(
                                                  //       color: colors.blackTemp,
                                                  //       fontWeight:
                                                  //       FontWeight.bold),
                                                  // ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                      '${getTranslated(context, "GENDER")}'
                                                          ": "),
                                                  // Text(
                                                  //   '${matingListModel!.data![i].gander}',
                                                  //   style: TextStyle(
                                                  //       color: colors.blackTemp,
                                                  //       fontWeight:
                                                  //       FontWeight.bold),
                                                  // ),
                                                ],
                                              )
                                            ],
                                          ),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //   MainAxisAlignment.spaceBetween,
                                          //   children: [
                                          //     Row(
                                          //       children: [
                                          //         Text(
                                          //             '${getTranslated(context, "WEIGHT")}'
                                          //                 ": "),
                                          //         Text(
                                          //           '${matingListModel!.data![i].weight}',
                                          //           style: TextStyle(
                                          //               color: colors.blackTemp,
                                          //               fontWeight:
                                          //               FontWeight.bold),
                                          //         ),
                                          //       ],
                                          //     ),
                                          //     Row(
                                          //       children: [
                                          //         Text(
                                          //             '${getTranslated(context, "REASON")}'
                                          //                 ": "),
                                          //         Text(
                                          //           '${matingListModel!.data![i].reason}',
                                          //           style: TextStyle(
                                          //               color: colors.blackTemp,
                                          //               fontWeight:
                                          //               FontWeight.bold),
                                          //         ),
                                          //       ],
                                          //     )
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );
                      }),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  GetMatingListModel? matingListModel;
  getBreedMatingApi(String? tagId) async {
    var parameter = {
      'animal_id':tagId
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.getMatingList), parameter).then((getData) {
      String msg = getData['message'];
      setState(() {
        matingListModel = GetMatingListModel.fromJson(getData);
        Fluttertoast.showToast(msg: "${msg}");

      });

    });
  }
}