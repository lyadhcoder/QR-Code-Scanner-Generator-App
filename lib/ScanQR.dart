import 'package:flutter/material.dart';

class ScanQR extends StatefulWidget {
  @override
  _ScanQRState createState() => _ScanQRState();
}

String qrData = "No Data Found!";
var data;
bool hasdata = false;

class _ScanQRState extends State<ScanQR> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "ScanQR",
      child: Scaffold(
        appBar: AppBar(
          title: Text("QR Scanner"),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Text(
                    "Raw Data: ${(qrData)}",
                    style: TextStyle(fontSize: 22),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
