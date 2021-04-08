import 'dart:async';

import 'package:flutter/material.dart';

class HomeCronometro extends StatefulWidget {
  HomeCronometro({Key key}) : super(key: key);

  @override
  _HomeCronometroState createState() => _HomeCronometroState();
}

class _HomeCronometroState extends State<HomeCronometro> {
  bool isStartPressed = true;
  bool isStopPressed = true;
  bool isResetPressed = true;
  String displayTime = '00:00:00';
  final dur = const Duration(seconds: 1);

  void startTimer() {
    Timer(dur, keeprunning);
  }

  void keeprunning() {
    if (cronometro.isRunning) {
      startTimer();
    }
    setState(() {
      displayTime = cronometro.elapsed.inHours.toString().padLeft(2, "0") +
          ":" +
          (cronometro.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
          ":" +
          (cronometro.elapsed.inSeconds % 60).toString().padLeft(2, "0");
    });
  }

  var cronometro = Stopwatch();

  void comecarCronometro() {
    setState(() {
      isStopPressed = false;
      isStartPressed = false;
    });
    cronometro.start();
    startTimer();
  }

  void pararCronometro() {
    setState(() {
      isStopPressed = true;
      isResetPressed = false;
    });
    cronometro.stop();
  }

  void reiniciarCronometro() {
    setState(() {
      isResetPressed = true;
      isStartPressed = true;
      displayTime = '00:00:00';
    });
    cronometro.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cronômetro',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Fira Sans",
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              child: Center(
                child: Text(
                  displayTime,
                  style: TextStyle(
                    fontSize: 60,
                    fontFamily: 'Fira Sans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        elevation: 3,
                        color: Colors.redAccent,
                        child: Text(
                          "Parar",
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
                        onPressed: isStopPressed ? null : pararCronometro,
                      ),
                      MaterialButton(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        elevation: 3,
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "Reiniciar",
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
                        onPressed: isResetPressed ? null : reiniciarCronometro,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: MaterialButton(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      elevation: 3,
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        "Começar",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Fira Sans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      height: 50,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: isStartPressed ? comecarCronometro : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
