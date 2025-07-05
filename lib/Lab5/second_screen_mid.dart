import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreenMid extends StatefulWidget {
  const SecondScreenMid({super.key});

  @override
  State<SecondScreenMid> createState() => _SecondScreenMidState();
}

class _SecondScreenMidState extends State<SecondScreenMid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is Second Screen"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          Get.toNamed("/dataScreen");
        }, child: Text("Navigate back to first screen")),
      ),
    );
  }
}