import 'package:adv_flutter_lab/Lab6/show_hide_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowHideView extends StatelessWidget {
  ShowHideView({super.key});

  final ShowHideController showHideController = ShowHideController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Hide view"),
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text(showHideController.isShow.value? "Show Text" : ""),),
            SizedBox(width: 20,),
            Obx(() => ElevatedButton(onPressed: (){
              showHideController.isShow.value = !showHideController.isShow.value;
            }, child: Text(showHideController.isShow.value? "Hide Text" : "Show Text")))
          ],
        ),
      ),
    );
  }
}