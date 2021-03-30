import 'package:flutter/material.dart';
import 'package:mobile_toolkit/pages/Calculadora/CalculatorButton.dart';
import 'package:mobile_toolkit/pages/Calculadora/ResultDisplay.dart';

class Calculation extends StatefulWidget {
  Calculation({Key key}) : super(key: key);

  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  double width;

  int firstOperand;
  String operator;
  int secondOperand;
  int result;

  @override
  void didChangeDependencies() {
    width = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: ResultDisplay(result: _getDisplayText()),
        ),
        Row(
          children: [
            _getButton(
              text: 'AC',
              onTap: () => clear(),
              backgroundColor: Color.fromRGBO(220, 220, 220, 1),
            ),
            _getButton(
              text: 'DEL',
              onTap: deleteEndDigit,
              backgroundColor: Color.fromRGBO(220, 220, 220, 1),
            ),
            _getButton(
              text: '^',
              onTap: () => operatorPressed('^'),
              backgroundColor: Color.fromRGBO(220, 220, 220, 1),
            ),
            _getButton(
              text: 'x',
              onTap: () => operatorPressed('*'),
              backgroundColor: Color.fromRGBO(220, 220, 220, 1),
            ),
          ],
        ),
        Row(
          children: [
            _getButton(text: '7', onTap: () => numberPressed(7)),
            _getButton(text: '8', onTap: () => numberPressed(8)),
            _getButton(text: '9', onTap: () => numberPressed(9)),
            _getButton(
              text: '÷',
              onTap: () => operatorPressed('/'),
              backgroundColor: Color.fromRGBO(220, 220, 220, 1),
            ),
          ],
        ),
        Row(
          children: [
            _getButton(text: '4', onTap: () => numberPressed(4)),
            _getButton(text: '5', onTap: () => numberPressed(5)),
            _getButton(text: '6', onTap: () => numberPressed(6)),
            _getButton(
              text: '-',
              onTap: () => operatorPressed('-'),
              backgroundColor: Color.fromRGBO(220, 220, 220, 1),
            ),
          ],
        ),
        Row(
          children: [
            _getButton(text: '1', onTap: () => numberPressed(1)),
            _getButton(text: '2', onTap: () => numberPressed(2)),
            _getButton(text: '3', onTap: () => numberPressed(3)),
            _getButton(
              text: '+',
              onTap: () => operatorPressed('+'),
              backgroundColor: Color.fromRGBO(220, 220, 220, 1),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(6),
              child: Container(
                width: width / 4 - 12,
                height: width / 4 - 12,
              ),
            ),
            _getButton(text: '0', onTap: () => numberPressed(0)),
            _getButton(
              text: '.',
              onTap: () => decimal(),
            ),
            _getButton(
              text: '=',
              onTap: () => calculateResult(),
              backgroundColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }

  Widget _getButton({
    String text,
    Function onTap,
    Color backgroundColor = Colors.white,
    Color textColor = Colors.black,
  }) {
    return CalculatorButton(
      label: text,
      onTap: onTap,
      size: width / 4 - 12,
      backgroundColor: backgroundColor,
      labelColor: textColor,
    );
  }

  operatorPressed(String operator) {
    setState(() {
      if (firstOperand == null) {
        firstOperand = 0;
      }
      this.operator = operator;
    });
  }

  deleteEndDigit() {
    // result = result.length > 1 ? result.substring(0, result.length - 1) : '0';

    result = int.tryParse('$result'.length > 1
        ? '$result'.substring(0, '$result'.length - 1)
        : '0');
  }

  decimal() {}

  numberPressed(int number) {
    setState(() {
      if (result != null) {
        result = null;
        firstOperand = number;
        return;
      }
      if (firstOperand == null) {
        firstOperand = number;
        return;
      }
      if (operator == null) {
        firstOperand = int.parse('$firstOperand$number');
        return;
      }
      if (secondOperand == null) {
        secondOperand = number;
        return;
      }
      secondOperand = int.parse('$secondOperand$number');
    });
  }

  calculateResult() {
    if (operator == null || secondOperand == null) {
      return;
    }
    setState(() {
      switch (operator) {
        case '+':
          result = firstOperand + secondOperand;
          break;
        case '-':
          result = firstOperand - secondOperand;
          break;
        case '*':
          result = firstOperand * secondOperand;
          break;
        case '/':
          if (secondOperand == 0) {
            return;
          }
          result = firstOperand ~/ secondOperand;
          break;
        case '^':
          result = firstOperand;
          for (var i = 1; i < secondOperand; i++) {
            result *= firstOperand;
          }
          break;
      }
      firstOperand = result;
      operator = null;
      secondOperand = null;
      result = null;
    });
  }

  clear() {
    setState(() {
      result = null;
      operator = null;
      secondOperand = null;
      firstOperand = null;
    });
  }

  String _getDisplayText() {
    if (result != null) {
      return '$result';
    }
    if (secondOperand != null) {
      return '$firstOperand$operator$secondOperand';
    }
    if (operator != null) {
      return '$firstOperand$operator';
    }
    if (firstOperand != null) {
      return '$firstOperand';
    }
    return '0';
  }
}
