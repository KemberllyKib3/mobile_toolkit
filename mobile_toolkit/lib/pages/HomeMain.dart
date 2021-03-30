import 'package:flutter/material.dart';
import 'package:mobile_toolkit/pages/Calculadora/HomeCalculator.dart';
import 'package:mobile_toolkit/pages/Conversor_de_Medidas/HomeConversorMedidas.dart';
import 'package:mobile_toolkit/pages/IMC/HomeIMC.dart';

import 'Conversor_de_Moedas/HomeConversorMoedas.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mobile Toolkit',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Fira Sans",
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeIMC(),
                ),
              );
            },
            title: Text(
              'Calculadora de IMC',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontFamily: "Fira Sans",
                fontWeight: FontWeight.bold,
              ),
            ),
            // leading: Icon(Icons.add),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black87,
            ),
            subtitle: Text("Calcular Índice de Massa Corpórea"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeCalculator(),
                ),
              );
            },
            title: Text(
              'Calculadora',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontFamily: "Fira Sans",
                fontWeight: FontWeight.bold,
              ),
            ),
            // leading: Icon(Icons.add),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black87,
            ),
            subtitle: Text("Fazer cálculos matemáticos"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeConversorMoedas(),
                ),
              );
            },
            title: Text(
              'Conversor de Moedas',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontFamily: "Fira Sans",
                fontWeight: FontWeight.bold,
              ),
            ),
            // leading: Icon(Icons.add),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black87,
            ),
            subtitle: Text("Converte diferentes tipos de moedas"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeConversorMedidas(),
                ),
              );
            },
            title: Text(
              'Conversor de Medidas',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontFamily: "Fira Sans",
                fontWeight: FontWeight.bold,
              ),
            ),
            // leading: Icon(Icons.add),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black87,
            ),
            subtitle: Text("Converte diferentes tipos de medidas"),
          ),
        ],
      ),
    );
  }
}
