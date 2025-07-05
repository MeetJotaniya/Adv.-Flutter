import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataPassedScreen extends StatefulWidget {
  DataPassedScreen({super.key});

  @override
  State<DataPassedScreen> createState() => _DataPassedScreenState();
}

class _DataPassedScreenState extends State<DataPassedScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Data Passing Screen"),
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Column(
          children: [
            Text(
              "Hello World" , style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}