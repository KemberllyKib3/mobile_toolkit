import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  ResultDisplay({@required this.result});

  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      color: Theme.of(context).primaryColor,
      child: Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.only(right: 24, bottom: 24),
        child: Text(
          result,
          style: TextStyle(color: Colors.white, fontSize: 34),
        ),
      ),
    );
  }
}
