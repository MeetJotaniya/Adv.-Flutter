import 'package:adv_flutter_lab/Lab6/non_reaction_controller.dart';
import 'package:flutter/material.dart';

class NonReaction extends StatelessWidget {
   NonReaction({super.key});
  CounterController controller = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Non Reactive"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${controller.counter}'),
          ElevatedButton(onPressed: (){
            controller.increment();
          }, child: Text("increase"))
        ],
      ),
    );

  }
}
