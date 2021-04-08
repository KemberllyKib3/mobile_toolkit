import 'package:flutter/material.dart';
import 'package:mobile_toolkit/pages/utils/ButtonsCalcularLimpar.dart';
import 'package:mobile_toolkit/pages/utils/Resultado.dart';

class VolEsfera extends StatefulWidget {
  VolEsfera({Key key}) : super(key: key);

  @override
  _VolEsferaState createState() => _VolEsferaState();
}

class ListItem {
  int value;
  String name;
  ListItem(this.value, this.name);
}

// ignore: camel_case_types
class _VolEsferaState extends State<VolEsfera> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int _unitSelected = 1;
  List<ListItem> _dropdownUnits = [
    ListItem(1, "M"),
    ListItem(2, "CM"),
  ];

  bool halfcompleted = false;
  String _content;

  double _diametro;
  double _raio;
  final double pi = 3.1415;

  String _resultado = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 6,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.black12,
                      labelText: "Raio",
                      hintStyle: TextStyle(
                        color: Colors.black26,
                        fontSize: 16,
                        fontFamily: 'Fira Sans',
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) =>
                        ((value == null || value.isEmpty) && !halfcompleted)
                            ? 'Por favor, insira os dados.'
                            : null,
                    onChanged: (value) {
                      halfcompleted = true;
                      _content = value;
                    },
                    readOnly:
                        ((!halfcompleted) || (_content == null)) ? false : true,
                    onSaved: (val) {
                      _raio = double.tryParse(val);
                    },
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                          value: _unitSelected,
                          items: _dropdownUnits.map((ListItem item) {
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
                              _unitSelected = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: Colors.black12,
                labelText: "Diâmetro",
                hintStyle: TextStyle(
                  color: Colors.black26,
                  fontSize: 16,
                  fontFamily: 'Fira Sans',
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) =>
                  ((value == null || value.isEmpty) && !halfcompleted)
                      ? 'Por favor, insira os dados.'
                      : null,
              onChanged: (value) {
                halfcompleted = true;
                _content = value;
              },
              readOnly: ((!halfcompleted) || (_content == null)) ? false : true,
              onSaved: (val) {
                _diametro = double.tryParse(val);
              },
            ),
          ),
          MainSecondButtons(
            labelMain: "Calcular",
            labelSecond: "Limpar resultados",
            onTapMain: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                setState(() {
                  if (_raio != null) {
                    _resultado = "Área: " +
                        (pi * (_raio * _raio)).toStringAsFixed(2) +
                        ((_unitSelected == 1) ? ' m' : ' cm') +
                        "\nPerímetro: " +
                        (2 * pi * _raio).toStringAsFixed(2) +
                        ((_unitSelected == 1) ? ' m' : ' cm');
                  } else if (_diametro != null) {
                    _resultado = "Área: " +
                        (pi * ((_diametro / 2) * (_diametro / 2)))
                            .toStringAsFixed(2) +
                        ((_unitSelected == 1) ? ' m' : ' cm') +
                        "\nPerímetro: " +
                        (2 * pi * (_diametro / 2)).toStringAsFixed(2) +
                        ((_unitSelected == 1) ? ' m' : ' cm');
                  }
                });
              }
            },
            onTapSecond: () {
              setState(() {
                _resultado = "";
                _raio = 0;
                _diametro = 0;
                halfcompleted = false;
              });
            },
          ),
          Resultado(label: _resultado),
        ],
      ),
    );
  }
}
