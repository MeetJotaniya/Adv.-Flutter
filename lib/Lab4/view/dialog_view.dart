import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/dialog_controller.dart';
import '../model/dialog_model.dart';

class DialogView extends StatelessWidget {
  final DialogController controller = Get.put(DialogController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dialog Demo")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.showDialogBox(
              DialogModel(
                title: "Alert",
                message: "Are you sure you want to proceed?",
              ),
            );
          },
          child: Text("Show Dialog"),
        ),
      ),
    );
  }
}
