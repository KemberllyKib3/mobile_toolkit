import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  Resultado({
    @required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Fira Sans',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
