import 'package:flutter/material.dart';

class HomeNivelador extends StatefulWidget {
  HomeNivelador({Key key}) : super(key: key);

  @override
  _HomeNiveladorState createState() => _HomeNiveladorState();
}

class _HomeNiveladorState extends State<HomeNivelador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nivelador',
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
