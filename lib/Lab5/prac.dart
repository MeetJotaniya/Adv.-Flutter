import 'package:adv_flutter_lab/Lab5/prac_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Prac extends StatelessWidget {
  Prac({super.key});

  PracController pracController = Get.put(PracController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo")),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Obx(
            () => Container(
              height: 50,
              width: 50,
              color: Colors.black.withOpacity(pracController.opacity.value),
            ),
          ),

          Obx(
            () => Slider(
              value: pracController.opacity.value,
              onChanged: (value) {
                pracController.setOpacity(value);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Notification"),
              Obx(
                () => Switch(
                  value: pracController.notification.value,
                  onChanged: (value) {
                    pracController.setNotification(value);
                  },
                ),
              ),
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      if (pracController.favFruitList.contains(
                        pracController.fruitList[index].toString(),
                      )) {
                        pracController.removeFromFavourite(
                          pracController.fruitList[index].toString(),
                        );
                      } else {
                        pracController.addToFavourite(
                          pracController.fruitList[index].toString(),
                        );
                      }
                    },
                    title: Text(pracController.fruitList[index].toString()),
                    trailing: Obx(() => Icon(
                      Icons.favorite,
                      color:
                      pracController.favFruitList.contains(
                        pracController.fruitList[index].toString(),
                      )
                          ? Colors.red
                          : Colors.grey,
                    ),)
                  ),
                );
              },
              itemCount: pracController.fruitList.length,
            ),
          ),
        ],
      ),
    );
  }
}
