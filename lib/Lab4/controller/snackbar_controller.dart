import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarController extends GetxController {
  void showSnackbar() {
    Get.snackbar(
      "Hello",
      "This is a GetX SnackBar",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black87,
      colorText: Colors.white,
    );
  }
}
