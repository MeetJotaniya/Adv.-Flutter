import 'package:adv_flutter_lab/Lab5/second_screen_mid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstScreenMid extends StatelessWidget {
  const FirstScreenMid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Get.toNamed('/second');
        }, child: Text("Go to second screen")),
      ),
    );
  }
}
