import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class HalamanQR extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
    );
    return materialApp;
  }

  _HalamanQRState createState() => _HalamanQRState();
}

class _HalamanQRState extends State<HalamanQR> {
  String text = 'Scan untuk mendapatkan info lebih lanjut';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        centerTitle: true,
        title: Text('QR Scan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text("Scan"),
              onPressed: () async {
                text = await scanner.scan();
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
