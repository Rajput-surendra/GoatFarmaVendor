import 'package:flutter/material.dart';

import '../Helper/AppBtn.dart';
import '../Helper/Appbar.dart';
import '../Utils/Colors.dart';
import 'TextFormCard.dart';

class OrderUpdate extends StatefulWidget {

  final String orderNo;
  final String product;
  const OrderUpdate({Key? key, required this.orderNo, required this.product}) : super(key: key);

  @override
  State<OrderUpdate> createState() => _OrderUpdateState();
}

class _OrderUpdateState extends State<OrderUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        text: "Order Update",
        isTrue: true,
      ),
      backgroundColor: colors.grad1Color,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Order No.: ${widget.orderNo}",
                            style: TextStyle(
                                fontSize: 14
                            ),
                            overflow: TextOverflow.ellipsis,),
                          Text("Product code: G004",
                            style: TextStyle(
                                fontSize: 14
                            ),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 2,
                            child: Text("Product Description:${widget.product}",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis),
                          ),
                          Text("order Qty: 12 No",
                            style: TextStyle(
                                fontSize: 14
                            ),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("payment Mode : Paid",
                            style: TextStyle(
                                fontSize: 14
                            ),),
                          Text("Delivery : Door Delivery",
                            style: TextStyle(
                                fontSize: 14
                            ),),
                        ],
                      ),
                    ],
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(left: 20,bottom: 20),
                  child: Text("Amount", style:TextStyle(
                    fontSize: 20
                  ),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormCard(
                      name:"Mobile" ,
                      width: MediaQuery.of(context).size.width/2.3,
                    ),
                    TextFormCard(
                      name:"Date" ,
                      width: MediaQuery.of(context).size.width/2.3,
                    ),
                  ],
                ),

              ],
            ),
            Column(
              children: [
                SizedBox(height: 350,),
                Btn(
                  title:"Save",
                  height: MediaQuery.of(context).size.width/8,
                  width:MediaQuery.of(context).size.width/1.2 ,
                  onPress: (){
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 50,)
              ],
            ),

          ],
        ),
      ),
    );
  }
}
