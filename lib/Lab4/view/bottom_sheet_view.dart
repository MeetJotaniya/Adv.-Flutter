import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Sheet Using GetX")),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text("GetX Bottom Sheet"),
              onTap: () {
                Get.bottomSheet(
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("This is Bottom Sheet"),
                        ),
                        ListTile(
                          title: Text("This is Bottom Sheet Data"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
