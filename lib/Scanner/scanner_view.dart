import 'dart:developer';

import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madhu_farma/Helper/Colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../Record/AnimalRecord.dart';

class ScanPay extends StatefulWidget {
   ScanPay({Key? key,}) : super(key: key);

  @override
  State<ScanPay> createState() => _ScanPayState();
}

class _ScanPayState extends State<ScanPay> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;

  QRViewController? controller;

  @override
  void initState() {
    super.initState();
    //_onQRViewCreated;
  }


  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 300.0;
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 200,),
          Container(
            padding: EdgeInsets.all(10),
            width: 326,
            height: 326,
            decoration: BoxDecoration(
                color: colors.primary,
               // border: Border.all(color:colors.primary),
                borderRadius: BorderRadius.circular(10)
            ),
            child: QRView(
              key: qrKey,
              overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: scanArea),

              onQRViewCreated: _onQRViewCreated,
              onPermissionSet: (p0, p1) => _onPermissionSet(context, p0, p1),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: InkWell(
              onTap: () {

              },
              child: Container(

                height: 45,
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 150,

              ),
            ),
          ),

        ],
      ),
    );
  }

  _onQRViewCreated(QRViewController controller) {

    this.controller = controller;
    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
      });
      if (result != null) {
        Navigator.pop(context,result?.code );
        // await ScannqrCodeApi(result!.code.toString());
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimalRecord(taqId:result?.code)));

      }
      else {

      }
    });
  }


  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

}