import 'package:flutter/material.dart';

import '../Helper/AppBtn.dart';
import '../Helper/Appbar.dart';
import '../Utils/Colors.dart';

class SupplementScreen extends StatefulWidget {
  const SupplementScreen({Key? key}) : super(key: key);

  @override
  State<SupplementScreen> createState() => _SupplementScreenState();
}

class _SupplementScreenState extends State<SupplementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.grad1Color,
      appBar:customAppBar(context: context, text:"Create Supplement", isTrue: true, ),
      body:Container(
        padding: EdgeInsets.all(15),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Makka',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(
                            width: MediaQuery.of(context).size.width/2.3,
                            color: Colors.white,
                            child:TextFormField(
                              // maxLines: 4,
                              textAlign: TextAlign.center,
                              cursorHeight: 25,
                              decoration: InputDecoration(
                                  // contentPadding: EdgeInsets.only(top: 10),
                                  border:InputBorder.none,
                                  hintText: "Stock :45 kg",
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                    color: colors.blackTemp
                                  )
                              ),
                            )
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gahu',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(
                            width: MediaQuery.of(context).size.width/2.3,
                            color: Colors.white,
                            child:TextFormField(
                              // maxLines: 4,
                              textAlign: TextAlign.center,
                              cursorHeight: 25,
                              decoration: InputDecoration(
                                // contentPadding: EdgeInsets.only(top: 10),
                                  border:InputBorder.none,
                                  hintText: "Stock :108 kg",
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: colors.blackTemp
                                  )
                              ),
                            )
                        )
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Soyabin',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(
                            width: MediaQuery.of(context).size.width/2.3,
                            color: Colors.white,
                            child:TextFormField(
                              // maxLines: 4,
                              textAlign: TextAlign.center,
                              cursorHeight: 25,
                              decoration: InputDecoration(
                                // contentPadding: EdgeInsets.only(top: 10),
                                  border:InputBorder.none,
                                  hintText: "Stock :15 kg",
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: colors.blackTemp
                                  )
                              ),
                            )
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sarki dhep',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(
                            width: MediaQuery.of(context).size.width/2.3,
                            color: Colors.white,
                            child:TextFormField(
                              // maxLines: 4,
                              textAlign: TextAlign.center,
                              cursorHeight: 25,
                              decoration: InputDecoration(
                                // contentPadding: EdgeInsets.only(top: 10),
                                  border:InputBorder.none,
                                  hintText: "Stock :35 kg",
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: colors.blackTemp
                                  )
                              ),
                            )
                        )
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mineral',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(
                            width: MediaQuery.of(context).size.width/2.3,
                            color: Colors.white,
                            child:TextFormField(
                              // maxLines: 4,
                              textAlign: TextAlign.center,
                              cursorHeight: 25,
                              decoration: InputDecoration(
                                // contentPadding: EdgeInsets.only(top: 10),
                                  border:InputBorder.none,
                                  hintText: "Stock :40 kg",
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: colors.blackTemp
                                  )
                              ),
                            )
                        )
                      ],
                    ),


                  ],
                ),
              ],
            ),
            Btn(
              title:"Add",
              height: MediaQuery.of(context).size.width/8,
              width:MediaQuery.of(context).size.width/1.2 ,
            ),
          ],
        ) ,
      ) ,
    );
  }
}
