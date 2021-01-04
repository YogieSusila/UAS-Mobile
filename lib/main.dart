import 'package:zodiac/coba.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';
import 'package:zodiac/onboardme.dart';

//import 'MyAppl.dart';
import 'result.dart';
import 'about_me.dart';

void main() {
  runApp(new MaterialApp(
    home: new OnboardingMe(),
    routes: <String, WidgetBuilder>{
      '/Halsatu': (BuildContext context) => new Home(),
      '/Haldua': (BuildContext context) => new MyProfil(),
      '/Haltiga': (BuildContext context) => new MyzApp(),
      '/Halpat': (BuildContext context) => new OnboardingMe(),
    },
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  int tahun = 0;

  String _jk = "";

  void _pilihJk(String value) {
    setState(() {
      _jk = value;
    });
  }

  var _nama = new TextEditingController();
  var _zodiac = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Navigator.pushNamed(context, '/Haltiga');
              },
            );
          },
        ),
        title: new Text('Zodiac Reading'),
        centerTitle: true,
        backgroundColor: Colors.white30,
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/Haldua');
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                Image.asset('assets/aku.png'),
                new Padding(padding: new EdgeInsets.only(top: 20.0)),
                new TextField(
                  controller: _nama,
                  decoration: new InputDecoration(
                      hintText: "Masukkan Nama",
                      labelText: "Nama ",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0))),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20.0)),
                new TextField(
                  onChanged: (txt) {
                    setState(() {
                      tahun = int.parse(txt);
                    });
                  },
                  keyboardType: TextInputType.text,
                  maxLength: 4,
                  decoration: new InputDecoration(
                      hintText: "Masukkan Tahun Lahir",
                      labelText: "Tahun Lahir",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0))),
                ),
                new Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      controller: _zodiac,
                      decoration: new InputDecoration(
                          hintText: "Masukan zodiac",
                          labelText: "Zodiac",
                          border: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ))
                  ],
                ),
                Container(
                  //height: double.infinity,
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  child: RaisedButton(
                    onPressed: () {
                      var route = new MaterialPageRoute(
                        builder: (BuildContext) => new BMIResult(
                            nama_lengkap: _nama.text,
                            zodiac: _zodiac.text,
                            tahun_lahir: tahun),
                      );
                      Navigator.of(context).push(route);
                    },
                    padding: EdgeInsets.all(10.10),
                    color: Colors.white30,
                    textColor: Colors.white,
                    child: Text(
                      'Masuk',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
