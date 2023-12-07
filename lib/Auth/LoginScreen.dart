import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madhu_farma/ApiPath/Api.dart';
import 'package:madhu_farma/Helper/session.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../Screens/HomeScreen.dart';
import 'SignUpScreen.dart';
import '../Helper/AppBtn.dart';
import '../Utils/colors.dart';
import '../ApiPath/apiBasehelper.dart';

import '../Screens/MadhuFarmScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isCheck = false;
  final _formKey = GlobalKey<FormState>();
  bool isLoading =false;
  TextEditingController mobileController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });
    var parameter = {
      "mobile":mobileController.text,
      "password":passwordController.text,

    };
    apiBaseHelper.postAPICall(Uri.parse(ApiService.login), parameter).then((getData) async {





      bool error = getData['error'];
      String msg=getData['message'];

      if(error==false) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        String uId = getData['data'][0]['id'];
        String uName = getData['data'][0]['username'];
        String uMobile = getData['data'][0]['mobile'];
        String uImage = getData['data'][0]['image'];
        prefs.setString('userId', uId);
        prefs.setString('username', uName);
        prefs.setString('mobile', uMobile);
        prefs.setString('image', uImage);
        setState(() {
          Fluttertoast.showToast(msg: "${getData['message']}");
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => MadhuFarmScreen()));
        });


        setState(() {
          isLoading = false;
        });
      }
      else{

        Fluttertoast.showToast(msg: msg.toString());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.grad1Color,
      body: WillPopScope(
        onWillPop: () async {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Confirm Exit"),
                  content: Text("Are you sure you want to exit?"),
                  actions: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: colors.primary),
                      child: Text("YES"),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: colors.primary),
                      child: Text("NO"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
          return true;
        },
        child: Container(
          height: MediaQuery.of(context).size.height*1.3,
          child:Stack(
            children:[ Column(
              children: [
                   Container(
                     height: MediaQuery.of(context).size.height/2.1,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.only(
                         bottomRight: Radius.circular(30),
                         bottomLeft: Radius.circular(30)
                       ),
                       color:colors.yellow
                       ),
                     ),

              ],
            ),
            Positioned(
              top: 50,
              left: 0,
            right: 0,
              child: Column(

                children: [
                  Container(
                    child: Column(
                      children: [
                        Text(getTranslated(context, "WELCOME_TO"),
                        style: TextStyle(
                          color: colors.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: 5,),
                        Text(getTranslated(context, "MADHU_FARM"),
                          style: TextStyle(
                              color: colors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(height: 20,),
                      ],
                    ),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20,top: 10),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height/2,
                    margin: EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                         child: Container(
                           padding: EdgeInsets.all(21),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               TextFormField(
                                 controller:mobileController ,
                                 keyboardType: TextInputType.number,
                                 inputFormatters: [
                                   LengthLimitingTextInputFormatter(10),
                                 ],
                                 validator: (value) {
                                   if (value!.isEmpty) {
                                     return 'Mobile no is required';
                                   }else if(value.length<9){
                                     return 'Mobile should have aleast 10 characters';
                                   }
                                   return null;
                                 },

                                 decoration: InputDecoration(
                                   border: InputBorder.none,
                                   prefixIcon: Icon(Icons.call),
                                   // fillColor: Color(0x25888888),
                                   filled: true,
                                   hintText: getTranslated(context, "MOBILE_NO"),
                                 ),
                               ),
                               SizedBox(height: 20,),
                               TextFormField(
                                 controller: passwordController,
                                 obscureText: true,
                                 keyboardType: TextInputType.visiblePassword,
                                 validator: (value) {
                                   if (value!.isEmpty) {
                                     return 'Password is required';
                                   }else if(value.length<8){
                                     return 'Password should have aleast 8 characters';
                                   }
                                   return null;
                                 },

                                 decoration: InputDecoration(
                                   border: InputBorder.none,
                                   prefixIcon: Icon(Icons.lock),
                                   // fillColor: Color(0x25888888),
                                   filled: true,
                                   hintText: getTranslated(context, "PASSWORD"),

                                 ),
                               ),

                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [

                                   Row(
                                     children: [
                                       Checkbox(
                                         value: isCheck,
                                         checkColor: colors.blackTemp, // color of tick Mark
                                         fillColor: MaterialStateProperty.all(colors.black54),
                                         onChanged: (value) {
                                           setState(() {
                                             isCheck = value!;
                                           });
                                         },
                                       ),
                                     Text(getTranslated(context, "REMEMBER_PASSWORD"),style: TextStyle(
                                       fontSize: 10,color: colors.black54
                                     ),),
                                     SizedBox(width: 10,)],
                                   ),
                                   Text(getTranslated(context, "FORGOT_PASSWORD"),style: TextStyle(
                                       fontSize: 10,color: colors.black54
                                   ),)
                                 ],
                               ),
                               SizedBox(height: 20,),
                               Btn(
                                 onPress: (){
                                   if(_formKey.currentState!.validate()){
                                     if(isCheck == true){
                                     login();
                                       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MadhuFarmScreen())) ;
                                     }else{
                                       Fluttertoast.showToast(msg: "Select remember",backgroundColor: colors.secondary);
                                     }
                                   }
                                   else{
                                     Fluttertoast.showToast(msg: "Please Field App Field !!!",backgroundColor: colors.secondary);

                                   }
                                 },
                                 title: isLoading == true ? getTranslated(context, "PLEASE"):getTranslated(context, "LOG_IN"),
                                 height: MediaQuery.of(context).size.width/8,
                               ),
                               SizedBox(height: 15,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Text(getTranslated(context, "DONT'T_HAVE_AN_ACCOUNT"),
                                   style: TextStyle(
                                     fontSize: 14,color: colors.black54
                                   ),),
                                   GestureDetector(
                                     onTap: (){
                                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                                     },
                                     child: Text(getTranslated(context, "SIGN_UP"),textAlign: TextAlign.center,
                                       style: TextStyle(
                                           fontSize: 15,
                                         color: colors.secondary,fontWeight: FontWeight.bold,
                                       ),),
                                   ),

                                 ],
                               )
                             ],
                           ),
                         ),
                      ),
                    ),
                  ),
                ],
              ),
            )]
          ) ,
        ),
      ),
    );
  }
}
