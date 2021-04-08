import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobile_toolkit/pages/utils/ButtonsCalcularLimpar.dart';
import 'package:mobile_toolkit/pages/utils/Resultado.dart';

class HomeIMC extends StatefulWidget {
  @override
  _HomeIMCState createState() => _HomeIMCState();
}

class _HomeIMCState extends State<HomeIMC> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double _altura, _peso;
  String _resultado = "";

  final maskAltura =
      MaskTextInputFormatter(mask: "#.##", filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculadora de IMC',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Fira Sans",
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [maskAltura],
                  decoration: InputDecoration(
                    fillColor: Colors.black12,
                    hintText: "Digite sua altura (m)",
                    hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 20,
                      fontFamily: 'Fira Sans',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Por favor, insira os dados.'
                      : null,
                  onChanged: (value) {
                    setState(() => _altura = double.tryParse(value));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.black12,
                    hintText: "Digite seu peso (Kg)",
                    hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 20,
                      fontFamily: 'Fira Sans',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Por favor, insira os dados.'
                      : null,
                  onChanged: (value) {
                    setState(() => _peso = double.tryParse(value));
                  },
                ),
              ),
              MainSecondButtons(
                labelMain: "Calcular",
                labelSecond: "Limpar resultado",
                onTapMain: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    setState(() => _resultado = _calculaIMC(_altura, _peso));
                  }
                },
                onTapSecond: () {
                  setState(() => {_resultado = ""});
                },
              ),
              Resultado(label: _resultado),
            ],
          ),
        ),
      ),
    );
  }
}

String _calculaIMC(double altura, double peso) {
  double imcResult;
  String resultado;
  imcResult = peso / (altura * altura);

  if (imcResult < 16) {
    resultado = "IMC: ${imcResult.toStringAsPrecision(3)}\nMagreza Grave";
  } else if (imcResult >= 16 && imcResult < 17) {
    resultado = "IMC: ${imcResult.toStringAsPrecision(3)}\nMagreza Moderada";
  } else if (imcResult >= 17 && imcResult < 18.5) {
    resultado = "IMC: ${imcResult.toStringAsPrecision(3)}\nMagreza Leve";
  } else if (imcResult >= 18.5 && imcResult < 25) {
    resultado =
        "IMC: ${imcResult.toStringAsPrecision(3)}\nConsiderado Saudável";
  } else if (imcResult >= 25 && imcResult < 30) {
    resultado = "IMC: ${imcResult.toStringAsPrecision(3)}\nSobrepeso";
  } else if (imcResult >= 30 && imcResult < 35) {
    resultado = "IMC: ${imcResult.toStringAsPrecision(3)}\nObesidade Grau I";
  } else if (imcResult >= 35 && imcResult < 40) {
    resultado =
        "IMC: ${imcResult.toStringAsPrecision(3)}\nObesidade Grau II (severa)";
  } else if (imcResult >= 40) {
    resultado =
        "IMC: ${imcResult.toStringAsPrecision(3)}\nObesidade Grau III (mórbida)";
  }

  return resultado;
}

// void _limpaResultado() {}
