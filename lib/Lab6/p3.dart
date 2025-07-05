import 'package:adv_flutter_lab/Lab6/p3_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BindTextField extends StatelessWidget {
  final TextFieldController controller = Get.put(TextFieldController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RxString TextField")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                controller.inputText.value = value;
              },
              decoration: InputDecoration(labelText: 'Enter Text'),
            ),
            SizedBox(height: 20),
            Obx(() => Text(
              'You typed: ${controller.inputText}',
              style: TextStyle(fontSize: 18),
            )),
          ],
        ),
      ),
    );
  }
}
