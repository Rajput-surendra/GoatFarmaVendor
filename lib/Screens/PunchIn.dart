import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madhu_farma/Helper/Colors.dart';
import 'package:madhu_farma/Helper/CustomButton.dart';
import 'package:madhu_farma/Helper/session.dart';

import '../Helper/Appbar.dart';

class PunchInScreen extends StatefulWidget {
  const PunchInScreen({Key? key}) : super(key: key);

  @override
  State<PunchInScreen> createState() => _PunchInScreenState();
}

class _PunchInScreenState extends State<PunchInScreen> {
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final source = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Choose Image Source'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, ImageSource.camera);
              },
              child: Text('Camera'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, ImageSource.gallery);
              },
              child: Text('Gallery'),
            ),
          ],
        );
      },
    );

    if (source != null) {
      final XFile? image = await _picker.pickImage(source: source);

      setState(() {
        _selectedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.grad1Color,
      appBar: customAppBar(
        context: context,
        text: getTranslated(context, "PUNCH_IN_/_OUT"),
        isTrue: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        // padding: EdgeInsets.symmetric(
        //     horizontal: MediaQuery.of(context).size.width * 0.2),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 140,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // shape: BoxShape.circle,
                  image: _selectedImage != null
                      ? DecorationImage(
                    image: FileImage(File(_selectedImage!.path)),
                    fit: BoxFit.cover,
                  )
                      : null,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: _selectedImage == null
                    ? Icon(Icons.person, size: 50)
                    : null,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Time :09:15 am'),
            SizedBox(
              height: 10,
            ),

            Btn(
              height: 50,
              width: 150,
              title: getTranslated(context, "PUNCH_IN"),
              onPress: (){

            },),

            SizedBox(
              height: 50,
            ),
            Text(
              'Save Successfully',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

