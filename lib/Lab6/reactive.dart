import 'package:adv_flutter_lab/Lab6/non_reaction_controller.dart';
import 'package:adv_flutter_lab/Lab6/reactive_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reactive extends StatelessWidget {
  Reactive({super.key});
  ReactiveCounterController controller = ReactiveCounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Non Reactive"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text('${controller.counter.value}')),

          ElevatedButton(onPressed: (){
            controller.increment();
          }, child: Text("increase"))
        ],
      ),
    );
  }
}
