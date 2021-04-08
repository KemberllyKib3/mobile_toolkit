import 'package:flutter/material.dart';

class MainSecondButtons extends StatelessWidget {
  MainSecondButtons({
    @required this.labelMain,
    @required this.labelSecond,
    @required this.onTapMain,
    @required this.onTapSecond,
  });

  final String labelMain;
  final String labelSecond;
  final VoidCallback onTapMain;
  final VoidCallback onTapSecond;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            padding: EdgeInsets.only(left: 40, right: 40),
            elevation: 3,
            color: Theme.of(context).primaryColor,
            child: Text(
              labelMain.toUpperCase(),
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Fira Sans',
                fontWeight: FontWeight.bold,
              ),
            ),
            height: 50,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: onTapMain,
          ),
          TextButton(
            onPressed: onTapSecond,
            child: Text(
              labelSecond,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
