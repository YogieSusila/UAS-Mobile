import 'package:flutter/material.dart';

List<Widget> screenData(int numOfPages, screenContent) {
  List<Widget> list = [];

  for (int i = 0; i < numOfPages; i++) {
    try {
      list.add(getScreenData(screenContent[i], i));
    } catch (e) {
      print("You should provide enough content for all screens");
    }
  }
  return list;
}

Widget getScreenData(Map<String, String> screenContent, i) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 40.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Image(
            image: AssetImage(
              screenContent["Scr ${i + 1} Image Path"].toString(),
            ),
            height: 300.0,
            width: 300.0,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          screenContent["Scr ${i + 1} Heading"].toString(),
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'CM Sans Serif',
            fontSize: 15,
            height: 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15.0),
        Text(
          screenContent["Scr ${i + 1} Sub Heading"].toString(),
          style: TextStyle(
            color: Colors.black87,
            fontSize: 12,
            height: 1.2,
          ),
        ),
      ],
    ),
  );
}
