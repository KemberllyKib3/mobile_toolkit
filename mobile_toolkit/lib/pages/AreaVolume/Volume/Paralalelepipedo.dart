import 'package:flutter/material.dart';
import 'package:mobile_toolkit/pages/utils/ButtonsCalcularLimpar.dart';
import 'package:mobile_toolkit/pages/utils/Resultado.dart';

class VolParalelepipedo extends StatefulWidget {
  VolParalelepipedo({Key key}) : super(key: key);

  @override
  _VolParalelepipedoState createState() => _VolParalelepipedoState();
}

class ListItem {
  int value;
  String name;
  ListItem(this.value, this.name);
}

// ignore: camel_case_types
class _VolParalelepipedoState extends State<VolParalelepipedo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int _unitSelected = 1;
  List<ListItem> _dropdownUnits = [
    ListItem(1, "M"),
    ListItem(2, "CM"),
  ];

  double _largura;
  double _comprimento;
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
              children: [
                Expanded(
                  flex: 6,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.black12,
                      labelText: "Digite a largura",
                      // hintText: "Digite a largura",
                      hintStyle: TextStyle(
                        color: Colors.black26,
                        fontSize: 16,
                        fontFamily: 'Fira Sans',
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'Por favor, insira os dados.'
                        : null,
                    onSaved: (val) {
                      _largura = double.tryParse(val);
                    },
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
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
                labelText: "Digite o comprimento",
                hintStyle: TextStyle(
                  color: Colors.black26,
                  fontSize: 16,
                  fontFamily: 'Fira Sans',
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Por favor, insira os dados.'
                  : null,
              onSaved: (val) {
                _comprimento = double.tryParse(val);
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
                  _resultado = "??rea: " +
                      (_largura * _comprimento).toStringAsFixed(2) +
                      ((_unitSelected == 1) ? ' m' : ' cm') +
                      '??' +
                      "\nPer??metro: " +
                      ((_largura * 2) + (_comprimento * 2)).toStringAsFixed(2) +
                      ((_unitSelected == 1) ? ' m' : ' cm');
                });
              }
            },
            onTapSecond: () {
              setState(() {
                _resultado = "";
              });
            },
          ),
          Resultado(label: _resultado),
        ],
      ),
    );
  }
}
