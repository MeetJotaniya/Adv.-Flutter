import 'package:adv_flutter_lab/Lab6/non_reaction_controller.dart';
import 'package:adv_flutter_lab/Lab6/reactive_controller.dart';
import 'package:adv_flutter_lab/Lab6/timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Timer extends StatelessWidget {
  Timer({super.key});
  TimerController controller = TimerController();

  @override
  Widget build(BuildContext context) {
    controller.startTimer();
    return Scaffold(
      appBar: AppBar(title: Text("Timer"),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('${controller.seconds.value}')),
          ],
        ),
      ),
    );
  }
}
