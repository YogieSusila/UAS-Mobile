import 'package:flutter/material.dart';

Widget callToAction({text = 'Get Started', homeRoute, context}) {
  return Container(
    height: 70,
    width: double.infinity,
    color: Colors.grey[300],
    child: GestureDetector(
      onTap: () {
        try {
          Navigator.pushNamed(context, '/Halsatu');
        } catch (e) {
          print(e);
          print(
              "Set homeRoute to the route where you want to land after on-boarding");
        }
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}
