import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Dialog", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          Get.defaultDialog(title: "Dialog",
              middleText: "Are You Sure?",
              textCancel: "Cancel",
              textConfirm: "Confirm",
              backgroundColor: Colors.blueGrey,
            onCancel: Get.back,
            onConfirm: Get.back,

          );
        }, child: Text("Custom Dialog")),
      ),
    );
  }
}
