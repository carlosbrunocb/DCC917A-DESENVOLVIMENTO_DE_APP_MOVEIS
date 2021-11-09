import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    // debugShowCheckedModeBanner: false,
    title: "Frases do dia",
    home: Container(
      padding: EdgeInsets.only(top: 40),
      margin: EdgeInsets.all(10),
      decoration:
          BoxDecoration(border: Border.all(width: 3, color: Colors.white)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("t1"),
          Text("t2"),
          Text("t3")],
      ),
    ),
  ));
}
