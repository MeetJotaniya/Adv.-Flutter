//WAP to Display Error Messages Using SnackBar/Dialog.

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Lab83 extends StatefulWidget {
  const Lab83({super.key});

  @override
  State<Lab83> createState() => _Lab83State();
}

class _Lab83State extends State<Lab83> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Error Message",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: Column(
        children: [
          TextField(controller: nameController),
          ElevatedButton(
            onPressed: () {
              try {
                int a = int.parse(nameController.text);
                print("value of a : $a");
              } on FormatException {
                Get.snackbar(
                  "Error Message : ",
                  "Please enter value in formate.",
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.grey,
                  colorText: Colors.black,
                );
              }
              catch(e){
                print("Error msg is : $e");
              }
            },
            child: Text("Show Msg"),
          ),
        ],
      ),
    );
  }
}
