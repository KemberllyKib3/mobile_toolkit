import 'package:flutter/material.dart';

class HomeConversorMedidas extends StatefulWidget {
  @override
  _HomeConversorMedidasState createState() => _HomeConversorMedidasState();
}

class _HomeConversorMedidasState extends State<HomeConversorMedidas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Conversor de Medidas',
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
