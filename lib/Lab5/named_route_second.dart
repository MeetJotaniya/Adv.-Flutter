import 'package:flutter/material.dart';

class SecondScreenNamedRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(child: Text("This is the Second Screen")),
    );
  }
}