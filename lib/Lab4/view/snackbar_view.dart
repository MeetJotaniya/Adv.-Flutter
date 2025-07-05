import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/snackbar_controller.dart';

class SnackBarView extends StatelessWidget {
  final SnackBarController controller = Get.put(SnackBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SnackBar Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => controller.showSnackbar(),
          child: const Text('Show SnackBar'),
        ),
      ),
    );
  }
}
