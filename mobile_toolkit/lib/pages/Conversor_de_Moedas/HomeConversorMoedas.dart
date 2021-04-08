import 'package:flutter/material.dart';

class HomeConversorMoedas extends StatefulWidget {
  @override
  _HomeConversorMoedasState createState() => _HomeConversorMoedasState();
}

class _HomeConversorMoedasState extends State<HomeConversorMoedas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Conversor de Moedas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Fira Sans",
          ),
        ),
        centerTitle: true,
      ),
      body: Text('Vai trabalhar moço'),
    );
  }
}
