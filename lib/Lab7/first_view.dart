import 'package:adv_flutter_lab/Lab7/first_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstView extends StatefulWidget {
  FirstView({super.key});

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  FirstController firstController = Get.put(FirstController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RxList CRUD", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: firstController.fruitList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(firstController.fruitList[index].toString()),
                trailing: Obx(() {
                  bool isFav = firstController.favFruitList.contains(
                    firstController.fruitList[index].toString(),
                  );
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (isFav) {
                            firstController.removeFromFavourite(
                              firstController.fruitList[index].toString(),
                            );
                          } else {
                            firstController.addToFavourite(
                              firstController.fruitList[index].toString(),
                            );
                          }
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: isFav ? Colors.red : Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          firstController.deleteFruit(index);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  );
                }),
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController fruitController = TextEditingController();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add Fruit"),
                content: TextField(
                  controller: fruitController,
                  decoration: InputDecoration(hintText: "Enter fruit name"),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (fruitController.text.trim().isNotEmpty) {
                        firstController.addFruit(fruitController.text.trim());
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text("Add"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Cancel"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}