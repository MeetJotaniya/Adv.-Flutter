import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController {
  RxInt seconds = 10.obs;

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      seconds.value--;
    });
  }
}