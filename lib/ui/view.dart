import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class View extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ViewState();
  }
}

class ViewState extends State<View> {

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

