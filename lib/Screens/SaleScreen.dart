import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';


import '../Helper/Appbar.dart';
import '../Helper/CustomCard.dart';
import '../Utils/Colors.dart';
import 'OrderPacking.dart';
import 'OrderUpdateScreen.dart';


class Sale extends StatefulWidget {
  const Sale({Key? key}) : super(key: key);

  @override
  State<Sale> createState() => _SaleState();
}

bool currentindex1 = false;
bool currentindex2 = false;
bool currentindex3 = false;
var pageChange;

class _SaleState extends State<Sale> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appBarTitle = "Sale";
    currentindex1=true;
    pageChange=1;
  }

  String appBarTitle = "Sale";

  void changeTitle() {
    setState(() {

      pageChange==1?appBarTitle = "Sale":"";
      pageChange==2?appBarTitle = "Door sale":"";
      pageChange==3?appBarTitle = "Order Status":"";
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "SALE"),
        isTrue: true,
      ),

      // pageChange==2?customAppBar3(context: context, text: "kjfjf", isTrue: true, image: 'assets/images/Group 72309.png',):AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentindex1 = true;
                        pageChange = 1;
                        changeTitle();
                        if (currentindex1 == true) {
                          currentindex2 = false;
                          currentindex3 = false;
                        }
                      });
                    },
                    child: Card(
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        height: size.height / 18,
                        width: size.width / 3.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: currentindex1 == true
                              ? colors.darkBlue
                              : colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            getTranslated(context, "VIEW_ORDERS"),
                            style: TextStyle(
                                fontSize: 13,
                                color: currentindex1 == true
                                    ? colors.transparent
                                    : colors.textColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentindex2 = true;
                        pageChange = 2;
                        changeTitle();
                        if (currentindex2 == true) {
                          currentindex1 = false;
                          currentindex3 = false;
                        }
                      });
                    },
                    child: Card(
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        height: size.height / 18,
                        width: size.width / 3.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: currentindex2 == true
                              ? colors.darkBlue
                              : colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            getTranslated(context, "DOOR_SALE"),
                            style: TextStyle(
                                fontSize: 13,
                                color: currentindex2 == true
                                    ? colors.transparent
                                    : colors.textColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentindex3 = true;
                        pageChange = 3;
                        changeTitle();
                        if (currentindex3 == true) {
                          currentindex1 = false;
                          currentindex2 = false;
                        }
                      });
                    },
                    child: Card(
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        height: size.height / 18,
                        width: size.width / 3.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: currentindex3 == true
                              ? colors.darkBlue
                              : colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            getTranslated(context, "ORDER_STATUS"),
                            style: TextStyle(
                                fontSize: 13,
                                color: currentindex3 == true
                                    ? colors.transparent
                                    : colors.textColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              pageChange == 1
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        getTranslated(context, "ORDER_NO"),
                        style: TextStyle(
                            fontSize: 15,
                            color: colors.blacktextColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Card(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      height: size.height / 18,
                      width: size.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: currentindex3 == true
                            ? colors.darkBlue
                            : colors.transparent,
                      ),
                      child: TextFormField(decoration: InputDecoration(
                        // hintText: 'Enter your text',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPacking()));
                        },
                        child: CustomCard6(
                            name1: "Order No : MF005",
                            name2: "Customer : Arun Pawar",
                            name3: "Product : Gavran Agg(6 no)",
                            name4: "Payment : Paid",
                            name5: "Remark :"),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPacking()));
                        },
                        child: CustomCard6(
                            name1: "Order No : MF006",
                            name2: "Customer : Vishwal Deore",
                            name3: "Product : Beetal Goat(1 no)",
                            name4: "Payment : cash on",
                            name5: "Remark :"),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPacking()));
                        },
                        child: CustomCard6(
                            name1: "Order No : MF008",
                            name2: "Customer : Nilesh sable",
                            name3: "Product : Goat Meet(500g)",
                            name4: "Payment : Paid",
                            name5: "Remark : Bonless Meet only"),
                      ),
                    ],
                  ),
                ],
              )
                  : Container(),


              pageChange == 2
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            getTranslated(context, "CATEGORY"),
                            style: TextStyle(
                                fontSize: 14,
                                color: colors.blacktextColor,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(width: 110,),
                          Text( "Product Id",
                            style: TextStyle(
                                fontSize: 14,
                                color: colors.blacktextColor,
                                fontWeight: FontWeight.normal),),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Card(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          height: size.height / 18,
                          width: size.width / 2.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: currentindex3 == true
                                ? colors.darkBlue
                                : colors.transparent,
                          ),
                          child: TextFormField(decoration: InputDecoration(
                            // hintText: 'Enter your text',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          ),
                        ),
                      ),


                      Card(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          height: size.height / 18,
                          width: size.width / 2.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: currentindex3 == true
                                ? colors.darkBlue
                                : colors.transparent,
                          ),
                          child: TextFormField(decoration: InputDecoration(
                            // hintText: 'Enter your text',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderUpdate()));
                        },
                        child: CustomCard6(
                            name1: "Product ID : G008",
                            name2: "Product : Beetal Goat",
                            name3: "Age : 15(M)",
                            name4: "Weight : 25 kg",
                            name5: "Price : 8500.00"),
                      ),
                      GestureDetector(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderUpdate()));
                        },
                        child: CustomCard6(
                            name1: "Product ID : G0018",
                            name2: "Product : Kadaknath Egg",
                            name3: "Packing : 6 No",
                            name4: "Stock : 25 No",
                            name5: "Price : 96.00"),
                      ),
                      GestureDetector(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderUpdate()));
                        },
                        child: CustomCard6(
                            name1: "Product ID : G035",
                            name2: "Product : Gavran Meet",
                            name3: "Packing :  500G",
                            name4: "Stock : 15 kg",
                            name5: "Price : 325.00"),
                      ),
                    ],
                  ),
                ],
              )
                  : Container(),


              pageChange == 3
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        getTranslated(context, "ORDER_NO"),
                        style: TextStyle(
                            fontSize: 15,
                            color: colors.blacktextColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Card(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      height: size.height / 18,
                      width: size.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        // color: currentindex3 == true
                        //     ? colors.darkBlue
                        //     : colors.transparent,
                      ),
                      child: TextFormField(decoration: InputDecoration(
                        // hintText: 'Enter your text',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderUpdate(
                            orderNo: "MF005",
                            product: " Gavran Agg(6 no)",
                          )));
                        },
                        child: CustomCard6(
                            name1: "Order No : MF005",
                            name2: "Customer : Arun Pawar",
                            name3: "Product : Gavran Agg(6 no)",
                            name4: "Status : In Process",
                            name5: "Remark :"),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderUpdate(
                            orderNo: "MF006",
                            product: "eetal Goat(1 no)",
                          )));
                        },
                        child: CustomCard6(
                            name1: "Order No : MF006",
                            name2: "Customer : Vishwal Deore",
                            name3: "Product : Beetal Goat(1 no)",
                            name4: "Status : Pending",
                            name5: "Remark :"),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderUpdate(
                            orderNo: " MF008",
                            product: "Goat Meet(500g)",
                          )));
                        },
                        child: CustomCard6(
                            name1: "Order No : MF008",
                            name2: "Customer : Nilesh sable",
                            name3: "Product : Goat Meet(500g)",
                            name4: "Status : Delivered",
                            name5: "Remark : Bonless Meet only"),
                      ),
                      // name6: "Date : 25.07.2023"),
                    ],
                  ),
                ],
              )
                  : Container(),

            ],
          ),
        ),
      ),
    );
  }
}