import 'package:flutter/material.dart';
import 'package:mobile_toolkit/pages/AreaVolume/AreaPerimetro/Circulo.dart';
import 'package:mobile_toolkit/pages/AreaVolume/AreaPerimetro/Quadrado.dart';
import 'package:mobile_toolkit/pages/AreaVolume/AreaPerimetro/Retangulo.dart';

class AreaCalculator extends StatefulWidget {
  AreaCalculator({Key key}) : super(key: key);

  @override
  _AreaCalculatorState createState() => _AreaCalculatorState();
}

class ListItem {
  int value;
  String name;
  ListItem(this.value, this.name);
}

class _AreaCalculatorState extends State<AreaCalculator> {
  int selectedUnit = 1;

  int _shapeSelected = 1;
  List<ListItem> _dropdownShapes = [
    ListItem(1, "Quadrado"),
    ListItem(2, "Retângulo"),
    ListItem(3, "Círculo"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    value: _shapeSelected,
                    items: _dropdownShapes.map((ListItem item) {
                      return DropdownMenuItem(
                        child: Text(item.name),
                        value: item.value,
                      );
                    }).toList(),
                    icon: Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _shapeSelected = value;
                      });
                    },
                  ),
                ),
              ),
              _whatTheShape(_shapeSelected)
            ],
          ),
        ),
      ),
    );
  }
}

_whatTheShape(int index) {
  switch (index) {
    case 1:
      return APQuadrado();
      break;
    case 2:
      return APRetangulo();
      break;
    case 3:
      return APCirculo();
      break;
  }
}
