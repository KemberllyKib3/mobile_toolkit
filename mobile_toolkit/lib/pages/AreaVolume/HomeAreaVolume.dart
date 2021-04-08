import 'package:flutter/material.dart';
import 'package:mobile_toolkit/pages/AreaVolume/AreaCalculator.dart';
import 'package:mobile_toolkit/pages/AreaVolume/VolumeCalculator.dart';

class HomeAreaVolume extends StatefulWidget {
  @override
  _HomeAreaVolumeState createState() => _HomeAreaVolumeState();
}

class _HomeAreaVolumeState extends State<HomeAreaVolume>
    with TickerProviderStateMixin {
  TabController tb;

  @override
  void initState() {
    tb = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Área e Volume',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Fira Sans",
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          tabs: [
            Text("Área (2D)"),
            Text("Volume (3D)"),
          ],
          labelPadding: EdgeInsets.only(top: 10, bottom: 10),
          labelStyle: TextStyle(
            fontFamily: "Fira Sans",
            fontSize: 16,
          ),
          unselectedLabelColor: Colors.white54,
          controller: tb,
        ),
      ),
      body: TabBarView(
        controller: tb,
        children: [
          AreaCalculator(),
          VolumeCalculator(),
        ],
      ),
    );
  }
}
