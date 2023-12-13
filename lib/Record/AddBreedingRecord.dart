import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../Helper/Appbar.dart';
import '../ApiPath/Api.dart';
import '../Helper/Colors.dart';
import '../Helper/session.dart';
import '../Model/Breeding/get_animal_list_model.dart';
import '../Model/Breeding/get_breeding_model.dart';
import '../Model/MilkRecord/milk_filtter_model.dart';
import '../Screens/AddNewAnimal.dart';


class AddBreedingRecord extends StatefulWidget {
  const AddBreedingRecord({Key? key}) : super(key: key);

  @override
  State<AddBreedingRecord> createState() => _AddBreedingRecordState();
}

class _AddBreedingRecordState extends State<AddBreedingRecord> {
  TextEditingController textController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBreedFilterApi("");
    getAnimalListApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "ADD_BREEDING"),
        isTrue: true,
      ),
      body:getBreedingListModel == null ? Center(child: CircularProgressIndicator()): Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                  '${getTranslated(context, "TAG_ID")}'
                      ": "),
              SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (v){
                      getBreedFilterApi(v);
                    },
                    controller: textController,
                    decoration: InputDecoration(
                        fillColor: Colors.white,

                        hintText: getTranslated(context,"SCAN_TAG_ID"),
                        filled: true,
                        border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 10),// Remove underline
                        suffixIcon: Container(
                          height: 10,
                          width: 10,
                          padding: EdgeInsets.all(10),
                          child: Image.asset("assets/images/Group 72309.png"),
                        ),),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              milkFiltterModel?.data?.breed == null ? Center(child: Text(getTranslated(context, "NO_DATA"))):   Card(
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
                                  "${getTranslated(context,"BREED" )}" ": ",
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
                                  "${getTranslated(context,"AGE")}"": ",),
                                Text(
                                  "${milkFiltterModel!.data!.age}(Month)",
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
                                  "${getTranslated(context,"WEIGHT")}" ": ",

                                ),
                                Text(
                                  "${milkFiltterModel?.data?.weight} KG.",
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
                                  "${getTranslated(context,"MATTING_DATE")}"": "),
                                Text(
                                  "${milkFiltterModel!.data!.matingDate}",
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
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewAnimal(isValue: true,)));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  color: Color(0xFF41B328),
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Text(
                        "Add Animal",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                ),
              ),

              SizedBox(
                height: 10,
              ),
                 ListView.builder(
                   shrinkWrap: true,
                     itemCount: getBreedingListModel!.data!.length,
                     physics: NeverScrollableScrollPhysics(),
                     itemBuilder: (context,i){
                   return  Card(
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
                                       "${getTranslated(context,"TAG_ID" )}" ": ",
                                     ),
                                     getBreedingListModel!.data![i].tagId == null ? Text("No Available", style: TextStyle(
                                         fontSize: 12,
                                         color: colors.textColor,
                                         fontWeight: FontWeight.bold),): Text(
                                       "${getBreedingListModel!.data![i].tagId}",
                                       style: TextStyle(
                                           fontSize: 12,
                                           color: colors.textColor,
                                           fontWeight: FontWeight.bold),
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Text(
                                       "${getTranslated(context,"WEIGHT")}"": ",),
                                     Text(
                                       "${getBreedingListModel!.data![i].weight} KG.",
                                       style: TextStyle(
                                           fontSize: 12,
                                           color: colors.textColor,
                                           fontWeight: FontWeight.bold),
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
                                       "${getTranslated(context,"BIRTH_DATE")}" ": ",

                                     ),
                                     Text(
                                       "${getBreedingListModel?.data?[i].birthDate}",
                                       style: TextStyle(
                                           fontSize: 12,
                                           color: colors.textColor,
                                           fontWeight: FontWeight.bold),
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Text(
                                         "${getTranslated(context,"GENDER")}"": "),
                                     Text(
                                       "${getBreedingListModel!.data![i].gander}",
                                       style: TextStyle(
                                           fontSize: 12,
                                           color: colors.textColor,
                                           fontWeight: FontWeight.bold),
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                   ],
                                 ),
                               ],
                             ),

                           ],
                         ),
                       )

                   );
                 })


              // Text('Gestation Period'),
            ],
          ),
        ),
      ),

      // bottomSheet: InkWell(
      //   onTap: () {
      //     Navigator.pop(context);
      //   },
      //   child: Container(
      //     margin: EdgeInsets.only(bottom: 30, left: 15, right: 10),
      //     padding: EdgeInsets.symmetric(horizontal: 10),
      //     height: 50,
      //     color: Color(0xFF41B328),
      //     width: MediaQuery.of(context).size.width,
      //     child: Center(
      //         child: Text(
      //           "Save",
      //           style: TextStyle(color: Colors.white, fontSize: 20),
      //         )),
      //   ),
      // ),
    );
  }
  GetBreedingModel? milkFiltterModel;
  getBreedFilterApi(String? tagId) async {
    var parameter = {
      'animal_id':tagId
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.getBreedingSingle), parameter).then((getData) {
      String msg = getData['message'];
      setState(() {
        milkFiltterModel = GetBreedingModel.fromJson(getData);
        Fluttertoast.showToast(msg: "${msg}");
      });

    });
  }

  GetBreedingListModel ? getBreedingListModel;
  Future<void> getAnimalListApi() async {
    apiBaseHelper.getAPICall(Uri.parse(ApiService.getBreedingList)).then((getData) {
      bool error = getData ['error'];
      if(!error){
        getBreedingListModel = GetBreedingListModel.fromJson(getData);
        setState(() {

        });
      }else {

      }

    });

  }
}