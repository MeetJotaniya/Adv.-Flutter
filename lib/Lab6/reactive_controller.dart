import 'package:get/get.dart';

class ReactiveCounterController extends GetxController {
  RxInt counter = 0.obs;

  void increment() {
    counter.value++;

  }
}
