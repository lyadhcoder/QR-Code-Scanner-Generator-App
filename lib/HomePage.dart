import 'package:flutter/material.dart';
import './ScanQR.dart';
import './QRGenerater.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5F39B3),
      appBar: AppBar(
        backgroundColor: Color(4290028543),
        title: Text(
          "QR Code Scanner & Generator",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: (MediaQuery.of(context).size.height) -
                    AppBar().preferredSize.height -
                    kToolbarHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/qr-scan.png",
                    ),
                    foregroundColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    radius: 190),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(
                      tag: "Scan QR",
                      child: Container(
                        width: ((MediaQuery.of(context).size.width) / 2) - 45,
                        height: 50,
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScanQR()));
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      width: ((MediaQuery.of(context).size.width) / 2) - 45,
                      height: 50,
                      child: OutlineButton(
                        focusColor: Colors.red[600],
                        highlightColor: Colors.red[400],
                        hoverColor: Colors.red,
                        splashColor: Colors.orange,
                        borderSide: BorderSide(width: 1, color: Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Text(
                          "Generate QR",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QRGenerater()));
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
