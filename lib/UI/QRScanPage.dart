import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
class QRScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  String qrCode = 'N/A';

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: Text('Start QR scan',style:TextStyle(fontSize:30,fontWeight:FontWeight.w500)),
                onPressed: () => scanQR(),
              ),
              Text(
                'Scan Result',
                style: TextStyle(
                  fontSize: 16,
                  color:(qrCode=='N/A')?Colors.white70: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '$qrCode',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color:(qrCode=='N/A')?Colors.white70: Colors.black,
                ),
              ),
              SizedBox(height: 72),

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed:(){Navigator.of(context).pop(qrCode);},child:Icon(Icons.logout)),
      );

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      qrCode = barcodeScanRes;
    });
  }
}