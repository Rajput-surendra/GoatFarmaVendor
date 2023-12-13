import 'package:flutter/material.dart';


import '../Utils/Colors.dart';

class CustomCard extends StatelessWidget {
  final String title;
  IconData? icon;

  // final String subtitle;
  // final IconData icon;

  CustomCard({required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colors.blacktextColor,
            // Specify your desired border color here
            width: 1.0, // Adjust the border width
          ),
        ),
      ),
      child:
      // leading: Icon(icon),
      Container(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // SizedBox(width: MediaQuery.of(context).size.width/23,),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  color: colors.blacktextColor,
                  fontWeight: FontWeight.w500),
            ),
            Icon(
              icon,
              size: 15,
              color: colors.blacktextColor,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard2 extends StatelessWidget {
  final String title;

  CustomCard2({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colors.blacktextColor,
            // Specify your desired border color here
            width: 1.0, // Adjust the border width
          ),
        ),
      ),
      child:
      // leading: Icon(icon),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  color: colors.darkBlue,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard3 extends StatelessWidget {
  final String title;
  final bool currentindex;

  CustomCard3({required this.title, required this.currentindex});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return Card(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10.0),),
      child: Container(
        height: size.height / 24,
        width: size.width / 5.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: currentindex == true ? colors.darkBlue : colors.transparent,
        ),
        child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 12,
                  color:
                  currentindex == true ? colors.transparent : colors.textColor),
            )),
      ),
    );
  }
}

class CustomCard4 extends StatelessWidget {
  final String name1;
  final String name2;
  final String name3;
  final String name4;
  final String name5;
  final String name6;

  CustomCard4(
      {required this.name1,
        required this.name2,
        required this.name3,
        required this.name4,
        required this.name5,
        required this.name6});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        padding: const EdgeInsets.all(7),
        width: size.width / 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width:90 ,
                  child: Text(
                    name1,
                    style: TextStyle(fontSize: 12, color: colors.textColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  width:90 ,
                  child: Text(
                    name4,
                    style: TextStyle(fontSize: 12, color: colors.textColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width:90 ,
                  child: Text(
                    name2,
                    style: TextStyle(fontSize: 12, color: colors.textColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 5,),

                Container(
                  width:90 ,
                  child: Text(
                    name5,
                    style: TextStyle(fontSize: 12, color: colors.textColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width:90 ,
                  child: Text(
                    name3,
                    style: TextStyle(fontSize: 12, color: colors.textColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 5,),

                Container(
                  width:90 ,
                  child: Text(
                    name6,
                    style: TextStyle(fontSize: 12, color: colors.textColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard5 extends StatelessWidget {
  final String name1;
  final String name2;
  final String name3;
  final String name4;

  CustomCard5({
    required this.name1,
    required this.name2,
    required this.name3,
    required this.name4,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    return InkWell(
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(6),
          height: size.height / 13,
          width: size.width / 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name1,
                    style: TextStyle(fontSize: 14, color: colors.textColor),
                  ),
                  Text(
                    name2,
                    style: TextStyle(fontSize: 14, color: colors.textColor),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name3,
                    style: TextStyle(fontSize: 14, color: colors.textColor),
                  ),
                  Text(
                    name4,
                    style: TextStyle(fontSize: 14, color: colors.textColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard6 extends StatelessWidget {
  final String name1;
  final String name2;
  final String name3;
  final String name4;
  final String name5;

  CustomCard6({
    required this.name1,
    required this.name2,
    required this.name3,
    required this.name4,
    required this.name5,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        padding: const EdgeInsets.all(6),
        height: size.height / 8,
        width: size.width / 1,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name1,
                    style: TextStyle(fontSize: 12, color: colors.textColor),
                  ),
                  Text(
                    name2,
                    style: TextStyle(fontSize: 12, color: colors.textColor),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name3,
                    style: TextStyle(fontSize: 12, color: colors.textColor),
                  ),
                  Text(
                    name4,
                    style: TextStyle(fontSize: 12, color: colors.textColor),
                  ),
                ],
              ),
              Text(
                name5,
                style: TextStyle(fontSize: 12, color: colors.textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard7 extends StatelessWidget {
  final String name1;
  final String name2;
  final double? height;
  final double? width;

  CustomCard7({
    required this.name1,
    required this.name2,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        padding: const EdgeInsets.all(6),
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Supplement()));
                    },
                    child: Text(
                      name1,
                      style: TextStyle(fontSize: 15, color: colors.textColor),
                    ),
                  ),
                  Text(
                    name2,
                    style: TextStyle(fontSize: 15, color: colors.textColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}