import 'package:flutter/material.dart';

class HomeTimer extends StatefulWidget {
  HomeTimer({Key key}) : super(key: key);

  @override
  _HomeTimerState createState() => _HomeTimerState();
}

class _HomeTimerState extends State<HomeTimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Timer',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Fira Sans",
          ),
        ),
        centerTitle: true,
      ),
      body: Text('Vai trabalhar corno'),
    );
  }
}