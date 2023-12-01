import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import '../../Helper/Appbar.dart';
import '../ApiPath/Api.dart';
import '../Helper/Colors.dart';
import '../Helper/session.dart';
import '../Model/PurchaseRecord/purchase_cat_model.dart';
import '../Model/animal_cat_model_response.dart';
import '../Model/purchase_record_model.dart';
import '../Screens/NewPurchase.dart';

class PurchaseRecord extends StatefulWidget {
  const PurchaseRecord({Key? key}) : super(key: key);

  @override
  State<PurchaseRecord> createState() => _PurchaseRecordState();
}

class _PurchaseRecordState extends State<PurchaseRecord> {
  String dropdownValue = 'MF005';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animalCatApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.grad1Color,
      appBar: customAppBar(
        context: context,
        text:getTranslated(context, "PURCHASE_RECORD"),
        isTrue: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(getTranslated(context, "PURCHASE_CATEGORY")),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                child: Card(

                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<PurchageData>(
                        hint:  Text(getTranslated(context, "SELECT_CATE"),
                          style: TextStyle(
                              color: colors.black54,fontWeight: FontWeight.w500,fontSize:15
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
                        onChanged: (PurchageData? value) {
                          setState(() {
                            animalCat = value!;
                            catId =  animalCat?.id;
                            animalCountApi(animalCat!.id);
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
              SizedBox(
                height: 10,
              ),
              animalCatResponse == null ? Center(child: CircularProgressIndicator()) :  purchaseRecordModel?.data?.isEmpty ?? true? Center(child: Text("Data Not Found !"))
                  :   SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height/1.4,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: purchaseRecordModel!.data!.length,

                      itemBuilder: (context,i){
                        return  Card(
                          child: Container(
                            height: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text('${getTranslated(context, "PARTY_NAME")}'),
                                            Text(":"),
                                            SizedBox(width: 2,),
                                           Text("${purchaseRecordModel!.data?[i].partyName}",style: TextStyle(color: colors.blackTemp,fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('${getTranslated(context, "MATERIAL")}'),
                                            Text(":"),
                                            SizedBox(width: 2,),
                                            Container(
                                              width: 120,
                                                child: Text("${purchaseRecordModel!.data?[i].materialDesc}",style: TextStyle(color: colors.blackTemp,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1,))
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text('${getTranslated(context, "DATE")}'),
                                            Text(":"),
                                            SizedBox(width: 2,),
                                            Text("${purchaseRecordModel!.data?[i].date}",style: TextStyle(color: colors.blackTemp,fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text('${getTranslated(context, "QTY")}'),
                                            Text(":"),
                                            SizedBox(width: 2,),
                                            Text("${purchaseRecordModel!.data?[i].qty}",style: TextStyle(color: colors.blackTemp,fontWeight: FontWeight.bold),)
                                          ],
                                        ),

                                      ],
                                    ),

                                  ],
                                ),
                              )

                          ),
                        );

                  }),
                ),
              )



            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:colors.secondary,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPurchase()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
  String? catId;
  PurchageData? animalCat;
  PurchageCatModel? animalCatResponse;
  Future<void> animalCatApi() async {
    apiBaseHelper.getAPICall(Uri.parse(ApiService.purchaseCategory)).then((getData) {
      bool error = getData ['error'];
      if(!error){
        animalCatResponse = PurchageCatModel.fromJson(getData);
        setState(() {

        });
      }else {

      }

    });

  }


  PurchaseRecordModel? purchaseRecordModel;
  animalCountApi(String? catId) async {
    var parameter = {
      "category":catId,
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.purchaseList), parameter).then((getData) {
      bool error = getData['error'];
      String msg = getData['message'];
      if (error ==  false) {
        setState(() {
          purchaseRecordModel = PurchaseRecordModel.fromJson(getData);
          Fluttertoast.showToast(msg: "${msg}");
        });
      }else {
        purchaseRecordModel = PurchaseRecordModel();
        Fluttertoast.showToast(msg: "${msg}");
        setState(() {});
      }
    });
  }
}