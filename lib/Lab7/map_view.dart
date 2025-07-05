import 'package:adv_flutter_lab/Lab7/map_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapView extends StatefulWidget {
  MapView({super.key});

  ListController controller = Get.put(ListController());

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Crud With GetX"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
          ),
          ElevatedButton(
            onPressed: () {
              if (widget.controller.isEdit.value) {
                widget.controller.updateUser(
                    widget.controller.index.value, nameController.text);
                widget.controller.isEdit.value = false;
              } else {
                widget.controller.add(nameController.text);
              }
              nameController.clear();
            },
            child: Obx(() =>
                Text(widget.controller.isEdit.value ? "Update" : "Submit")),
          ),

          Expanded(child: Obx(
                () {
              return ListView.builder(
                  itemCount: widget.controller.usersList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(widget.controller.usersList[index]["name"]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: () {
                              widget.controller.isEdit.value = true;
                              widget.controller.index.value = index;
                              nameController.text = widget.controller.usersList[index]["name"];
                            }, icon: Icon(Icons.edit_outlined)),

                            IconButton(
                              onPressed: () {
                                final item = widget.controller.usersList[index];
                                item["isFav"] = !item["isFav"];
                                widget.controller.usersList[index] = Map<String, dynamic>.from(item);
                              },
                              icon: Icon(widget.controller.usersList[index]["isFav"] ? Icons.favorite : Icons.favorite_border_outlined) , color: Colors.red,),

                            IconButton(onPressed: () {
                              widget.controller.deleteUser(index);
                            }, icon: Icon(Icons.delete , color: Colors.red,))
                          ],
                        )
                    );
                  });
            },
          ))
        ],
      ),
    );
    ;
  }
}