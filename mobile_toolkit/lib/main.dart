import 'package:flutter/material.dart';
import 'package:mobile_toolkit/pages/HomeMain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toolkit Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff2B71F9), // 0xff + HexCode
      ),
      home: HomeMain(),
    );
  }
}
