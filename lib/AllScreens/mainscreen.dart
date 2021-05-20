import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const idScreen = "main";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainScreeState();
  }
}

class _MainScreeState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
    );
  }

}