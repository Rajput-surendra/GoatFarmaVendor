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
                        keyboardType: TextInputType.number,
                        onChanged: (v){
                          getBreedMatingApi(v);
                        },
                        // controller: supplementController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 8,top: 18),
                            suffixIcon:Padding(
                              padding: const EdgeInsets.all(8.0),
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
                  child: matingListModel == null || matingListModel == "" ? Center(child: CircularProgressIndicator()) : matingListModel!.data!.isEmpty ? Center(child: Text("No Available Record"))
                      : ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, i) {
                        return Container(
                          //height: MediaQuery.of(context).size.height / 1.0,
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
                                                  matingListModel!.data![i].age == null ? Text("No Available Age",style: TextStyle(
                                                      color: colors.blackTemp,
                                                      fontWeight:
                                                      FontWeight.bold)):  Text(
                                                    '${matingListModel!.data![i].age}',
                                                    style: TextStyle(
                                                        color: colors.blackTemp,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
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
                                                      '${getTranslated(context, "DAYS")}'
                                                          ": "),
                                                  Text(
                                                    '${matingListModel!.data![i].days} days',
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
                                                      '${getTranslated(context, "STATUS")}'
                                                          ": "),
                                                  Text(
                                                    '${matingListModel!.data![i].meatingStatus}',
                                                    style: TextStyle(
                                                        color: colors.blackTemp,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 2),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [

                                              Row(
                                                children: [
                                                  // Text(
                                                  //     '${getTranslated(context, "REASON")}'
                                                  //         ": "),
                                                  matingListModel!.data![i].breeding == null ? Text("No available",style: TextStyle(
                                                      color: colors.blackTemp,
                                                      fontWeight:
                                                      FontWeight.bold)):    Text(
                                                    '${matingListModel!.data![i].breeding}',
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
                                                      '${getTranslated(context, "WEIGHT")}'
                                                          ": "),
                                                  matingListModel!.data![i].weight == null ? Text("No available weight",style: TextStyle(
                                                      color: colors.blackTemp,
                                                      fontWeight:
                                                      FontWeight.bold)):  Text(
                                                    '${matingListModel!.data![i].weight}',
                                                    style: TextStyle(
                                                        color: colors.blackTemp,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
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
    print('______parameter____${parameter}_________');
    apiBaseHelper.postAPICall(Uri.parse(ApiService.getMatingList), parameter).then((getData) {
      String msg = getData['message'];
      setState(() {
        matingListModel = GetMatingListModel.fromJson(getData);
        Fluttertoast.showToast(msg: "${msg}");

      });

    });
  }
}