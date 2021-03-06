import 'package:flutter/material.dart';
import 'package:mobile_toolkit/pages/Calculadora/Calculation.dart';

class HomeCalculator extends StatefulWidget {
  @override
  _HomeCalculatorState createState() => _HomeCalculatorState();
}

class _HomeCalculatorState extends State<HomeCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculadora',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Fira Sans",
          ),
        ),
        centerTitle: true,
      ),
      body: Calculation(),
    );
  }
}
