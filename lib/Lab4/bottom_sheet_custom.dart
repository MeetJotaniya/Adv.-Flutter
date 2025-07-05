import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetCustom extends StatelessWidget {
  const BottomSheetCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Custom Bottom Sheet",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text("GetX Bottom Sheet"),
              onTap: () {
                Get.bottomSheet(
                  Container(
                    height: 100,
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
                          title: Text(":::This is Bottom Sheet Data:::"),
                        ),
                      ],
                    ),
                  ),
                );
                Future.delayed(Duration(seconds: 2), () {
                  if (Get.isBottomSheetOpen!) {
                    Get.back();
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
