import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        backgroundColor: Color(0xFF5F39B3),
        appBar: AppBar(
          backgroundColor: Color(4290028543),
          title: Text("QR Scanner", style: TextStyle(color: Colors.black)),
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
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  )),
                  IconButton(
                    icon: Icon(Icons.launch_outlined),
                    onPressed: hasdata
                        ? () async {
                            if (await canLaunch(qrData)) {
                              print(qrData);
                              await launch(qrData);
                            } else {
                              throw "Could Not Launch";
                            }
                          }
                        : null,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: ((MediaQuery.of(context).size.width) / 2) - 45,
                height: 30,
                child: OutlineButton(
                  focusColor: Colors.red[600],
                  highlightColor: Colors.red[400],
                  hoverColor: Colors.red,
                  splashColor: Colors.orange,
                  borderSide: BorderSide(width: 1, color: Colors.white),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  child: Text(
                    "Scan QR",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onPressed: () async {
                    var option = ScanOptions(autoEnableFlash: true);
                    data = await BarcodeScanner.scan(options: option);
                    setState(() {
                      qrData = data.rawContent.toString();
                      hasdata = true;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
