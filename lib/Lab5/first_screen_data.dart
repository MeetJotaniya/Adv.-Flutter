import 'package:adv_flutter_lab/Lab5/second_screen_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(home: FirstScreen()));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String dataToSend = "Hello from First Screen";

    return Scaffold(
      appBar: AppBar(title: Text("First Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(SecondScreenData(), arguments: dataToSend);
          },
          child: Text("Go to Second Screen"),
        ),
      ),
    );
  }
}