// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:dojeapp/screen/screen_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doje',
      home: HomeScreen(),
    );
  }
}