import 'package:adv_flutter_lab/Lab5/named_route_second.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/first',
    getPages: [
      GetPage(name: '/first', page: () => FirstScreen()),
      GetPage(name: '/second', page: () => SecondScreenNamedRoute()),
    ],
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed('/second');
          },
          child: Text("Go to Second Screen"),
        ),
      ),
    );
  }
}