import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class CheckOut extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CheckOutState();
  }
}

class CheckOutState extends State<CheckOut> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: Text("FRC Inventory App"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Read Bar Code'),
          )
        ],
      ),
    );
  }
}

