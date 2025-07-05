import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreenData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final receivedData = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(
        child: Text(
          "Received: $receivedData",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}