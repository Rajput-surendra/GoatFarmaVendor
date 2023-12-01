import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';


import '../../Helper/Appbar.dart';
import '../../Utils/Colors.dart';
import '../ApiPath/Api.dart';
import '../Model/Death/death_list_model.dart';
import 'AddDeathRecord.dart';

class DeathRecord extends StatefulWidget {
  const DeathRecord({Key? key}) : super(key: key);

  @override
  State<DeathRecord> createState() => _DeathRecordState();
}

class _DeathRecordState extends State<DeathRecord> {
  String dropdownValue = 'Filter';
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDeathListApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: customAppBar(isTrue:true,text: getTranslated(context, "DEATH_RECORD"),onTaped: (){},context: context,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(getTranslated(context, "YEAR")),
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
                  width: MediaQuery.of(context).size.width / 2,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    value: dropdownValue,
                    hint: Text(getTranslated(context, "FILTER")),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Filter', 'Cow']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(
                      Duration(seconds: 2),
                          () {
                            getDeathListApi();
                      },
                    );
                  },
                  child: getDeathModel == null || getDeathModel == ""
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, i) {
                        return Container(
                          height: MediaQuery.of(context).size.height / 1.0,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: getDeathModel!.data!.length,
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
                                                    '${getDeathModel!.data![i].animalId}',
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
                                                  Text(
                                                    '${getDeathModel!.data![i].age}',
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
                                                      '${getTranslated(context, "DEATH")}'
                                                          ": "),
                                                  Text(
                                                    '${getDeathModel!.data![i].createdAt!.substring(0, 11)}',
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
                                                      '${getTranslated(context, "GENDER")}'
                                                          ": "),
                                                  Text(
                                                    '${getDeathModel!.data![i].gander}',
                                                    style: TextStyle(
                                                        color: colors.blackTemp,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                      '${getTranslated(context, "WEIGHT")}'
                                                          ": "),
                                                  Text(
                                                    '${getDeathModel!.data![i].weight}',
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
                                                      '${getTranslated(context, "REASON")}'
                                                          ": "),
                                                  Text(
                                                    '${getDeathModel!.data![i].reason}',
                                                    style: TextStyle(
                                                        color: colors.blackTemp,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ],
                                              )
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.secondary,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDeathRecord(breed: "Goat", age: "10", weight: "50")));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
  GetDeathModel? getDeathModel;
  Future<void> getDeathListApi() async {
    apiBaseHelper.getAPICall(Uri.parse(ApiService.getDeathList)).then((getData) {
      bool error = getData['error'];
      if (!error) {
        getDeathModel = GetDeathModel.fromJson(getData);
        setState(() {});
      }
    });
  }

}
