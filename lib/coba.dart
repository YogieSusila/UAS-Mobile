import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zodiac/qrcode.dart';

void main() => runApp(MyzApp());

class MyzApp extends StatefulWidget {
  @override
  _MyzAppState createState() => _MyzAppState();
}

class _MyzAppState extends State<MyzApp> {
  int maju = 0;

  @override
  Widget build(BuildContext context) {
    return (new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(context, '/Halsatu');
              },
            );
          },
        ),
        title: new Text('Daftar Zodiac'),
        centerTitle: true,
        backgroundColor: Colors.white30,
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.center_focus_weak),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HalamanQR()),
              );
            },
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage("assets/gambar$maju.png"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                color: Colors.grey,
                textColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.black,
                onPressed: () {
                  if (maju > 0) {
                    setState(() {
                      maju = maju - 1;
                    });
                  } else {
                    debugPrint("mundur $maju sudah maksimal");
                  }
                },
                child: Text("Sebelumnya", style: TextStyle(fontSize: 13.0)),
              ),
              FlatButton(
                color: Colors.grey,
                textColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.black,
                onPressed: () {
                  if (maju < 11) {
                    setState(() {
                      maju = maju + 1;
                    });
                  } else {
                    debugPrint("maju $maju sudah maksimal");
                  }
                },
                child: Text("Berikutnya", style: TextStyle(fontSize: 13.0)),
              )
            ],
          )
        ],
      )),
    ));
  }
}
