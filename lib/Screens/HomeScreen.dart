import 'package:flutter/material.dart';
import 'package:madhu_farma/Auth/LoginScreen.dart';
import 'package:madhu_farma/Medicine/MedicineRecord.dart';
import 'package:madhu_farma/Model/user_module_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ApiPath/Api.dart';
import '../Helper/CustomCard.dart';
import '../Helper/CustomDialogPopup.dart';
import '../Helper/session.dart';
import '../Medicine/MedicineDueRecord.dart';
import '../Medicine/MedicineSchedule.dart';
import '../Record/AnimalRecord.dart';
import '../Record/BreedingRecord.dart';
import '../Record/DeathRecord.dart';
import '../Record/MatingRecord.dart';
import '../Record/MilkRecord.dart';
import '../Record/PurchaseRecordScreen.dart';
import '../Record/ReportScreen.dart';
import '../Record/SalaryRecordScreen.dart';
import '../Record/WeightRecord.dart';
import '../Supplement/SupplementDueRecord.dart';
import '../Utils/Colors.dart';
import '../main.dart';
import 'BreedScreen.dart';
import 'DownloadReport.dart';
import 'PunchIn.dart';
import 'SaleScreen.dart';
import 'StatusScreen.dart';
import '../Supplement/SupplementRecord.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

void _showCustomDialog(BuildContext context, String text1,String text2,String text3,VoidCallback fun1,VoidCallback fun2,VoidCallback fun3) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialog(
        content: Align(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap:fun1,
                child: Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  padding: EdgeInsets.all(10.0),
                  color: Colors.white,
                  child: Text(
                    '${text1}',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
              InkWell(
                onTap:fun2,
                child: Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  padding: EdgeInsets.all(10.0),
                  color: Colors.white,
                  child: Text(
                    '${text2}',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
              InkWell(
                onTap:fun3,
                child: Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  padding: EdgeInsets.all(10.0),
                  color: Colors.white,
                  child: Text(
                    '${text3}',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    new Future.delayed(Duration.zero, () {
      languageList = [
        getTranslated(context, 'ENGLISH_LAN'),
        getTranslated(context, 'HINDI_LAN'),
        getTranslated(context, 'MARATAHI'),
      ];
    });
    super.initState();
   // getProfile();
    getDataProfile();

  }
  String? userId ;
  String? uName  ;
  String? uMobile  ;
  String? uImage  ;
  String? purchase;
List<String> moduleList = [];
  getDataProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     userId  =  prefs.getString('userId');
     uName  =  prefs.getString('username');
     uMobile  =  prefs.getString('mobile');
     uImage  =  prefs.getString('image');
     setState(() {

     });

    userPermission();
  }

  List <UserModuleData> userModuleDataList = [] ;
  userPermission() async {
    var parameter = {
      "user_id":userId.toString(),
    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.userPermission), parameter).then((getData) async {
      bool error = getData['error'];
      //purchase =  getData['data'][0]['module'];

      if (error ==  false) {

        userModuleDataList = (getData['data'] as List).map((e) => UserModuleData.fromJson(e)).toList() ;
        setState(() {
          for(int i=0; i<userModuleDataList.length; i++){
            moduleList.add(userModuleDataList[i].module ?? '') ;
          }
        });

      }

    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return


      uImage == null ? Center(child: CircularProgressIndicator()):Scaffold(
      backgroundColor: colors.grad1Color,
      body: SingleChildScrollView(
        child: SizedBox(
          child: Stack(
            children: [
              Container(
                height: size.height / 2,
                width: size.width / 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  color: colors.primary,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 6,
                      child: Container(
                        height: size.height / 1.3,
                        width: size.width / 1.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "$uName",
                                    style: TextStyle(
                                        color: colors.blackTemp,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5),
                                  ),
                                  // Container(
                                  //     width: 16,
                                  //     height: 16,
                                  //     child: Image(image: AssetImage("assets/images/Edit icon.png"))),
                                ],
                              ),
                              Text(
                                "${getTranslated(context, "MOBILE_NO")}: $uMobile",
                                style: TextStyle(
                                    fontSize: 11, color: colors.blackTemp,fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: size.height / 1.6,
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      moduleList.contains('Purchase') ? InkWell(onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PurchaseRecord()));
                                      },
                                        child: CustomCard(
                                          title: getTranslated(context, "PURCHASE"),
                                        ),
                                      ) : SizedBox.shrink(),
                                      moduleList.contains('Status') ? InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>StatusScreen()));
                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "STATUS"),
                                        ),
                                      ):SizedBox.shrink(),
                                      moduleList.contains('Breead') ?  InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BreedScreen()));
                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "BREED"),
                                        ),
                                      ):SizedBox.shrink(),
                                      moduleList.contains('Animals') ?    InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AnimalRecord()));
                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "ANIMALS"),
                                        ),
                                      ):SizedBox.shrink(),
                                      moduleList.contains('Weight') ?  InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      WeightRecord()));
                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "WEIGHT"),
                                        ),
                                      ):SizedBox.shrink(),

                                      moduleList.contains('Supplement') ?   InkWell(onTap: (){
                                        _showBottomSheet(context);
                                      },
                                        child: CustomCard(
                                          title: getTranslated(context, "SUPPLEMENT"),
                                          icon: Icons.arrow_forward_ios_rounded,
                                        ),
                                      ):SizedBox.shrink(),

                                      moduleList.contains('Medicine') ?  InkWell(
                                        onTap: () {
                                          _showBottomSheet2(context);
                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "MEDICINE"),
                                          icon: Icons.arrow_forward_ios_rounded,
                                        ),
                                      ):SizedBox.shrink(),
                                    moduleList.contains('Mattings') ? InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MatingRecord()));
                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "MATINGS"),
                                        ),
                                      ):SizedBox.shrink(),
                                      moduleList.contains('Breeding') ?  InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BreedingRecords()));
                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "BREEDING"),
                                        ),
                                      ):SizedBox.shrink(),
                                      moduleList.contains('Milk') ?  InkWell(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MilkRecord()));
                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "MILK"),
                                        ),
                                      ):SizedBox.shrink(),
                                      moduleList.contains('Death') ? InkWell(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DeathRecord()));
                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "DEATH"),
                                        ),
                                      ):SizedBox.shrink(),
                                    moduleList.contains('Sales') ? GestureDetector(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Sale()));
                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "SALE"),
                                        ),
                                      ):SizedBox.shrink(),
                                      moduleList.contains('Report') ?   InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Report()));
                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "REPORT"),
                                        ),
                                      ):SizedBox.shrink(),
                                      InkWell(
                                        onTap: () {
                                          _showBottomSheet3(context);
                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "EMPLOYEE"),
                                          icon: Icons.arrow_forward_ios_rounded,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Future.delayed(Duration(seconds: 0),(){
                                            return openChangeLanguageBottomSheet();
                                          });
                                          // _showCustomDialog(context, "Hindi",
                                          //     "Marathi",
                                          //     "English",
                                          //         () {
                                          //       // Navigator.push(context, MaterialPageRoute(builder: (context)=>PunchInScreen()));
                                          //     },
                                          //         () {
                                          //       // Navigator.push(context, MaterialPageRoute(builder: (context)=>MedicineScheduleRecord()));
                                          //     },
                                          //         () {
                                          //       // Navigator.push(context, MaterialPageRoute(builder: (context)=>SalaryRecord()));
                                          //     });
                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "LANGUAGE"),
                                          icon: Icons.arrow_forward_ios_rounded,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             MedicineRecord()));
                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "SETTING"),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DownloadReport()));
                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "NOTIFICATION"),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              String contentText = "LogOut";
                                              return StatefulBuilder(
                                                builder: (context, setState) {
                                                  return AlertDialog(
                                                    title: Text("Are you sure you want  to ? LogOut"),
                                                    content: Text(contentText),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () => Navigator.pop(context),
                                                        child: Text("Cancel"),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          setState(() async {
                                                            SharedPreferences prefs = await SharedPreferences.getInstance();
                                                            prefs.clear();
                                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

                                                          });
                                                        },
                                                        child: Text("Logout"),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "LOG_OUT"),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              uImage == null ?Center(child: CircularProgressIndicator()):Positioned(
                // width: size.width/4.2,
                // height: size.height/10.2,
                top: 100,
                right: 0,
                left: 0,
                // top: 0,
                child: CircleAvatar(

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                      child: Image.network("$uImage")),
                  radius: 50,
                  backgroundColor: colors.black54,
                ),
              ),
              // Positioned(
              //   width: size.width / 5.2,
              //   height: size.height / 13,
              //   top: 67,
              //   child: InkWell(
              //       onTap: () {
              //         Navigator.pop(context);
              //       },
              //       child: Icon(
              //         Icons.arrow_back_ios_new,
              //         size: 22,
              //       )),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> langCode = ["en", "hi","mr"];
  final List<String> getLang = ['English', 'Hindi', 'Marathi'];
  List<String?> languageList = [];
  String? langData ;
  int? selectLan;

  final GlobalKey<FormState> _changePwdKey = GlobalKey<FormState>();

  void openChangeLanguageBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0))),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Form(
                  key: _changePwdKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      bottomSheetHandle(),
                      bottomsheetLabel("CHOOSE_LANGUAGE_LBL"),
                      StatefulBuilder(
                        builder:
                            (BuildContext context, StateSetter setModalState) {
                          return SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: getLngList(context, setModalState)),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }


  Widget getHeading(String title) {
    print("here is title value ${title}");
    return Text(
      getTranslated(context, title).toString(),
      style: Theme.of(context).textTheme.headline6!.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black),
    );
  }


  Widget bottomSheetHandle() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.black),
        height: 5,
        width: MediaQuery.of(context).size.width * 0.3,
      ),
    );
  }

  Widget bottomsheetLabel(String labelName) => Padding(
    padding: const EdgeInsets.only(top: 30.0, bottom: 20),
    child: getHeading(labelName),
  );

  List<Widget> getLngList(BuildContext ctx, StateSetter setModalState) {
    return languageList
        .asMap()
        .map(
          (index, element) => MapEntry(
          index,
          InkWell(
            onTap: () {
              if (mounted)
                setState(() {
                  selectLan = index;
                  _changeLan(langCode[index], ctx);
                });
              setModalState((){});
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 25.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectLan == index
                                ? Colors.grey
                                : Colors.white,
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: selectLan == index
                              ? Icon(
                            Icons.check,
                            size: 17.0,
                            color: Colors.black,
                          )
                              : Icon(
                              Icons.check_box_outline_blank,
                              size: 15.0,
                              color:Colors.white
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: 15.0,
                          ),
                          child: Text(
                            languageList[index].toString(),
                            style: Theme.of(this.context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                color: Colors.black),
                          ))
                    ],
                  ),

                  // index == languageList.length - 1
                  //     ? Container(
                  //         margin: EdgeInsetsDirectional.only(
                  //           bottom: 10,
                  //         ),
                  //       )
                  //     : Divider(
                  //         color: Theme.of(context).colorScheme.lightBlack,
                  //       ),
                ],
              ),
            ),
          )),
    )
        .values
        .toList();
  }


  void _changeLan(String language, BuildContext ctx) async {
    Locale _locale = await setLocale(language);
    MyApp.setLocale(ctx, _locale);
  }

  void _showBottomSheet(BuildContext context,) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              ListTile(

                title: Padding(padding: EdgeInsets.only(right: 40,left: 0),
                  child: Text(getTranslated(context, "SUPPLEMENT_RECORD"),style: TextStyle(color: Colors.black ,fontWeight: FontWeight.w500)),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SupplementRecord()));

                },
              ),
              ListTile(

                title: Text(getTranslated(context, "SUPPLEMENT_DUE_RECORD"),style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SupplementDueRecord()));

                },
              ),
            ],
          ),
        );

      },
    );
  }

  void _showBottomSheet2(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 20),

              ListTile(

                title: Padding(padding: EdgeInsets.only(right: 40,left: 0),
                  child: Text(getTranslated(context, "MEDICINE_RECORD"),style: TextStyle(color: Colors.black ,fontWeight: FontWeight.w500)),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MedicineRecord()));

                },
              ),
              ListTile(

                title: Padding(padding: EdgeInsets.only(right: 40,left: 0),
                  child: Text(getTranslated(context, "MEDICINE_SCHEDULE"),style: TextStyle(color: Colors.black ,fontWeight: FontWeight.w500)),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MedicineScheduleRecord()));

                },
              ),
              ListTile(

                title: Text(getTranslated(context, "MEDICINE_DUE_RECORD"),style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MedicineDueRecord()));

                },
              ),
            ],
          ),
        );

      },
    );
  }

  void _showBottomSheet3(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [



              ListTile(

                title: Padding(padding: EdgeInsets.only(right: 40,left: 0),
                  child: Text(getTranslated(context, "PUNCH_IN_/_OUT"),style: TextStyle(color: Colors.black ,fontWeight: FontWeight.w500)),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PunchInScreen()));

                },
              ),
              ListTile(

                title: Padding(padding: EdgeInsets.only(right: 40,left: 0),
                  child: Text(getTranslated(context, "ATTENDANCE"),style: TextStyle(color: Colors.black ,fontWeight: FontWeight.w500)),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>AttendanceRecord()));

                },
              ),
              ListTile(

                title: Text(getTranslated(context, "SALARY_SLIP"),style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SalaryRecord()));
                },
              ),
            ],
          ),
        );

      },
    );
  }
}