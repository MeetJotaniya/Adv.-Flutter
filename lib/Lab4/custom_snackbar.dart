import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar extends StatelessWidget {
  const CustomSnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom SnackBar", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.snackbar(
              "Custom Snackbar",
              "SnackBar Is Visible",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.yellowAccent,
              colorText: Colors.black,
            );
          },
          child: Text("Show SnackBar"),
        ),
      ),
    );
  }
}
