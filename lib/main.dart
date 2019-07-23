import 'package:flutter/material.dart';
import 'package:inventory_mobile_application/ui/home.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Frc Inventory',
    home: new Home(),
    theme: new ThemeData(
      accentColor: Colors.white, primaryColor: Colors.blue.shade700,),
  ));
}