
import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';

import '../Helper/AppBtn.dart';
import '../Helper/CustomText.dart';
import '../Utils/Colors.dart';
import '../helper/appbar.dart';

class OrderPacking extends StatefulWidget {
  const OrderPacking({Key? key}) : super(key: key);

  @override
  State<OrderPacking> createState() => _OrderPackingState();
}

class _OrderPackingState extends State<OrderPacking> {
  @override
  final _formKey= GlobalKey<FormState>();
  final _orderNo=TextEditingController();
  final _prodCode=TextEditingController();
  final _prodDes=TextEditingController();
  final _orderQty=TextEditingController();
  final _PayMode=TextEditingController();
  final _Delivery=TextEditingController();
  final _ScanProd=TextEditingController();
  final _qty=TextEditingController();
  final _Curier=TextEditingController();
  final _trackingId=TextEditingController();
  final _remark=TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: customAppBar(isTrue:true,text: getTranslated(context, "ORDER_PACKING"),onTaped: (){},context: context,),
        // appBar: getAppbar(context: context, text:"Goat ", isTrue: true, ),
        backgroundColor:colors.grad1Color,
        body:Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomColumnTextField(text1: 'Order No.',controller1: _orderNo,),
                      SizedBox(height: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Custom_Text(text: ' Product Code'),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height/14.5,
                                width: MediaQuery.of(context).size.width/3.3,
                                child: Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                                  child: TextFormField(
                                    // maxLines: 4,
                                    cursorHeight: 25,
                                    controller: _prodCode,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        // border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.all(10),
                                        hintText: '',
                                        hintStyle: TextStyle(
                                            color: colors.blacktextColor,
                                            fontSize: 14
                                        )
                                    ),
                                    validator: (value){
                                      if(value==null||value.isEmpty){
                                        return "This field is required";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Card(
                                child: Container(
                                  height: MediaQuery.of(context).size.height/17,
                                  child: IconButton(onPressed: (){},icon: Icon(Icons.delete,color: Colors.red,size: 26,),),

                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  CustomRowTextField(text1: "Product Description",controller1: _prodDes,text2: 'Order Qty',controller2: _orderQty,),
                  SizedBox(height: 10,),
                  CustomRowTextField(controller1: _PayMode, text1: 'Payment Mode', text2: 'Delivery', controller2: _Delivery),
                  SizedBox(height: 10,),
                  CustomRowTextField(controller1: _ScanProd, text1: 'Scan Product', text2: "Qty", controller2: _qty),
                  SizedBox(height: 10,),
                  CustomRowTextField(controller1: _Curier, text1: "Curier", text2: 'Tracking ID', controller2: _trackingId),
                  SizedBox(height: 10,),
                  Custom_Text(text: ' Remark'),
                  SizedBox(height: 5,),

                  Card(child: CustomTextFormField(controller: _remark, hintText: '',)),
                  // CustomTextField(text1: 'Remark',controller1: _remark,),
                  SizedBox(height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Btn(title: getTranslated(context, "SAVE"),height: 45,width: MediaQuery.of(context).size.width/1.2,
                      onPress: (){
                        Navigator.pop(context);
                      },),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}